import 'package:flutter/material.dart';
import 'EnglishQuiz.dart';
import 'Hindi.dart';
import 'maths.dart';
import 'SocialQuiz.dart';
import 'SanskritQuiz.dart';
import 'Science.dart';

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.indigo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildSubjectRow(context, 'English', Colors.lightBlue),
              _buildSubjectRow(context, 'Hindi', Colors.lightGreen),
              _buildSubjectRow(context, 'Maths', Colors.orange),
              _buildSubjectRow(context, 'Science', Colors.yellow),
              _buildSubjectRow(context, 'Social Studies', Colors.deepOrange),
              _buildSubjectRow(context, 'Sanskrit', Colors.deepPurple),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectRow(BuildContext context, String subject, Color color) {
    return GestureDetector(
      onTap: () {
        _handleSubjectTap(context, subject);
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: _buildSubject(context, subject, color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubject(BuildContext context, String subject, Color color) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.subject, size: 32, color: Colors.white),
          SizedBox(width: 8),
          Text(
            subject,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  void _handleSubjectTap(BuildContext context, String subject) {
    switch (subject) {
      case 'English':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EnglishQuiz()),
        );
      case 'Hindi':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HindiQuiz()),
        );
      case 'Maths':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MathsQuiz()),
        );
      case 'Science':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScienceQuiz()),
        );
      case 'Social Studies':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SocialQuiz()),
        );
      case 'Sanskrit':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SanskritQuiz()),
        );

        break;
    // Add cases for other subjects if needed
      default:
      // Handle other subjects if needed
        print('Clicked on subject: $subject');
        break;
    }
  }
}

