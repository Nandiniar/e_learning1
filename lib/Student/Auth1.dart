import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Studentscreen.dart';
import 'SRegister.dart'; // Import the registration form

class L1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Login'),
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
  final _formKey = GlobalKey<FormState>(); // For form validation
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance; // Instance for Firebase Auth

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      try {
        UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        print('Logged in successfully!');

        // Navigate to Student1 class only if login is successful
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Student1()),
        );
      } on FirebaseAuthException catch (e) {
        _showErrorDialog(context, e.message!); // Display Firebase error message
      }
    }
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Login Error'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.0), // Added padding for better spacing
      children: [
        Form( // Wrap form fields in a Form widget for validation
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email Id',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address.';
                  }
                  return null; // Valid
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password.';
                  }
                  return null; // Valid
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _login, // Call the login function directly
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo, // Background color
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Button padding
                shape: RoundedRectangleBorder( // Button border radius
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Log In',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white, // Text color
                ),
              ),
            ),
            SizedBox(width: 16), // Add spacing between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentRegistrationForm()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo, // Background color
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Button padding
                shape: RoundedRectangleBorder( // Button border radius
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white, // Text color
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
