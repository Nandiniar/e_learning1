import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'englishpdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';



class Syllabus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syllabus'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SubjectCard('English', Colors.teal, EnglishSyllabus()),
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

class EnglishSyllabus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Syllabus'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SfPdfViewer.network(
          "https://mu.ac.in/wp-content/uploads/2023/05/First-Round-IDOL-Admission-Notification-2022-23-1.pdf",
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
        title: Text('Hindi Syllabus'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SfPdfViewer.network(
          "https://mu.ac.in/wp-content/uploads/2023/05/First-Round-IDOL-Admission-Notification-2022-23-1.pdf",
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
        title: Text('Maths Syllabus'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SfPdfViewer.network(
          "https://mu.ac.in/wp-content/uploads/2023/05/First-Round-IDOL-Admission-Notification-2022-23-1.pdf",
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
        title: Text('Science Syllabus'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SfPdfViewer.network(
          "https://mu.ac.in/wp-content/uploads/2023/05/First-Round-IDOL-Admission-Notification-2022-23-1.pdf",
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
        title: Text('Social Studies Syllabus'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SfPdfViewer.network(
          "https://mu.ac.in/wp-content/uploads/2023/05/First-Round-IDOL-Admission-Notification-2022-23-1.pdf",
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
        title: Text('Sanskrit Syllabus'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SfPdfViewer.network(
          "https://mu.ac.in/wp-content/uploads/2023/05/First-Round-IDOL-Admission-Notification-2022-23-1.pdf",
        ),
      ),
    );
  }
}