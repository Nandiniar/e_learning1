import 'package:flutter/material.dart';

class TeacherScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color screenColor = Colors.lightBlue;

    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Screen'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: screenColor,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        filled: true,
                        fillColor: screenColor,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Phone No',
                        filled: true,
                        fillColor: screenColor,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email Id',
                        filled: true,
                        fillColor: screenColor,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Registration Id',
                        filled: true,
                        fillColor: screenColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BlankScreen1()),
                  );
                },
                child: Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlankScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blank Screen'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.lightBlue,
        child: Center(
          child: Text(
            'This is a blank screen after logging in.',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
