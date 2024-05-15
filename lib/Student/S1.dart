import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Studentscreen.dart';

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

  bool _showPassword = false; // Initially hide the password

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
        _showErrorDialog(context, e.code); // Handle other errors with a dialog
      }
    }
  }

  void _showErrorDialog(BuildContext context, String errorCode) {
    String message;
    switch (errorCode) {
      case 'user-not-found':
        message = 'No user found for that email.';
        break;
      case 'wrong-password':
        message = 'Incorrect password. Please try again.';
        break;
      default:
        message = 'Error: $errorCode'; // Display the error code
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Login Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.0),
      children: [
        Form(
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
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: !_showPassword, // Toggle password visibility
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: _togglePasswordVisibility, // Toggle password visibility
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
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _login, // Call the login function directly
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo, // Background color
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Button padding
            shape: RoundedRectangleBorder( // Button border radius
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Log In',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white, // Text color
            ),
          ),
        ),
      ],
    );
  }
}
