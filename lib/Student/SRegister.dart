import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'S1.dart';

class StudentRegistrationForm extends StatefulWidget {
  @override
  _StudentRegistrationFormState createState() => _StudentRegistrationFormState();
}

class _StudentRegistrationFormState extends State<StudentRegistrationForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reenterPasswordController = TextEditingController();
  DateTime? _selectedDate; // Variable to store selected date

  String _selectedClass = 'I Class';
  String _nameErrorText = '';
  String _phoneErrorText = '';
  String _emailErrorText = '';
  String _passwordErrorText = '';
  bool _isPasswordHidden = true;

  Future<void> _register() async {
    // Reset error messages
    setState(() {
      _nameErrorText = '';
      _phoneErrorText = '';
      _emailErrorText = '';
      _passwordErrorText = '';
    });

    // Validation checks
    if (_nameController.text.isEmpty) {
      setState(() {
        _nameErrorText = 'Error: Please enter your name.';
      });
      return;
    }

    if (_phoneController.text.isEmpty) {
      setState(() {
        _phoneErrorText = 'Error: Please enter your phone number.';
      });
      return;
    }

    if (_phoneController.text.length != 10) {
      setState(() {
        _phoneErrorText = 'Error: Phone number must be 10 digits.';
      });
      return;
    }

    if (_emailController.text.isEmpty) {
      setState(() {
        _emailErrorText = 'Error: Please enter your email address.';
      });
      return;
    }

    if (_passwordController.text.isEmpty) {
      setState(() {
        _passwordErrorText = 'Error: Please enter your password.';
      });
      return;
    }

    if (_reenterPasswordController.text.isEmpty) {
      setState(() {
        _passwordErrorText = 'Error: Please re-enter your password.';
      });
      return;
    }

    if (_passwordController.text != _reenterPasswordController.text) {
      setState(() {
        _passwordErrorText = 'Error: Passwords do not match.';
      });
      return;
    }

    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      // Store user data in Firestore
      await _firestore.collection('Student').doc(userCredential.user!.uid).set({
        'name': _nameController.text,
        'dob': _selectedDate,
        'class': _selectedClass,
      });

      // Navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => L1()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          _emailErrorText = 'Error: The email address is already in use.';
        });
      } else {
        setState(() {
          _emailErrorText = 'Error: $e';
        });
      }
    } catch (e) {
      setState(() {
        _emailErrorText = 'Error: $e';
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

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
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    filled: true,
                    fillColor: Colors.white,
                    errorText: _nameErrorText.isNotEmpty ? _nameErrorText : null,
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone No',
                    filled: true,
                    fillColor: Colors.white,
                    errorText: _phoneErrorText.isNotEmpty ? _phoneErrorText : null,
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
                // Date of Birth Input
                InkWell(
                  onTap: () => _selectDate(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Date of Birth',
                      filled: true,
                      fillColor: Colors.white,
                      errorText: _phoneErrorText.isNotEmpty ? _phoneErrorText : null,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedDate != null ? _selectedDate.toString().split(' ')[0] : 'Select Date',
                        ),
                        Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Id',
                    filled: true,
                    fillColor: Colors.white,
                    errorText: _emailErrorText.isNotEmpty ? _emailErrorText : null,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isPasswordHidden,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordHidden ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isPasswordHidden = !_isPasswordHidden;
                        });
                      },
                    ),
                    errorText: _passwordErrorText.isNotEmpty ? _passwordErrorText : null,
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _reenterPasswordController,
                  obscureText: _isPasswordHidden,
                  decoration: InputDecoration(
                    labelText: 'Re-enter Password',
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordHidden ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isPasswordHidden = !_isPasswordHidden;
                        });
                      },
                    ),
                    errorText: _passwordErrorText.isNotEmpty ? _passwordErrorText : null,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.indigo,
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