import 'package:flutter/material.dart';

class L1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Screen'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StudentLoginForm(),
        ),
      ),
    );
  }
}

class StudentLoginForm extends StatefulWidget {
  @override
  _StudentLoginFormState createState() => _StudentLoginFormState();
}

class _StudentLoginFormState extends State<StudentLoginForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Name',
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Phone No',
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Email Id',
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        SizedBox(height: 16),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Student Id',
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add login logic
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
                onPrimary: Colors.white,
              ),
              child: Text('Log In'),
            ),
          ],
        ),
      ],
    );
  }
}
