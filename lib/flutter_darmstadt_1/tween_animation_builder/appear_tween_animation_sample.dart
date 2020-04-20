import 'dart:math';

import 'package:flutter/material.dart';

class AppearTweenAnimationSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appear Tween Animation'),
      ),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 5000),
          builder: (context, value, Widget child) {
            return Transform.rotate(
              angle: 2 * pi * value,
              child: Transform.scale(
                scale: value,
                child: child,
              ),
            );
          },
          child: FlutterLogo(size: 120),
        ),
      ),
    );
  }
}
