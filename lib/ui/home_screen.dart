import 'dart:ui';

import 'package:api_sample_flutter/models/home_menus_model.dart';
import 'package:api_sample_flutter/ui/3dUI/neumor_ui_screen.dart';
import 'package:api_sample_flutter/ui/ai/face_detection_screen.dart';
import 'package:api_sample_flutter/ui/ar/augmented_reality_screen.dart';
import 'package:api_sample_flutter/ui/bluetoothConnection/bluetooth_home_screen.dart';
import 'package:api_sample_flutter/ui/camera/custom_ai_camera.dart';
import 'package:api_sample_flutter/ui/components/range_slider_screen.dart';
import 'package:api_sample_flutter/ui/drawersUI/drawer_screen_four.dart';
import 'package:api_sample_flutter/ui/drawersUI/drawer_screen_one.dart';
import 'package:api_sample_flutter/ui/drawersUI/drawer_screen_three.dart';
import 'package:api_sample_flutter/ui/drawersUI/drawer_screen_two.dart';
import 'package:api_sample_flutter/ui/graphQl/graph_ql_api_call_screen.dart';
import 'package:api_sample_flutter/ui/voiceWIthPython/voice_recognizer_with_python.dart';
import 'package:flutter/material.dart';

const List<HomeMenusModel> choiceMenus = <HomeMenusModel>[
  HomeMenusModel(name: 'Home', icon: Icons.home),
  HomeMenusModel(name: 'Contact', icon: Icons.contacts),
  HomeMenusModel(name: 'Map', icon: Icons.map),
  HomeMenusModel(name: 'Phone', icon: Icons.phone),
  HomeMenusModel(name: 'Camera', icon: Icons.camera_alt),
  HomeMenusModel(name: 'Setting', icon: Icons.settings),
  HomeMenusModel(name: 'Album', icon: Icons.photo_album),
  HomeMenusModel(name: 'WiFi', icon: Icons.wifi),
  HomeMenusModel(name: 'Neumor UI', icon: Icons.add_circle),
  HomeMenusModel(name: 'AI Filters Camera', icon: Icons.add_circle),
  HomeMenusModel(name: 'GraphQl API Call', icon: Icons.graphic_eq_rounded),
];

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<StatefulWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Home"),
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
          GridView.count(
            padding: const EdgeInsets.all(4.0),
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            children: List.generate(choiceMenus.length, (index) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    ItemClicked(index);
                  },
                  child: SelectCard(
                    choiceMenu: choiceMenus[index],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  void ItemClicked(int index) {
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DrawerScreenOne()));
    } else if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DrawerScreenTwo()));
    } else if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DrawerScreenThree()));
    } else if (index == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DrawerScreenFour()));
    } else if (index == 4) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => FaceDetectionScreen()));
    } else if (index == 5) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => BluetoothHomeScreen()));
    } else if (index == 6) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => VoiceRecognizerWithPython()));
    } else if (index == 7) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => RangeSliderScreen()));
    } else if (index == 8) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => NeumorUiScreen()));
    } else if (index == 9) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CustomAICamera()));
    } else if (index == 10) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => GraphQlAPICallScreen()));
    }
  }
}

class SelectCard extends StatelessWidget {

  SelectCard({required this.choiceMenu});

  HomeMenusModel choiceMenu;

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = Theme.of(context).textTheme.titleMedium;

    return Card(
      color: Colors.white.withOpacity(0.5),
      child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Icon(
                  choiceMenu.icon,
                  size: 40.0,
                  color: style?.color,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  choiceMenu.name!,
                  style: style,
                ),
              ),
            ]),
      ),
    );
  }
}
