import 'package:flutter/material.dart';

class BlankScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Teachers', style: TextStyle(color: Colors.black)),
            Text(
              'Activities',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildActivityRow([
              _buildClickableActivityCard(
                icon: Icons.cake,
                label: 'Birthdays',
                onTap: () => _handleActivityTap('Birthdays'),
                color: Colors.blue,
              ),
              _buildClickableActivityCard(
                icon: Icons.pending,
                label: 'Pending Check-in',
                onTap: () => _handleActivityTap('Pending Check-in'),
                color: Colors.orange,
              ),
            ]),
            _buildActivityRow([
              _buildClickableActivityCard(
                icon: Icons.calendar_today,
                label: 'Day Attendance',
                onTap: () => _handleActivityTap('Day Attendance'),
                color: Colors.green,
              ),
              _buildClickableActivityCard(
                icon: Icons.access_time,
                label: 'Attend Hourly',
                onTap: () => _handleActivityTap('Attend Hourly'),
                color: Colors.purple,
              ),
            ]),
            _buildActivityRow([
              _buildClickableActivityCard(
                icon: Icons.library_books,
                label: 'Class Diary',
                onTap: () => _handleActivityTap('Class Diary'),
                color: Colors.teal,
              ),
              _buildClickableActivityCard(
                icon: Icons.assignment,
                label: 'Exam Paper',
                onTap: () => _handleActivityTap('Exam Paper'),
                color: Colors.brown,
              ),
            ]),
            _buildActivityRow([
              _buildClickableActivityCard(
                icon: Icons.quiz,
                label: 'Quiz Marks',
                onTap: () => _handleActivityTap('Quiz Marks'),
                color: Colors.red,
              ),
              _buildClickableActivityCard(
                icon: Icons.video_library,
                label: 'Video Lectures',
                onTap: () => _handleActivityTap('Video Lectures'),
                color: Colors.indigo,
              ),
            ]),
            _buildActivityRow([
              _buildClickableActivityCard(
                icon: Icons.note,
                label: 'Notes',
                onTap: () => _handleActivityTap('Notes'),
                color: Colors.amber,
              ),
              _buildClickableActivityCard(
                icon: Icons.question_answer,
                label: 'Ask Anything',
                onTap: () => _handleActivityTap('Ask Anything'),
                color: Colors.pink,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildClickableActivityCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      child: _buildActivityCard(icon: icon, label: label, color: color),
    );
  }

  Widget _buildActivityCard({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Card(
      elevation: 5,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.white),
            SizedBox(height: 16),
            Text(
              label,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityRow(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: children[0]),
          SizedBox(width: 16),
          Expanded(child: children[1]),
        ],
      ),
    );
  }

  void _handleActivityTap(String activityName) {
    print('Clicked on $activityName');
    // Add your custom logic here
  }
}

