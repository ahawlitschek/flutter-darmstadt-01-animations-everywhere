import 'dart:math';

import 'package:flutter/material.dart';

class TransformExample extends StatefulWidget {
  @override
  _TransformExampleState createState() => _TransformExampleState();
}

class _TransformExampleState extends State<TransformExample> {
  double _endValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 2 * 16.0) / 2;
    final xOffset = width / 2;
    final yOffset = xOffset - (xOffset * sqrt(2) / 2);

    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: <Widget>[
                  _buildAnimatedColorSquare(
                    Colors.blue.shade900,
                    durationInMs: 500,
                    xOffset: xOffset,
                    yOffset: yOffset,
                    scale: 0.5,
                    angle: pi / 4.0,
                  ),
                  _buildAnimatedColorSquare(
                    Colors.blue.shade700,
                    durationInMs: 250,
                    xOffset: -yOffset,
                    yOffset: xOffset,
                    scale: 0.5,
                    angle: -pi / 4.0,
                  ),
                  _buildAnimatedColorSquare(
                    Colors.blue.shade500,
                    durationInMs: 750,
                    xOffset: yOffset,
                    yOffset: -xOffset,
                    scale: 0.5,
                    angle: -pi / 4.0,
                  ),
                  _buildAnimatedColorSquare(
                    Colors.blue.shade300,
                    durationInMs: 1000,
                    xOffset: -xOffset,
                    yOffset: -yOffset,
                    scale: 0.5,
                    angle: pi / 4.0
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('Animate'),
              onPressed: () {
                setState(() {
                  _endValue = _endValue == 1.0 ? 0.0 : 1.0;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  _buildAnimatedColorSquare(Color color,
      {int durationInMs,
      double xOffset,
      double yOffset,
      double scale,
      double angle}) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: durationInMs),
      curve: Curves.easeInOutCirc,
      tween: Tween<double>(begin: 0.0, end: _endValue),
      builder: (BuildContext context, double value, Widget child) {
        return Transform.translate(
          offset: Offset(xOffset * value, yOffset * value),
          child: Transform.scale(
            scale: 1.0 - value * scale,
            child: Transform.rotate(
              angle: -value * angle,
              child: child,
            ),
          ),
        );
      },
      child: Container(
        color: color,
      ),
    );
  }
}
