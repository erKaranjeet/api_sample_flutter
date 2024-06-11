import 'package:api_sample_flutter/ui/ai/utils/Utils.dart';
import 'package:flutter/material.dart' hide Ink;
import 'package:google_mlkit_digital_ink_recognition/google_mlkit_digital_ink_recognition.dart';

class DigitalInkView extends StatefulWidget {
  @override
  State<DigitalInkView> createState() => DigitalInkViewState();
}

class DigitalInkViewState extends State<DigitalInkView> {

  final DigitalInkRecognizerModelManager modelManager = DigitalInkRecognizerModelManager();
  final String language = 'en-US';
  late final DigitalInkRecognizer digitalInkRecognizer = DigitalInkRecognizer(languageCode: language);
  final Ink ink = Ink();
  List<StrokePoint> points = [];
  String recognizedText = '';

  @override
  void dispose() {
    digitalInkRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Digital Ink Recognition')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onPanStart: (DragStartDetails details) {
                  ink.strokes.add(Stroke());
                },
                onPanUpdate: (DragUpdateDetails details) {
                  setState(() {
                    final RenderObject? object = context.findRenderObject();
                    final localPosition = (object as RenderBox?)?.globalToLocal(details.localPosition);
                    if (localPosition != null) {
                      points = List.from(points)
                        ..add(StrokePoint(
                          x: localPosition.dx,
                          y: localPosition.dy,
                          t: DateTime.now().millisecondsSinceEpoch,
                        ));
                    }
                    if (ink.strokes.isNotEmpty) {
                      ink.strokes.last.points = points.toList();
                    }
                  });
                },
                onPanEnd: (DragEndDetails details) {
                  points.clear();
                  setState(() {});
                },
                child: CustomPaint(
                  painter: Signature(ink: ink),
                  size: Size.infinite,
                ),
              ),
            ),
            if (recognizedText.isNotEmpty)
              Text(
                'Candidates: $recognizedText',
                style: const TextStyle(fontSize: 23),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _recogniseText,
                    child: const Text('Read Text'),
                  ),
                  ElevatedButton(
                    onPressed: _clearPad,
                    child: const Text('Clear Pad'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _isModelDownloaded,
                    child: const Text('Check Model'),
                  ),
                  ElevatedButton(
                    onPressed: _downloadModel,
                    child: const Text('Download'),
                  ),
                  ElevatedButton(
                    onPressed: _deleteModel,
                    child: const Text('Delete'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _clearPad() {
    setState(() {
      ink.strokes.clear();
      points.clear();
      recognizedText = '';
    });
  }

  Future<void> _isModelDownloaded() async {
    Utils().show(
        'Checking if model is downloaded...',
        modelManager
            .isModelDownloaded(language)
            .then((value) => value ? 'downloaded' : 'not downloaded'),
        context,
        this);
  }

  Future<void> _deleteModel() async {
    Utils().show(
        'Deleting model...',
        modelManager
            .deleteModel(language)
            .then((value) => value ? 'success' : 'failed'),
        context,
        this);
  }

  Future<void> _downloadModel() async {
    Utils().show(
        'Downloading model...',
        modelManager
            .downloadModel(language)
            .then((value) => value ? 'success' : 'failed'),
        context,
        this);
  }

  Future<void> _recogniseText() async {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Recognizing'),
        ),
        barrierDismissible: true);
    try {
      final candidates = await digitalInkRecognizer.recognize(ink);
      recognizedText = '';
      for (final candidate in candidates) {
        recognizedText += '\n${candidate.text}';
      }
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
    Navigator.pop(context);
  }
}

class Signature extends CustomPainter {
  Ink ink;

  Signature({required this.ink});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    for (final stroke in ink.strokes) {
      for (int i = 0; i < stroke.points.length - 1; i++) {
        final p1 = stroke.points[i];
        final p2 = stroke.points[i + 1];
        canvas.drawLine(Offset(p1.x.toDouble(), p1.y.toDouble()),
            Offset(p2.x.toDouble(), p2.y.toDouble()), paint);
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => true;
}