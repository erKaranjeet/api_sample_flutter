// @dart=2.9
import 'dart:ui';

import 'package:api_sample_flutter/models/home_menus_model.dart';
import 'package:api_sample_flutter/ui/drawersUI/drawer_screen_one.dart';
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
    }
  }
}

class SelectCard extends StatelessWidget {
  SelectCard({Key key, this.choiceMenu}) : super(key: key);

  HomeMenusModel choiceMenu;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.subtitle1;

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
                  color: style.color,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  choiceMenu.name,
                  style: style,
                ),
              ),
            ]),
      ),
    );
  }
}
