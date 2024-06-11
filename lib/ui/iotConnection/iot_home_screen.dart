import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOTHomeScreen extends StatefulWidget {

  @override
  IOTHomeScreenState createState() => IOTHomeScreenState();
}

class IOTHomeScreenState extends State<IOTHomeScreen> {

  bool isOnOff = false;
  late DatabaseReference reference;

  @override
  void initState() {
    super.initState();

    reference = FirebaseDatabase.instance.reference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isOnOff ? Icons.lightbulb : Icons.lightbulb_outline,
            size: 100.0,
            color: isOnOff ? Colors.amber : Colors.transparent,
          ),
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: isOnOff ? Colors.green : Colors.white10,
            ),
            onPressed: () {
              reference.child('Light').set({'switch': !isOnOff});
              setState(() {
                isOnOff = !isOnOff;
              });
            },
            child: Text(
              isOnOff ? 'LED ON' : 'LED OFF',
            ),
          ),
        ],
      ),
    );
  }
}