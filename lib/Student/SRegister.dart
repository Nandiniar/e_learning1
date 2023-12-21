import 'package:flutter/material.dart';
import 'S1.dart';
class StudentRegistrationForm extends StatefulWidget {
  @override
  _StudentRegistrationFormState createState() =>
      _StudentRegistrationFormState();
}

class _StudentRegistrationFormState extends State<StudentRegistrationForm> {
  String _selectedClass = 'I Class';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Registration'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16),
                DropdownButtonFormField(
                  value: _selectedClass,
                  items: [
                    'I Class',
                    'II Class',
                    'III Class',
                    'IV Class',
                    'V Class',
                    'VI Class',
                    'VII Class',
                    'IX Class',
                    'X Class',
                  ].map((classOption) {
                    return DropdownMenuItem(
                      value: classOption,
                      child: Text(classOption),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedClass = value.toString();
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Class',
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
                  keyboardType: TextInputType.emailAddress,
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
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Re-enter Password',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>L1()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    onPrimary: Colors.white,
                  ),
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

