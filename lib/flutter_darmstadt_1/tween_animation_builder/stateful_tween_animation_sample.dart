import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

class StatefulTweenAnimationSample extends StatefulWidget {
  StatefulTweenAnimationSample({Key key}) : super(key: key);

  @override
  _StatefulTweenAnimationSampleState createState() =>
      _StatefulTweenAnimationSampleState();
}

class _StatefulTweenAnimationSampleState
    extends State<StatefulTweenAnimationSample> {
  double _endValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Tween Animation Builder'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TweenAnimationBuilder<double>(
              curve: Curves.easeInOutCirc,
              duration: Duration(milliseconds: 4000),
              tween: Tween(begin: 0.0, end: _endValue),
              builder: (context, value, child) {
                return Column(
                  children: <Widget>[
                    Transform.rotate(
                      angle: value,
                      child: child,
                    ),
                    const SizedBox(height: 24),
                    Text('${degrees(value).toStringAsFixed(2)}° => ${degrees(_endValue)}')
                  ],
                );
              },
              child: FlutterLogo(size: 128),
            ),
            const SizedBox(height: 24),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _endValue = _endValue == 2 * pi ? 0.0 : 2 * pi;
                });
              },
              child: Text('Toggle Rotation'),
            )
          ],
        ),
      ),
    );
  }
}
