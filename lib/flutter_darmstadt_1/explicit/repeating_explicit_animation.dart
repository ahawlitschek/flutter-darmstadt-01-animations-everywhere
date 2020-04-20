import 'dart:math';

import 'package:flutter/material.dart';

class RepeatingExplicitAnimation extends StatefulWidget {
  @override
  _RepeatingExplicitAnimationState createState() =>
      _RepeatingExplicitAnimationState();
}

class _RepeatingExplicitAnimationState extends State<RepeatingExplicitAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, upperBound: 1, duration: Duration(milliseconds: 5000));
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repeating Explicit'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RotationTransition(
              turns: _controller,
              child: FlutterLogo(size: 128),
            ),
            const SizedBox(height: 24),
            RaisedButton(child: Text('Start/Stop'),onPressed: (){
              if(_controller.isAnimating){
                _controller.reverse();
              }else{
                _controller.repeat();
              }
            },)
          ],
        ),
      ),
    );
  }
}
