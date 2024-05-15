import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MaterialApp(
    title: 'Your App',
    home: BlankScreen1(),
  ));
}

class BlankScreen1 extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Teachers', style: TextStyle(color: Colors.black)),
            Text(
              'Activities',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildActivityRow([
              _buildClickableActivityCard(
                icon: Icons.cake,
                label: 'Birthdays',
                onTap: () => _handleActivityTap('Birthdays', context),
                color: Colors.blue,
              ),
              _buildClickableActivityCard(
                icon: Icons.pending,
                label: 'Pending Check-in',
                onTap: () => _handleActivityTap('Pending Check-in', context),
                color: Colors.orange,
              ),
            ]),
            _buildActivityRow([
              _buildClickableActivityCard(
                icon: Icons.calendar_today,
                label: 'Student Detail',
                onTap: () => _handleActivityTap('Student Detail', context),
                color: Colors.green,
              ),
              _buildClickableActivityCard(
                icon: Icons.access_time,
                label: 'Attend Hourly',
                onTap: () => _handleActivityTap('Attend Hourly', context),
                color: Colors.purple,
              ),
            ]),
            _buildActivityRow([
              _buildClickableActivityCard(
                icon: Icons.library_books,
                label: 'Class Diary',
                onTap: () => _handleActivityTap('Class Diary', context),
                color: Colors.teal,
              ),
              _buildClickableActivityCard(
                icon: Icons.assignment,
                label: 'Exam Paper',
                onTap: () => _handleActivityTap('Exam Paper', context),
                color: Colors.brown,
              ),
            ]),
            _buildActivityRow([
              _buildClickableActivityCard(
                icon: Icons.quiz,
                label: 'Quiz Marks',
                onTap: () => _handleActivityTap('Quiz Marks', context),
                color: Colors.red,
              ),
              _buildClickableActivityCard(
                icon: Icons.video_library,
                label: 'Video Lectures',
                onTap: () => _handleActivityTap('Video Lectures', context),
                color: Colors.indigo,
              ),
            ]),
            _buildActivityRow([
              _buildClickableActivityCard(
                icon: Icons.note,
                label: 'Notes',
                onTap: () => _handleActivityTap('Notes', context),
                color: Colors.amber,
              ),
              _buildClickableActivityCard(
                icon: Icons.question_answer,
                label: 'Ask Anything',
                onTap: () => _handleActivityTap('Ask Anything', context),
                color: Colors.pink,
              ),
            ]),
            // Add more rows as needed
          ],
        ),
      ),
    );
  }

  Widget _buildActivityRow(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: children[0]),
         const SizedBox(width: 16),
          Expanded(child: children[1]),
        ],
      ),
    );
  }

  Widget _buildClickableActivityCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      child: _buildActivityCard(icon: icon, label: label, color: color),
    );
  }

  Widget _buildActivityCard({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Card(
      elevation: 5,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.white),
           const SizedBox(height: 16),
            Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  void _handleActivityTap(String activityName, BuildContext context) {
    if (activityName == 'Student Detail') {
      _getStudentData(context);
    } else {
      print('Clicked on $activityName');
      // Add your custom logic here
    }
  }

  Future<void> _getStudentData(BuildContext context) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore.collection('Student').get();
      List<Map<String, dynamic>> studentData = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        data['id'] = doc.id; // Add document ID to student data
        return data;
      }).toList();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AttendanceDetailsScreen(studentData: studentData),
        ),
      );
    } catch (error) {
      print('Error fetching student data: $error');
      // Handle error
    }
  }
}

class AttendanceDetailsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> studentData;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AttendanceDetailsScreen({required this.studentData});

  @override
  _AttendanceDetailsScreenState createState() => _AttendanceDetailsScreenState();
}

