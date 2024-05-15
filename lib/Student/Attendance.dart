import 'package:flutter/material.dart';

class Student {
  final String name;
  bool quizDone;
  bool notesRead;
  bool assignmentDone;

  Student({
    required this.name,
    this.quizDone = false,
    this.notesRead = false,
    this.assignmentDone = false,
  });
}

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  final List<Student> students = [
    Student(name: 'Student 1'),
    Student(name: 'Student 2'),
    // Add more students as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Class Attendance'),
          backgroundColor: Colors.indigo,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Student Attendance',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return _buildStudentTile(students[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStudentTile(Student student) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          student.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusTile('Quiz', student.quizDone, (value) {
              setState(() {
                student.quizDone = value ?? false;
              });
            }),
            _buildStatusTile('Notes', student.notesRead, (value) {
              setState(() {
                student.notesRead = value ?? false;
              });
            }),
            _buildStatusTile('Assignment', student.assignmentDone, (value) {
              setState(() {
                student.assignmentDone = value ?? false;
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTile(String title, bool status, ValueChanged<bool> onChanged) {
    return ListTile(
      title: Text(
        title + ': ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Switch(
        value: status,
        onChanged: (value) {
          onChanged(value);
        },
        activeColor: Colors.green,
        inactiveThumbColor: Colors.red,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Attendance(),
  ));
}
