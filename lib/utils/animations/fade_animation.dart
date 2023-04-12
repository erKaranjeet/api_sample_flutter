import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimationProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {

  late final double delay;
  late final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimationProps>()
      ..add(AnimationProps.opacity, Tween(begin: 0.0, end: 1.0))
      ..add(AnimationProps.translateY, Tween(begin: -30.0, end: 0.0), const Duration(milliseconds: 500), Curves.easeOut);

    return PlayAnimation<MultiTweenValues<AnimationProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AnimationProps.opacity),
        child: Transform.translate(
          offset: Offset(0, animation.get(AnimationProps.translateY)),
          child: child,
        ),
      ),
    );
  }
}