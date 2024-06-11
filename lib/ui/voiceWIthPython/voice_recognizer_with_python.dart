import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VoiceRecognizerWithPython extends StatefulWidget {

  @override
  VoiceRecognizerWithPythonState createState() => VoiceRecognizerWithPythonState();
}

class VoiceRecognizerWithPythonState extends State<VoiceRecognizerWithPython> {

  String _recognizedText = "Press the button to record voice";

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      _sendToServer(file);
    } else {
      // User canceled the picker
    }
  }

  Future<void> _sendToServer(PlatformFile file) async {
    var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:5000/recognize'));
    request.files.add(await http.MultipartFile.fromPath('file', file.path!));
    var res = await request.send();
    if (res.statusCode == 200) {
      var response = await http.Response.fromStream(res);
      var data = jsonDecode(response.body);
      setState(() {
        _recognizedText = data['text'];
      });
    } else {
      setState(() {
        _recognizedText = 'Error recognizing voice';
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Recognizer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_recognizedText),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Record Voice'),
            ),
          ],
        ),
      ),
    );
  }
}