import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'englishpdf.dart';



class Assignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SubjectCard('English', Colors.teal, EnglishAssignment()),
          SubjectCard('Hindi', Colors.orange, HindiAssignment()),
          SubjectCard('Maths', Colors.pink, MathsAssignment()),
          SubjectCard('Science', Colors.blue, ScienceAssignment()),
          SubjectCard('Social Studies', Colors.amber, SocialStudiesAssignment()),
          SubjectCard('Sanskrit', Colors.purple, SanskritAssignment()),
        ],
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String subject;
  final Color color;
  final Widget assignmentDetails;

  SubjectCard(this.subject, this.color, this.assignmentDetails);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          subject,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        tileColor: color,
        leading: Icon(Icons.book, color: Colors.white),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => assignmentDetails),
          );
        },
      ),
    );
  }
}

class AssignmentDetailsScreen extends StatelessWidget {
  final String subject;
  final List<String> questions;

  AssignmentDetailsScreen(this.subject, this.questions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
        backgroundColor: Colors.teal, // Change color as needed
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(questions[index]),
          );
        },
      ),
    );
  }
}

class EnglishAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Assignment'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
    child: Padding(
    padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          'images/Assignment1E.jpeg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      ),
    );
  }
}


class HindiAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hindi Assignment'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
    child: Padding(
    padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          'images/hindi assignment.jpg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      ),
    );
  }
}

class MathsAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maths Assignment'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
    child: Padding(
    padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          'images/maths assignment.jpg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      ),
    );
  }
}

class ScienceAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Science Assignment'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
    child: Padding(
    padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Increase padding for better visibility
          child: Image.asset(
            'images/Assignment1E.jpeg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
      ),
      ),
    );
  }
}

class SocialStudiesAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Studies Assignment'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
    child: Padding(
    padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          'images/Social studies assignment.jpg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      ),
    );
  }
}

class SanskritAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sanskrit Assignment'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
    child: Padding(
    padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          'images/sanskrit1.assignment.jpg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.contain,
        ),
      ),
      ),
    );
  }
}
