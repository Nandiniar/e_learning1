import 'dart:async';
import 'package:flutter/material.dart';
import 'AuthScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}
class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => AuthScreen(),
    )
    );
  }

  initScreen(BuildContext context) {
    return Container(

      child:const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Nomadic Education: Bridging the Gap, Empowering the Future',
            textAlign: TextAlign.center,
            style: TextStyle(

              color: Colors.blue,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,

              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}

