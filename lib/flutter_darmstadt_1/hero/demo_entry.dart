import 'package:lipsum/lipsum.dart';

class DemoEntry {
  static int lastId = 0;

  final int id;
  final String imageUrl;
  final String title;
  final String subtitle;
  final String paragraph;

  DemoEntry(this.imageUrl, this.title, this.subtitle, this.paragraph)
      : this.id = lastId++;

  String get imageTag => 'image:$id';

  String get titleTag => 'title:$id';

  String get subtitleTag => 'subtitle:$id';

  factory DemoEntry.random() => DemoEntry(
        'http://placeimg.com/1200/640/any?v=${DateTime.now().millisecondsSinceEpoch}',
        createWord(numWords: 2),
        createSentence(sentenceLength: 4),
        createParagraph(numSentences: 4),
      );
}
