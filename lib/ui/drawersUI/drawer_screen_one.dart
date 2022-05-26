import 'dart:ui';

import 'package:api_sample_flutter/utils/drawer_painter.dart';
import 'package:flutter/material.dart';

class DrawerScreenOne extends StatefulWidget {

  @override
  DrawerScreenOneState createState() => DrawerScreenOneState();
}

class DrawerScreenOneState extends State<DrawerScreenOne> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Drawer Screen One"),
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
        ],
      ),
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
              child: ListView(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                children: [
                  Text("Menu Name",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}