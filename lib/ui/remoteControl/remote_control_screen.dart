import 'package:flutter/material.dart';

class RemoteControlScreen extends StatefulWidget {

  @override
  RemoteControlScreenState createState() => RemoteControlScreenState();
}

class RemoteControlScreenState extends State<RemoteControlScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(40.0),
              shape: BoxShape.rectangle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.white10,
                  blurRadius: 5.0,
                  offset: Offset(1.0, 1.0),
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/ic_on_off.png',
                width: 30.0,
                height: 30.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}