import 'dart:io';

import 'package:api_sample_flutter/ui/camera/models/ai_model.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CustomAICamera extends StatefulWidget {

  @override
  CustomAICameraState createState() => CustomAICameraState();
}

class CustomAICameraState extends State<CustomAICamera> {

  late CameraController controller;
  late Future<void> initializeControllerFuture;
  AiModel aiModel = AiModel();

  @override
  void initState() {
    super.initState();

    initializeCamera();
  }

  void initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    initializeControllerFuture = controller.initialize();
  }

  void applyFilter(File image) async {
    var results = await aiModel.runModel(image);
    // Apply the results to the image or use the results for something else
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera')),
      body: FutureBuilder<void>(
        future: initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await initializeControllerFuture;
            var path = join(
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );
            final file = await controller.takePicture();
            path = file.path;
            applyFilter(file as File);
            // Apply filters to the picture here
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}