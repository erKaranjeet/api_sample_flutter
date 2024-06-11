import 'package:api_sample_flutter/ui/ai/painter/pose_painter.dart';
import 'package:api_sample_flutter/ui/ai/widgets/camera_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';


class PoseDetectorView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PoseDetectorViewState();
}

class PoseDetectorViewState extends State<PoseDetectorView> {
  final PoseDetector poseDetector = PoseDetector(options: PoseDetectorOptions());
  bool canProcess = true;
  bool isBusy = false;
  CustomPaint? customPaint;
  String? text;

  @override
  void dispose() async {
    canProcess = false;
    poseDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Pose Detector',
      customPaint: customPaint,
      text: text,
      onImage: (inputImage) {
        processImage(inputImage);
      },
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!canProcess) return;
    if (isBusy) return;
    isBusy = true;
    setState(() {
      text = '';
    });
    final poses = await poseDetector.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = PosePainter(poses, inputImage.metadata!.size, inputImage.metadata!.rotation);
      customPaint = CustomPaint(painter: painter);
    } else {
      text = 'Poses found: ${poses.length}\n\n';
      customPaint = null;
    }
    isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}