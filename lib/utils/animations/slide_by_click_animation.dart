import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SlideByClickAnimation extends StatelessWidget {

  late final Widget child;
  late final CustomAnimationControl control;

  SlideByClickAnimation(this.child, this.control);

  @override
  Widget build(BuildContext context) {
    return CustomAnimation<double>(
      duration: const Duration(seconds: 1),
      control: control, // bind state variable to parameter
      tween: Tween(begin: -100.0, end: 100.0),
      builder: (context, child, value) {
        return Transform.translate(
          // animation that moves childs from left to right
          offset: Offset(value, 0),
          child: child,
        );
      },
      // child: MaterialButton(
      //   // there is a button
      //   color: Colors.yellow,
      //   onPressed:
      //   toggleDirection, // clicking button changes animation direction
      //   child: const Text('Swap'),
      // ),
    );
  }

  // void toggleDirection() {
  //   // toggle between control instructions
  //   setState(() {
  //     control = (control == Control.play) ? Control.playReverse : Control.play;
  //   });
  // }
}