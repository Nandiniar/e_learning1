import 'package:e_learning1/Student/Cultural.dart';
import 'package:flutter/material.dart';
import 'Assignment.dart';
import 'Quiz.dart';
import 'Video lecture.dart';
import 'Notes.dart';
import 'Birthdays.dart';
import 'Syllabus.dart';
import 'AskAnything.dart';
import 'Games.dart';
import 'Attendance.dart';

import 'Cultural.dart';

class Student1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Student', style: TextStyle(fontSize: 18)),
            Text('Activities', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildClickableRow(
              context,
              'Video Lectures',
              Icons.play_circle_filled,
              'Notes',
              Icons.note,
              Colors.blue,
              Colors.green,
            ),
            _buildClickableRow(
              context,
              'Assignment',
              Icons.assignment,
              'Quiz',
              Icons.live_help,
              Colors.orange,
              Colors.yellow,
            ),
            _buildClickableRow(
              context,
              'Birthdays',
              Icons.cake,
              'Attendance',
              Icons.people,
              Colors.pink,
              Colors.purple,
            ),
            _buildClickableRow(
              context,
              'Syllabus',
              Icons.description,
              'Ask Anything',
              Icons.help,
              Colors.teal,
              Colors.cyan,
            ),
            _buildClickableRow(
              context,
              'Games',
              Icons.games,
              'Cultural Learn',
              Icons.school,
              Colors.red,
              Colors.amber,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClickableRow(
      BuildContext context,
      String leftText,
      IconData leftIcon,
      String rightText,
      IconData rightIcon,
      Color leftColor,
      Color rightColor,
      ) {
    return GestureDetector(
      onTap: () {
        _handleRowTap(context, leftText);
        _handleRowTap(context, rightText);
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 6, // Adjust the height as needed
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildClickableColumn(context, leftText, leftIcon, leftColor),
            _buildClickableColumn(context, rightText, rightIcon, rightColor),
          ],
        ),
      ),
    );
  }

  Widget _buildClickableColumn(
      BuildContext context,
      String text,
      IconData icon,
      Color color,
      ) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _handleItemClick(context, text);
        },
        child: Container(
          padding: const EdgeInsets.all(12.0), // Adjust padding as needed
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: [
              Icon(icon, size: 32, color: Colors.white), // Adjust icon size
              SizedBox(height: 4), // Adjust spacing
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleRowTap(BuildContext context, String rowName) {
    print('Clicked on row: $rowName');
  }

  void _handleItemClick(BuildContext context, String itemName) {
    if (itemName == 'Assignment') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Assignment()),
      );
    }
    else if (itemName == 'Quiz') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Quiz()),
      );
    }
    else if(itemName=='Video Lectures'){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Videolecture()),
      );

    }
    else if(itemName=='Notes'){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Notes()),
      );

    }
    else if(itemName=='Ask Anything'){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Ask()),
      );

    }
   /* else if(itemName=='Attendance'){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Attendance()),
      );

    }*/
    else if(itemName=='Games'){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Games()),
      );

    }
    else if(itemName=='Syllabus'){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Syllabus()),
      );

    }
    else if(itemName=='Cultural Learn') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cultural()),
      );
    }

    else if(itemName=='Birthdays'){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Birthday()),
      );

    }


    }


  }


