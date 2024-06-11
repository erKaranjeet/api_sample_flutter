import 'package:api_sample_flutter/ui/ai/painter/face_detector_painter.dart';
import 'package:api_sample_flutter/ui/ai/widgets/camera_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectorView extends StatefulWidget {

  @override
  State<FaceDetectorView> createState() => FaceDetectorViewState();
}

class FaceDetectorViewState extends State<FaceDetectorView> {
  final FaceDetector faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableClassification: true,
    ),
  );
  bool canProcess = true;
  bool isBusy = false;
  CustomPaint? customPaint;
  String? text;

  @override
  void dispose() {
    canProcess = false;
    faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Face Detector',
      customPaint: customPaint,
      text: text,
      onImage: (inputImage) {
        processImage(inputImage);
      },
      initialDirection: CameraLensDirection.front,
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!canProcess) return;
    if (isBusy) return;
    isBusy = true;
    setState(() {
      text = '';
    });
    final faces = await faceDetector.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = FaceDetectorPainter(
          faces, inputImage.metadata!.size, inputImage.metadata!.rotation);
      customPaint = CustomPaint(painter: painter);
    } else {
      String text = 'Faces found: ${faces.length}\n\n';
      for (final face in faces) {
        text += 'face: ${face.boundingBox}\n\n';
      }
      text = text;
      customPaint = null;
    }
    isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}