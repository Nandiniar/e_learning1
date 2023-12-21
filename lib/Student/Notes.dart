
import 'package:flutter/material.dart';
import 'Social.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: [
          _buildRow(context, 'English', Icons.book, 'Hindi', Icons.book),
          _buildRow(context, 'Maths', Icons.calculate, 'Science', Icons.science),
          _buildRow(context, 'Sanskrit', Icons.book, 'Social Studies', Icons.book),
        ],
      ),
    );
  }

  Widget _buildRow(
      BuildContext context,
      String leftText,
      IconData leftIcon,
      String rightText,
      IconData rightIcon,
      ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildColumn(context, leftText, leftIcon, Colors.blue),
          _buildColumn(context, rightText, rightIcon, Colors.green),
        ],
      ),
    );
  }

  Widget _buildColumn(BuildContext context, String text, IconData icon, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Handle click action here
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SubjectScreen(text, color)),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: [
              Icon(icon, size: 40, color: Colors.white),
              SizedBox(height: 8),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubjectScreen extends StatelessWidget {
  final String subjectName;
  final Color backgroundColor;

  SubjectScreen(this.subjectName, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: _buildSubjectContent(context),
      ),
    );
  }

  Widget _buildSubjectContent(BuildContext context) {
    switch (subjectName) {

      case 'Hindi':
        return _buildHindiContent(context);
      case 'Maths':
        return  _buildMathsContent(context);
      case 'Science':
        return  _buildScienceContent(context);
      case 'Sanskrit':
        return _buildSanskritContent(context);

      case 'English':
        return _buildEnglishContent(context);
      case 'Social Studies':
        return _buildSocialContent(context);


      default:
        return Text(
          'This is the default content for $subjectName subject.',
          style: TextStyle(fontSize: 24, color: Colors.black),
        );
    }
  }

  Widget _buildSanskritContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SfPdfViewer.network(
        "https://mu.ac.in/wp-content/uploads/2023/05/First-Round-IDOL-Admission-Notification-2022-23-1.pdf",
      ),
    );
  }
}
Widget _buildEnglishContent(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: SfPdfViewer.network(
      "https://mu.ac.in/wp-content/uploads/2023/05/First-Round-IDOL-Admission-Notification-2022-23-1.pdf",
    ),
  );
}
Widget _buildHindiContent(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: SfPdfViewer.network(
      "https://mu.ac.in/wp-content/uploads/2023/05/First-Round-IDOL-Admission-Notification-2022-23-1.pdf",
    ),
  );
}
Widget _buildMathsContent(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: SfPdfViewer.network(
      "https://mu.ac.in/wp-content/uploads/2023/05/First-Round-IDOL-Admission-Notification-2022-23-1.pdf",
    ),
  );
}

Widget _buildScienceContent(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: SfPdfViewer.network(
      "https://mu.ac.in/wp-content/uploads/2023/05/First-Round-IDOL-Admission-Notification-2022-23-1.pdf",
    ),
  );
}
Widget _buildSocialContent(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: SfPdfViewer.network(
      "https://mu.ac.in/wp-content/uploads/2023/05/First-Round-IDOL-Admission-Notification-2022-23-1.pdf",
    ),
  );
}

