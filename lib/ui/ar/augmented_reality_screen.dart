// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class AugmentedRealityScreen extends StatefulWidget {

  @override
  AugmentedRealityScreenState createState() => AugmentedRealityScreenState();
}

class AugmentedRealityScreenState extends State<AugmentedRealityScreen> {

  // late ArCoreController arCoreController;

  @override
  void initState() {
    super.initState();
  }

  // void arViewCreated(ArCoreController arCoreController) {
  //   this.arCoreController = arCoreController;
  //   displayMapSphere(this.arCoreController);
  // }
  //
  // void displayMapSphere(ArCoreController arCoreController) async {
  //   final ByteData byteData = await rootBundle.load('images/earth_map.jpg');
  //
  //   final materials = ArCoreMaterial(
  //     color: Colors.blue,
  //     textureBytes: byteData.buffer.asUint8List(),
  //   );
  //
  //   final sphere = ArCoreSphere(materials: [materials]);
  //
  //   final node = ArCoreNode(
  //     shape: sphere,
  //     position: vector64.Vector3(0, 0, -1.5),
  //   );
  //
  //   this.arCoreController.addArCoreNode(node);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR Demo'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ArCoreView(
          //   onArCoreViewCreated: arViewCreated,
          // ),
        ],
      ),
    );
  }
}