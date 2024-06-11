import 'package:api_sample_flutter/ui/ai/painter/text_detector_painter.dart';
import 'package:api_sample_flutter/ui/ai/widgets/camera_view.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';


class TextRecognizerView extends StatefulWidget {
  @override
  State<TextRecognizerView> createState() => TextRecognizerViewState();
}

class TextRecognizerViewState extends State<TextRecognizerView> {

  final TextRecognizer textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  bool canProcess = true;
  bool isBusy = false;
  CustomPaint? customPaint;
  String? text;

  @override
  void dispose() async {
    canProcess = false;
    textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Text Detector',
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
    final recognizedText = await textRecognizer.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = TextRecognizerPainter(recognizedText,
          inputImage.metadata!.size, inputImage.metadata!.rotation);
      customPaint = CustomPaint(painter: painter);
    } else {
      text = 'Recognized text:\n\n${recognizedText.text}';
      customPaint = null;
    }
    isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}