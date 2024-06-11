import 'package:api_sample_flutter/ui/ai/painter/segmentation_painter.dart';
import 'package:api_sample_flutter/ui/ai/widgets/camera_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_selfie_segmentation/google_mlkit_selfie_segmentation.dart';


class SelfieSegmenterView extends StatefulWidget {
  @override
  State<SelfieSegmenterView> createState() => SelfieSegmenterViewState();
}

class SelfieSegmenterViewState extends State<SelfieSegmenterView> {

  final SelfieSegmenter segmenter = SelfieSegmenter(
    mode: SegmenterMode.stream,
    enableRawSizeMask: true,
  );
  bool canProcess = true;
  bool isBusy = false;
  CustomPaint? customPaint;
  String? text;

  @override
  void dispose() async {
    canProcess = false;
    segmenter.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Selfie Segmenter',
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
    final mask = await segmenter.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null &&
        mask != null) {
      final painter = SegmentationPainter(
        mask,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
      );
      customPaint = CustomPaint(painter: painter);
    } else {
      customPaint = null;
    }
    isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}