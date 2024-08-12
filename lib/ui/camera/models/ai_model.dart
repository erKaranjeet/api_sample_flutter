import 'dart:io';

import 'package:image/src/image.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tFlite;
import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';
import 'package:tflite_flutter_plus/src/bindings/types.dart';

class AiModel {
  tFlite.Interpreter? interpreter;
  List<int>? inputShape;
  List<int>? outputShape;
  late tFlite.TfLiteType inputType;
  late tFlite.TfLiteType outputType;

  AiModel() {
    loadModel();
  }

  Future<void> loadModel() async {
    interpreter = await tFlite.Interpreter.fromAsset('model.tflite');
    var inputTensor = interpreter?.getInputTensor(0);
    var outputTensor = interpreter?.getOutputTensor(0);

    inputShape = inputTensor?.shape;
    outputShape = outputTensor?.shape;
    inputType = inputTensor?.type as tFlite.TfLiteType;
    outputType = outputTensor?.type as tFlite.TfLiteType;
  }

  TensorImage _preProcessImage(File image) {
    final imageProcessor = ImageProcessorBuilder()
        .add(ResizeOp(inputShape![1], inputShape![2], ResizeMethod.bilinear))
        .build();

    var tensorImage = TensorImage(inputType as TfLiteType);
    tensorImage.loadImage(image as Image);
    tensorImage = imageProcessor.process(tensorImage);

    return tensorImage;
  }

  List<double> postProcessOutput(TensorBuffer outputBuffer) {
    final output = outputBuffer.getDoubleList();
    return output;
  }

  Future<List<double>> runModel(File image) async {
    await loadModel();
    var inputImage = _preProcessImage(image);
    var outputBuffer = TensorBuffer.createFixedSize(outputShape!, outputType as TfLiteType);

    interpreter?.run(inputImage.buffer, outputBuffer.buffer);

    return postProcessOutput(outputBuffer);
  }
}