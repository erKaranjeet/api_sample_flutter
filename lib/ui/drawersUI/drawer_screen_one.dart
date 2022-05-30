// @dart=2.9
import 'dart:ui';

import 'package:api_sample_flutter/utils/drawer_painter.dart';
import 'package:flutter/material.dart';

class DrawerScreenOne extends StatefulWidget {

  @override
  DrawerScreenOneState createState() => DrawerScreenOneState();
}

class DrawerScreenOneState extends State<DrawerScreenOne> {

  List<String> menuNameList;

  @override
  void initState() {
    super.initState();
    menuNameList = [];
    for (int i=0; i<10; i++) {
      menuNameList.add("Menu Name " + i.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      primary: true,
      appBar: AppBar(
        title: const Text("Drawer Screen One"),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.dehaze),
        ),
      ),
      body: Scaffold(
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: Drawer(
            elevation: 5.0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: CustomPaint(
                painter: DrawerPainter(
                  color: Colors.white60.withOpacity(0.7),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  itemCount: menuNameList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Text(
                        menuNameList[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) => Container(),
                ),
              ),
            ),
          ),
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
          ],
        ),
      ),
    );
  }
}