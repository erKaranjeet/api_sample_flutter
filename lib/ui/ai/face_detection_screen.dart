import 'dart:ui';

import 'package:api_sample_flutter/ui/ai/barcode_scanner_view.dart';
import 'package:api_sample_flutter/ui/ai/digital_ink_view.dart';
import 'package:api_sample_flutter/ui/ai/face_detector_view.dart';
import 'package:api_sample_flutter/ui/ai/helpers/entity_extraction_view.dart';
import 'package:api_sample_flutter/ui/ai/helpers/language_identifier_view.dart';
import 'package:api_sample_flutter/ui/ai/helpers/language_translator_view.dart';
import 'package:api_sample_flutter/ui/ai/helpers/smart_reply_view.dart';
import 'package:api_sample_flutter/ui/ai/image_label_view.dart';
import 'package:api_sample_flutter/ui/ai/object_detector_view.dart';
import 'package:api_sample_flutter/ui/ai/pose_detector_view.dart';
import 'package:api_sample_flutter/ui/ai/selfie_segmenter_view.dart';
import 'package:api_sample_flutter/ui/ai/text_recognizer_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FaceDetectionScreen extends StatefulWidget {

  @override
  FaceDetectionScreenState createState() => FaceDetectionScreenState();
}

class FaceDetectionScreenState extends State<FaceDetectionScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      primary: true,
      extendBody: false,
      appBar: AppBar(
        // true to show back button else false
        automaticallyImplyLeading: true,
        title: const Text("AI Components"),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/background_cat.png",
            width: double.infinity,
            height: double.infinity,
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      ExpansionTile(
                        title: const Text('Vision APIs', style: TextStyle(color: Colors.white),),
                        children: [
                          CustomCard('Barcode Scanning', BarcodeScannerView()),
                          CustomCard('Face Detection', FaceDetectorView()),
                          CustomCard('Image Labeling', ImageLabelView()),
                          CustomCard('Object Detection', ObjectDetectorView()),
                          CustomCard('Text Recognition', TextRecognizerView()),
                          CustomCard('Digital Ink Recognition', DigitalInkView()),
                          CustomCard('Pose Detection', PoseDetectorView()),
                          CustomCard('Selfie Segmentation', SelfieSegmenterView()),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ExpansionTile(
                        title: const Text('Natural Language APIs', style: TextStyle(color: Colors.white),),
                        children: [
                          CustomCard('Language ID', LanguageIdentifierView()),
                          CustomCard('On-device Translation', LanguageTranslatorView()),
                          CustomCard('Smart Reply', SmartReplyView()),
                          CustomCard('Entity Extraction', EntityExtractionView()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {

  final String _label;
  final Widget _viewPage;
  final bool featureCompleted;

  const CustomCard(this._label, this._viewPage, {this.featureCompleted = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor,
        title: Text(
          _label,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          if (!featureCompleted) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('This feature has not been implemented yet', style: TextStyle(color: Colors.white),)));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => _viewPage));
          }
        },
      ),
    );
  }
}