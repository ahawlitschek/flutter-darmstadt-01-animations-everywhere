import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedClipperSample extends StatefulWidget {
  @override
  _AnimatedClipperSampleState createState() => _AnimatedClipperSampleState();
}

class _AnimatedClipperSampleState extends State<AnimatedClipperSample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  static final _radiusTween = Tween<double>(begin: 42, end: 90);
  static final _radiusTweenTopLeft = Tween<double>(begin: 42, end: 70);
  static final _radiusTweenTopRight = Tween<double>(begin: 32, end: 66);
  static final _radiusTweenBottomLeft = Tween<double>(begin: 42, end: 62);
  static final _radiusTweenBottomRight = Tween<double>(begin: 52, end: 90);

  static final _easeTween = CurveTween(curve: Curves.ease);
  static final _easeInTween = CurveTween(curve: Curves.easeIn);

  Animation<double> _radiusAnimation;

  Animation<double> _radiusAnimationTopLeft;

  Animation<double> _radiusAnimationTopRight;

  Animation<double> _radiusAnimationBottomLeft;

  Animation<double> _radiusAnimationBottomRight;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _radiusAnimation = _controller.drive(_radiusTween.chain(_easeTween));
    _radiusAnimationTopLeft =
        _controller.drive(_radiusTweenTopLeft.chain(_easeInTween));
    _radiusAnimationTopRight =
        _controller.drive(_radiusTweenTopRight.chain(_easeTween));
    _radiusAnimationBottomLeft =
        _controller.drive(_radiusTweenBottomLeft.chain(_easeTween));
    _radiusAnimationBottomRight =
        _controller.drive(_radiusTweenBottomRight.chain(_easeInTween));
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
        title: Text('AnimatedBuilder'),
      ),
      body: AnimatedBuilder(
        animation: _radiusAnimation,
        builder: (context, child) {
          return ClipPath(
            clipper: CustomBorerClipper(
              _radiusAnimationTopLeft.value,
              _radiusAnimationTopRight.value,
              _radiusAnimationBottomLeft.value,
              _radiusAnimationBottomRight.value,
            ),
            child: child,
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple.shade400, Colors.orange]),
          ),
          child: Center(
              child: Text(
            'I like to move it',
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.1),
          )),
        ),
      ),
    );
  }
}

class CustomBorerClipper extends CustomClipper<Path> {
  final Random random = Random();

  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  CustomBorerClipper(
      this.topLeft, this.topRight, this.bottomLeft, this.bottomRight);

  @override
  getClip(Size size) {
    final path = Path();

    //final topLeft = random.nextInt(2) - 1 + _value;
    //final topRight = random.nextInt(2) - 1 + _value;
    //final bottomLeft = random.nextInt(2) - 1 + _value;
    //final bottomRight = random.nextInt(2) - 1 + _value;

    path.addRRect(RRect.fromLTRBAndCorners(
      16,
      16,
      size.width - 16,
      size.height - 16,
      topLeft: Radius.elliptical(topLeft, topLeft),
      topRight: Radius.elliptical(topRight, topRight),
      bottomLeft: Radius.elliptical(bottomLeft, bottomLeft),
      bottomRight: Radius.elliptical(bottomRight, bottomRight),
    ));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
