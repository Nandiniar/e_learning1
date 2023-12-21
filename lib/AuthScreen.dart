import 'package:flutter/material.dart';
import 'AuthScreen file/TeacherScreen.dart';
import 'Student/Auth1.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Are You?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClickableIconWithLabel(
                  icon: Icons.person,
                  label: 'Teacher',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TeacherScreen()),
                    );
                  },
                ),
                SizedBox(width: 24),
                ClickableIconWithLabel(
                  icon: Icons.school_outlined,
                  label: 'Student',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudentScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ClickableIconWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  ClickableIconWithLabel({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Icon(
            icon,
            size: 72,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 12),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
