import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SectionContent extends StatelessWidget {
  final String content;

  SectionContent({required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class CulturalData {
  final String title;
  final String description;
  final String history;
  final String festivals;
  final String customs;
  final String dance;
  final String language;
  final String cuisine;
  final String imagePath;

  CulturalData({
    required this.title,
    required this.description,
    required this.history,
    required this.festivals,
    required this.customs,
    required this.dance,
    required this.language,
    required this.cuisine,
    required this.imagePath,
  });
}

class CulturalEducation extends StatelessWidget {
  final CulturalData culturalData;

  CulturalEducation({required this.culturalData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(culturalData.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              culturalData.imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                culturalData.description,
                style: TextStyle(fontSize: 18),
              ),
            ),
            SectionTitle(title: 'History'),
            SectionContent(content: culturalData.history),
            SectionTitle(title: 'Festivals'),
            SectionContent(content: culturalData.festivals),
            SectionTitle(title: 'Customs'),
            SectionContent(content: culturalData.customs),
            SectionTitle(title: 'Traditional Dance'),
            SectionContent(content: culturalData.dance),
            SectionTitle(title: 'Language'),
            SectionContent(content: culturalData.language),
            SectionTitle(title: 'Cuisine'),
            SectionContent(content: culturalData.cuisine),
          ],
        ),
      ),
    );
  }
}


class Cultural extends StatelessWidget {
  const Cultural({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CulturalEducation(
        culturalData: CulturalData(
          title: 'Banjara Culture',
          description:
          'The Banjaras of Jammu and Kashmir have a rich cultural heritage. They are known for their traditional dance forms, colorful attire, and vibrant festivals. The community takes pride in preserving its unique traditions and passing them down through generations.',
          history:
          'The history of the Banjara community dates back centuries. They have been nomadic people known for their trade and distinctive lifestyle.',
          festivals:
          'Banjaras celebrate various festivals with enthusiasm. Some of the major festivals include [List of Festivals].',
          customs:
          'The customs of the Banjara community reflect their close-knit social structure. They follow traditional practices in marriages, celebrations, and daily life.',
          dance:
          'The Banjara community has a distinctive traditional dance style characterized by energetic movements and vibrant costumes.',
          language:
          'The Banjara language is an integral part of their identity. It has its unique dialects and expressions, preserving the linguistic richness of the community.',
          cuisine:
          'Banjara cuisine is known for its flavorful dishes. Common ingredients include [List of Ingredients]. Some popular dishes include [List of Dishes].',
          imagePath: 'assets/banjara1.jpg',
        ),
      ),
    );
  }
}

