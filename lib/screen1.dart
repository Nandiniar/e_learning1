
import 'package:flutter/material.dart';
import 'introscreen.dart';
import 'AuthScreen.dart';
import 'HomeScreen.dart';
import 'Assignment.dart';
import 'firstScreen.dart';

class ElearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => IntroScreen(),
        '/firstScreen': (context) => SplashScreen(),

        '/auth': (context) => AuthScreen(),
        '/home': (context) => HomeScreen(),
        '/assignment': (context) => AssignmentScreen(),

      },
    );
  }
}


