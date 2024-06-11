import 'dart:io';

import 'package:api_sample_flutter/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:image_picker/image_picker.dart';

enum ScreenMode { liveFeed, gallery }

class CameraView extends StatefulWidget {
  CameraView(
      {Key? key,
        required this.title,
        required this.customPaint,
        this.text,
        required this.onImage,
        this.onScreenModeChanged,
        this.initialDirection = CameraLensDirection.back})
      : super(key: key);

  final String title;
  final CustomPaint? customPaint;
  final String? text;
  final Function(InputImage inputImage) onImage;
  final Function(ScreenMode mode)? onScreenModeChanged;
  final CameraLensDirection initialDirection;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {

  ScreenMode mode = ScreenMode.liveFeed;
  CameraController? controller;
  File? image;
  String? path;
  ImagePicker? imagePicker;
  int cameraIndex = -1;
  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;
  final bool allowPicker = true;
  bool changingCameraLens = false;

  @override
  void initState() {
    super.initState();

    imagePicker = ImagePicker();

    if (cameras.any(
          (element) =>
      element.lensDirection == widget.initialDirection &&
          element.sensorOrientation == 90,
    )) {
      cameraIndex = cameras.indexOf(
        cameras.firstWhere((element) =>
        element.lensDirection == widget.initialDirection &&
            element.sensorOrientation == 90),
      );
    } else {
      for (var i = 0; i < cameras.length; i++) {
        if (cameras[i].lensDirection == widget.initialDirection) {
          cameraIndex = i;
          break;
        }
      }
    }

    if (cameraIndex != -1) {
      startLiveFeed();
    } else {
      mode = ScreenMode.gallery;
    }
  }

  @override
  void dispose() {
    stopLiveFeed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          if (allowPicker)
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: switchScreenMode,
                child: Icon(
                  mode == ScreenMode.liveFeed
                      ? Icons.photo_library_outlined
                      : (Platform.isIOS
                      ? Icons.camera_alt_outlined
                      : Icons.camera),
                ),
              ),
            ),
        ],
      ),
      body: body(),
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget? floatingActionButton() {
    if (mode == ScreenMode.gallery) return null;
    if (cameras.length == 1) return null;
    return SizedBox(
        height: 70.0,
        width: 70.0,
        child: FloatingActionButton(
          onPressed: switchLiveCamera,
          child: Icon(
            Platform.isIOS
                ? Icons.flip_camera_ios_outlined
                : Icons.flip_camera_android_outlined,
            size: 40,
          ),
        ));
  }

  Widget body() {
    Widget body;
    if (mode == ScreenMode.liveFeed) {
      body = liveFeedBody();
    } else {
      body = galleryBody();
    }
    return body;
  }

  Widget liveFeedBody() {
    if (controller?.value.isInitialized == false) {
      return Container();
    }

    final size = MediaQuery.of(context).size;
    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * controller!.value.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Transform.scale(
            scale: scale,
            child: Center(
              child: changingCameraLens
                  ? const Center(
                child: Text('Changing camera lens'),
              )
                  : CameraPreview(controller!),
            ),
          ),
          if (widget.customPaint != null) widget.customPaint!,
          Positioned(
            bottom: 100,
            left: 50,
            right: 50,
            child: Slider(
              value: zoomLevel,
              min: minZoomLevel,
              max: maxZoomLevel,
              onChanged: (newSliderValue) {
                setState(() {
                  zoomLevel = newSliderValue;
                  controller!.setZoomLevel(zoomLevel);
                });
              },
              divisions: (maxZoomLevel - 1).toInt() < 1
                  ? null
                  : (maxZoomLevel - 1).toInt(),
            ),
          )
        ],
      ),
    );
  }

  Widget galleryBody() {
    return ListView(shrinkWrap: true, children: [
      image != null
          ? SizedBox(
        height: 400,
        width: 400,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.file(image!),
            if (widget.customPaint != null) widget.customPaint!,
          ],
        ),
      )
          : const Icon(
        Icons.image,
        size: 200,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          child: const Text('From Gallery'),
          onPressed: () => _getImage(ImageSource.gallery),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          child: const Text('Take a picture'),
          onPressed: () => _getImage(ImageSource.camera),
        ),
      ),
      if (image != null)
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
              '${path == null ? '' : 'Image path: $path'}\n\n${widget.text ?? ''}'),
        ),
    ]);
  }

  Future _getImage(ImageSource source) async {
    setState(() {
      image = null;
      path = null;
    });
    final pickedFile = await imagePicker?.pickImage(source: source);
    if (pickedFile != null) {
      processPickedFile(pickedFile);
    }
    setState(() {});
  }

  void switchScreenMode() {
    image = null;
    if (mode == ScreenMode.liveFeed) {
      mode = ScreenMode.gallery;
      stopLiveFeed();
    } else {
      mode = ScreenMode.liveFeed;
      startLiveFeed();
    }
    if (widget.onScreenModeChanged != null) {
      widget.onScreenModeChanged!(mode);
    }
    setState(() {});
  }

  Future startLiveFeed() async {
    final camera = cameras[cameraIndex];
    controller = CameraController(
      camera,
      // Set to ResolutionPreset.high. Do NOT set it to ResolutionPreset.max because for some phones does NOT work.
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      controller?.getMinZoomLevel().then((value) {
        zoomLevel = value;
        minZoomLevel = value;
      });
      controller?.getMaxZoomLevel().then((value) {
        maxZoomLevel = value;
      });
      controller?.startImageStream(processCameraImage);
      setState(() {});
    });
  }

  Future stopLiveFeed() async {
    await controller?.stopImageStream();
    await controller?.dispose();
    controller = null;
  }

  Future switchLiveCamera() async {
    setState(() => changingCameraLens = true);
    cameraIndex = (cameraIndex + 1) % cameras.length;

    await stopLiveFeed();
    await startLiveFeed();
    setState(() => changingCameraLens = false);
  }

  Future processPickedFile(XFile? pickedFile) async {
    var path = pickedFile?.path;
    if (path == null) {
      return;
    }
    setState(() {
      image = File(path!);
    });
    path = path;
    final inputImage = InputImage.fromFilePath(path);
    widget.onImage(inputImage);
  }

  void processCameraImage(CameraImage image) {
    final inputImage = inputImageFromCameraImage(image);
    if (inputImage == null) return;
    widget.onImage(inputImage);
  }

  InputImage? inputImageFromCameraImage(CameraImage image) {
    // get camera rotation
    final camera = cameras[cameraIndex];
    final rotation =
    InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    if (rotation == null) return null;

    // get image format
    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    // validate format depending on platform
    // only supported formats:
    // * nv21 for Android
    // * bgra8888 for iOS
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) return null;

    // since format is constraint to nv21 or bgra8888, both only have one plane
    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    // compose InputImage using bytes
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation, // used only in Android
        format: format, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),
    );
  }
}