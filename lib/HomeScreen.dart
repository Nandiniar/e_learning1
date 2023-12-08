import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Learning App'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: CourseOptions(),
      ),
    );
  }
}

class CourseOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // First Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OptionCard(
                  title: 'Assignment',
                  icon: Icons.assignment,
                  onTap: () {
                    Navigator.pushNamed(context, '/assignment');
                  },
                ),
              ),
              Expanded(
                child: OptionCard(
                  title: 'Quiz',
                  icon: Icons.quiz,
                  onTap: () {
                    Navigator.pushNamed(context, '/quiz');
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Second Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OptionCard(
                  title: 'Video Lectures',
                  icon: Icons.video_library,
                  onTap: () {
                    Navigator.pushNamed(context, '/video_lectures');
                  },
                ),
              ),
              Expanded(
                child: OptionCard(
                  title: 'Live Lectures',
                  icon: Icons.live_tv,
                  onTap: () {
                    Navigator.pushNamed(context, '/live_lectures');
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Third Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OptionCard(
                  title: 'Ask Anything',
                  icon: Icons.question_answer,
                  onTap: () {
                    Navigator.pushNamed(context, '/ask_anything');
                  },
                ),
              ),
              Expanded(
                child: OptionCard(
                  title: 'Games',
                  icon: Icons.games,
                  onTap: () {
                    Navigator.pushNamed(context, '/games');
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Fourth Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OptionCard(
                  title: 'Notes',
                  icon: Icons.note,
                  onTap: () {
                    Navigator.pushNamed(context, '/notes');
                  },
                ),
              ),
              Expanded(
                child: OptionCard(
                  title: 'Cultural Education',
                  icon: Icons.people_outlined,
                  onTap: () {
                    Navigator.pushNamed(context, '/cultural_education');
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  OptionCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 24),
              SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
