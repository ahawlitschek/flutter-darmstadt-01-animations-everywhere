import 'package:flutter/material.dart';

class AnimatedContainerSample extends StatefulWidget {
  AnimatedContainerSample({Key key}) : super(key: key);

  @override
  _AnimatedContainerSampleState createState() =>
      _AnimatedContainerSampleState();
}

class _AnimatedContainerSampleState extends State<AnimatedContainerSample> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _open = !_open;
          });
        },
        child: Align(
          alignment: Alignment.bottomRight,
          child: AnimatedContainer(
            curve: Curves.easeInOutCirc,
            duration: Duration(milliseconds: 4000),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            width: _open ? MediaQuery.of(context).size.width : 64,
            height: _open ? MediaQuery.of(context).size.width : 64,
            decoration: BoxDecoration(
              color: _open ? Colors.blue : Colors.white,
              borderRadius: _open
                  ? BorderRadius.all(Radius.circular(6))
                  : BorderRadius.all(Radius.circular(99)),
            ),
            child: Center(child: Icon(_open ? Icons.close : Icons.add)),
          ),
        ),
      ),
    );
  }


  test(){
    setState(() {
      _open = true;
    });
  }


}
