import 'package:flutter/material.dart';
import 'package:flutter_darmstadt/flutter_darmstadt_1/hero/demo_entry.dart';
import 'package:flutter_darmstadt/flutter_darmstadt_1/hero/hero_demo_detail.dart';
import 'package:flutter_darmstadt/flutter_darmstadt_1/hero/with_material_hero.dart';
import 'package:lipsum/lipsum.dart';

class HeroDemoList extends StatelessWidget {
  HeroDemoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C5282),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF2C5282),
        title: Text('Hero Animation Demo'),
      ),
      body: Material(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14), topRight: Radius.circular(14)),
        type: MaterialType.card,
        child: Container(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 16),
            itemCount: 100,
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),
            itemBuilder: (context, int index) => _buildListItem(context, index),
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    final demoEntry = DemoEntry.random();

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => HeroDemoDetail(demoEntry)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              child: Image.network(
                demoEntry.imageUrl,
                fit: BoxFit.cover,
                width: 64,
                height: 64,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    demoEntry.title,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    demoEntry.subtitle,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
