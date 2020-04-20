import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleSample extends StatefulWidget {
  AnimatedDefaultTextStyleSample({Key key}) : super(key: key);

  @override
  _AnimatedDefaultTextStyleSampleState createState() =>
      _AnimatedDefaultTextStyleSampleState();
}

class _AnimatedDefaultTextStyleSampleState
    extends State<AnimatedDefaultTextStyleSample> {
  bool _highlighted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedDefaultTextStyle'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: <Widget>[
            AnimatedDefaultTextStyle(
              style: _highlighted
                  ? TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.blue)
                  : TextStyle(fontWeight: FontWeight.w400, color: Colors.black87),
              duration: Duration(milliseconds: 3000),
              child: Text('Flutter is great!'),
            ),
            const SizedBox(height: 24),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _highlighted = !_highlighted;
                });
              },
              child: Text('Toggle Text Style'),
            )
          ],
        ),
      ),
    );
  }
}
