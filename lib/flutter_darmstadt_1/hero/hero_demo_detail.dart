import 'package:flutter/material.dart';
import 'package:flutter_darmstadt/flutter_darmstadt_1/hero/demo_entry.dart';
import 'package:flutter_darmstadt/flutter_darmstadt_1/hero/with_material_hero.dart';
import 'package:lipsum/lipsum.dart';

class HeroDemoDetail extends StatelessWidget {
  final DemoEntry demoEntry;
  const HeroDemoDetail(this.demoEntry, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.network(
                demoEntry.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
              SafeArea(
                child: BackButton(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              demoEntry.title,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              demoEntry.subtitle,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              createParagraph(numSentences: 4),
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


