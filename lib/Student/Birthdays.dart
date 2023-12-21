import 'package:flutter/material.dart';

class Student {
  final String name;
  final DateTime birthday;

  Student({required this.name, required this.birthday});
}

class Birthday extends StatelessWidget {
  final List<Student> students = [
    Student(name: 'John', birthday: DateTime(2000, 5, 15)),
    Student(name: 'Alice', birthday: DateTime(1998, 8, 23)),
    Student(name: 'Bob', birthday: DateTime(2002, 2, 10)),
    // Add more students with their birthdays
    Student(name: 'David', birthday: DateTime(1995, 12, 22)),
    Student(name: 'Emma', birthday: DateTime(2001, 12, 22)),
    Student(name: 'Grace', birthday: DateTime(1993, 12, 21)),
    Student(name: 'Michael', birthday: DateTime(1999, 12, 21)),
  ];

  List<Student> getStudentsWithBirthday() {
    int currentYear = DateTime.now().year;
    return students.where((student) => student.birthday.year == currentYear).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Student> studentsWithBirthday = getStudentsWithBirthday();

    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday List'),
      ),
      body: Center(
        child: studentsWithBirthday.isEmpty
            ? Text(
          'No birthdays today.',
          style: TextStyle(fontSize: 24),
        )
            : ListView.builder(
          itemCount: studentsWithBirthday.length,
          itemBuilder: (context, index) {
            Student student = studentsWithBirthday[index];
            return Card(
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(student.name),
                subtitle: Text('Birthday: ${student.birthday.day}/${student.birthday.month}'),
              ),
            );
          },
        ),
      ),
    );
  }
}