class _AttendanceDetailsScreenState extends State<AttendanceDetailsScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();
  final TextEditingController attendanceController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: ListView.builder(
        itemCount: widget.studentData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(widget.studentData[index]['profileImageUrl'] ?? ''),
                ),
                title: Text(
                  widget.studentData[index]['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Class: ${widget.studentData[index]['class']}'),
                    Text('Roll No: ${widget.studentData[index]['rollNo']}'),
                    Text('Attendance: ${widget.studentData[index]['attendance']}%'),
                    Text('Address: ${widget.studentData[index]['address']}'),
                  ],
                ),
                onTap: () => _showStudentOptions(context, widget.studentData[index]),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addStudent(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showStudentOptions(BuildContext context, Map<String, dynamic> studentData) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit'),
              onTap: () {
                Navigator.pop(context);
                _editStudent(context, studentData['id']); // Pass student ID here
              },
            ),
            ListTile(
              leading:const Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () {
                Navigator.pop(context);
                _deleteStudent(context, studentData['id']); // Pass student ID here
              },
            ),
          ],
        );
      },
    );
  }

  void _editStudent(BuildContext context, String studentId) {
    if (studentId != null) {
      // Initialize text controllers with student data
      nameController.text = widget.studentData.firstWhere((student) => student['id'] == studentId)['name'];
      classController.text = widget.studentData.firstWhere((student) => student['id'] == studentId)['class'];
      rollNoController.text = widget.studentData.firstWhere((student) => student['id'] == studentId)['rollNo'].toString();
      attendanceController.text = widget.studentData.firstWhere((student) => student['id'] == studentId)['attendance'].toString();
      addressController.text = widget.studentData.firstWhere((student) => student['id'] == studentId)['address'];

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Edit Student"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: "Name"),
                  ),
                  TextField(
                    controller: classController,
                    decoration: InputDecoration(labelText: "Class"),
                  ),
                  TextField(
                    controller: rollNoController,
                    decoration: InputDecoration(labelText: "Roll No"),
                  ),
                  TextField(
                    controller: attendanceController,
                    decoration: InputDecoration(labelText: "Attendance"),
                  ),
                  TextField(
                    controller: addressController,
                    decoration: InputDecoration(labelText: "Address"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  _saveEditedStudentData(context, studentId);
                },
                child: Text('Save'),
              ),
            ],
          );
        },
      );
    } else {
      print('Error: Student ID is null');
      // Handle the case where studentId is null, possibly by showing an error message
    }
  }

  void _saveEditedStudentData(BuildContext context, String studentId) async {
    try {
      await widget._firestore.collection('Student').doc(studentId).update({
        'name': nameController.text,
        'class': classController.text,
        'rollNo': int.tryParse(rollNoController.text) ?? 0,
        'attendance': int.tryParse(attendanceController.text) ?? 0,
        'address': addressController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Student details updated')));
      Navigator.pop(context); // Close the dialog
    } catch (error) {
      print('Error updating student details: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update student details')));
    }
  }

  void _addStudent(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Student"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: classController,
                  decoration: InputDecoration(labelText: "Class"),
                ),
                TextField(
                  controller: rollNoController,
                  decoration: InputDecoration(labelText: "Roll No"),
                ),
                TextField(
                  controller: attendanceController,
                  decoration: InputDecoration(labelText: "Attendance"),
                ),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: "Address"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _saveStudentData(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _saveStudentData(BuildContext context) async {
    try {
      await widget._firestore.collection('Student').add({
        'name': nameController.text,
        'class': classController.text,
        'rollNo': int.tryParse(rollNoController.text) ?? 0,
        'attendance': int.tryParse(attendanceController.text) ?? 0,
        'address': addressController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Student added')));
      nameController.clear();
      classController.clear();
      rollNoController.clear();
      attendanceController.clear();
      addressController.clear();
      Navigator.pop(context); // Close the dialog
    } catch (error) {
      print('Error adding student: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add student')));
    }
  }

  void _deleteStudent(BuildContext context, String studentId) async {
    try {
      await widget._firestore.collection('Student').doc(studentId).delete();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Student deleted')));
    } catch (error) {
      print('Error deleting student: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to delete student')));
    }
  }
}
