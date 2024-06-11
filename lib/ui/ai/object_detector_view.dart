import 'dart:io' as io;

import 'package:api_sample_flutter/ui/ai/painter/object_detector_painter.dart';
import 'package:api_sample_flutter/ui/ai/widgets/camera_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class ObjectDetectorView extends StatefulWidget {
  @override
  State<ObjectDetectorView> createState() => ObjectDetectorViewState();
}

class ObjectDetectorViewState extends State<ObjectDetectorView> {
  late ObjectDetector objectDetector;
  bool canProcess = false;
  bool isBusy = false;
  CustomPaint? customPaint;
  String? text;

  @override
  void initState() {
    super.initState();

    initializeDetector(DetectionMode.stream);
  }

  @override
  void dispose() {
    canProcess = false;
    objectDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Object Detector',
      customPaint: customPaint,
      text: text,
      onImage: (inputImage) {
        processImage(inputImage);
      },
      onScreenModeChanged: onScreenModeChanged,
      initialDirection: CameraLensDirection.back,
    );
  }

  void onScreenModeChanged(ScreenMode mode) {
    switch (mode) {
      case ScreenMode.gallery:
        initializeDetector(DetectionMode.single);
        return;

      case ScreenMode.liveFeed:
        initializeDetector(DetectionMode.stream);
        return;
    }
  }

  void initializeDetector(DetectionMode mode) async {
    print('Set detector in mode: $mode');

    // uncomment next lines if you want to use the default model
    // final options = ObjectDetectorOptions(
    //     mode: mode,
    //     classifyObjects: true,
    //     multipleObjects: true);
    // _objectDetector = ObjectDetector(options: options);

    // uncomment next lines if you want to use a local model
    // make sure to add tflite model to assets/ml
    const path = 'assets/ml/object_labeler.tflite';
    final modelPath = await getModel(path);
    final options = LocalObjectDetectorOptions(
      mode: mode,
      modelPath: modelPath,
      classifyObjects: true,
      multipleObjects: true,
    );
    objectDetector = ObjectDetector(options: options);

    // uncomment next lines if you want to use a remote model
    // make sure to add model to firebase
    // final modelName = 'bird-classifier';
    // final response =
    //     await FirebaseObjectDetectorModelManager().downloadModel(modelName);
    // print('Downloaded: $response');
    // final options = FirebaseObjectDetectorOptions(
    //   mode: mode,
    //   modelName: modelName,
    //   classifyObjects: true,
    //   multipleObjects: true,
    // );
    // _objectDetector = ObjectDetector(options: options);

    canProcess = true;
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!canProcess) return;
    if (isBusy) return;
    isBusy = true;
    setState(() {
      text = '';
    });
    final objects = await objectDetector.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = ObjectDetectorPainter(
          objects, inputImage.metadata!.rotation, inputImage.metadata!.size);
      customPaint = CustomPaint(painter: painter);
    } else {
      String text = 'Objects found: ${objects.length}\n\n';
      for (final object in objects) {
        text +=
        'Object:  trackingId: ${object.trackingId} - ${object.labels.map((e) => e.text)}\n\n';
      }
      text = text;
      // TODO: set _customPaint to draw boundingRect on top of image
      customPaint = null;
    }
    isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<String> getModel(String assetPath) async {
    if (io.Platform.isAndroid) {
      return 'flutter_assets/$assetPath';
    }
    final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
    await io.Directory(dirname(path)).create(recursive: true);
    final file = io.File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }
}