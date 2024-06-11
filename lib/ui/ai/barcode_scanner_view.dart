import 'package:api_sample_flutter/ui/ai/painter/barcode_detector_painter.dart';
import 'package:api_sample_flutter/ui/ai/widgets/camera_view.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

class BarcodeScannerView extends StatefulWidget {
  @override
  State<BarcodeScannerView> createState() => _BarcodeScannerViewState();
}

class _BarcodeScannerViewState extends State<BarcodeScannerView> {

  final BarcodeScanner barcodeScanner = BarcodeScanner();
  bool canProcess = true;
  bool isBusy = false;
  CustomPaint? customPaint;
  String? text;

  @override
  void dispose() {
    canProcess = false;
    barcodeScanner.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Barcode Scanner',
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
    final barcodes = await barcodeScanner.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = BarcodeDetectorPainter(
          barcodes, inputImage.metadata!.size, inputImage.metadata!.rotation);
      customPaint = CustomPaint(painter: painter);
    } else {
      String text = 'Barcodes found: ${barcodes.length}\n\n';
      for (final barcode in barcodes) {
        text += 'Barcode: ${barcode.rawValue}\n\n';
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