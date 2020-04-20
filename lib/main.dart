import 'package:flutter/material.dart';
import 'package:flutter_darmstadt/flutter_darmstadt_1/animated_builder/animated_clipper_sample.dart';
import 'package:flutter_darmstadt/flutter_darmstadt_1/explicit/multiple_animations_sample.dart';
import 'package:flutter_darmstadt/flutter_darmstadt_1/explicit/repeating_explicit_animation.dart';
import 'package:flutter_darmstadt/flutter_darmstadt_1/hero/hero_demo_list.dart';
import 'package:flutter_darmstadt/flutter_darmstadt_1/implicit/animated_default_text_style_sample.dart';
import 'package:flutter_darmstadt/flutter_darmstadt_1/transform_example.dart';
import 'package:flutter_darmstadt/flutter_darmstadt_1/tween_animation_builder/appear_tween_animation_sample.dart';

import 'flutter_darmstadt_1/implicit/animated_container_sample.dart';
import 'flutter_darmstadt_1/tween_animation_builder/stateful_tween_animation_sample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Darmstadt 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      /*
      Implicit
       */
      //home: AnimatedContainerSample(),
      //home: AnimatedDefaultTextStyleSample(),
      //home: AppearTweenAnimationSample(),
      //home: StatefulTweenAnimationSample(),

      /*
      Explicit
       */

      //home: RepeatingExplicitAnimation(),
      //home: MultipleAnimationsSample(),
      //home: AnimatedClipperSample(),

      /*
      Hero
       */

      //home: HeroDemoList(),

      /*
      Transform
       */

      home: TransformExample(),
    );
  }
}

