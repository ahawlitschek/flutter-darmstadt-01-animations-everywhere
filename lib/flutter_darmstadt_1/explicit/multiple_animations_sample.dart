import 'package:flutter/material.dart';

class MultipleAnimationsSample extends StatefulWidget {
  @override
  _MultipleAnimationsSampleState createState() =>
      _MultipleAnimationsSampleState();
}

class _MultipleAnimationsSampleState extends State<MultipleAnimationsSample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);

  static final Animatable<double> _bounceOutTween =
      CurveTween(curve: Curves.bounceOut);

  static final Animatable<double> _easeInBackTween =
      CurveTween(curve: Curves.easeInBack);

  static final Animatable<double> _quarterTween =
      Tween<double>(begin: 0.0, end: 1.0 / 8);
  static final Animatable<Offset> _offsetTween =
      Tween<Offset>(begin: Offset(0, 0), end: Offset(0.7, 0));

  Animation<double> _iconTurns;
  Animation<Offset> _slideOffset;
  Animation<double> _dotScale;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 4000));
    _iconTurns = _controller.drive(_quarterTween.chain(_easeInBackTween));
    _slideOffset = _controller.drive(_offsetTween.chain(_easeInTween));
    _dotScale = _controller.drive(_bounceOutTween);
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
        title: Text('Multiple Animations'),
      ),
      body: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: InkWell(
          onTap: _toggleAnimation,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SlideTransition(
                      position: _slideOffset,
                      child: Container(
                        child: Text('Headline'),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: RotationTransition(
                          turns: _iconTurns, child: Icon(Icons.add)),
                      onPressed: _toggleAnimation,
                    ),
                  ],
                ),
                ScaleTransition(
                  scale: _dotScale,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _toggleAnimation() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }
}
