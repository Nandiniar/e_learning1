import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Games(),
  ));
}

class Games extends StatefulWidget {
  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {
  int score = 0;
  int questionCount = 0;
  int num1 = 0;
  int num2 = 0;
  String operator = '';
  int correctAnswer = 0;
  List<int> options = [];

  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

  void generateQuestion() {
    if (questionCount < 5) {
      final Random random = Random();
      num1 = random.nextInt(10) + 1; // Random number between 1 and 10
      num2 = random.nextInt(10) + 1;
      operator = random.nextBool() ? '+' : '-';
      correctAnswer = (operator == '+') ? num1 + num2 : num1 - num2;

      options = generateOptions(correctAnswer);
    } else {
      // All questions answered, show result
      showResultDialog();
    }
  }

  List<int> generateOptions(int correctAnswer) {
    final Random random = Random();
    List<int> options = [correctAnswer];
    while (options.length < 4) {
      int option = (correctAnswer + random.nextInt(5) + 1) % 10;
      if (!options.contains(option)) {
        options.add(option);
      }
    }
    options.shuffle();
    return options;
  }

  void checkAnswer(int selectedAnswer) {
    if (selectedAnswer == correctAnswer) {
      // Correct answer
      setState(() {
        score++;
      });
    }

    // Move to the next question
    questionCount++;
    generateQuestion(); // Generate a new question
  }

  void showResultDialog() {
    String resultMessage = '';
    IconData icon;

    if (score == 5) {
      resultMessage = 'Congrats! Your score is 5/5';
      icon = Icons.sentiment_very_satisfied;
    } else if (score >= 4) {
      resultMessage = 'Congrats! Your score is $score/5';
      icon = Icons.sentiment_satisfied;
    } else {
      resultMessage = 'Your score is $score/5';
      icon = Icons.sentiment_dissatisfied;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(width: 10),
              Text(resultMessage),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  void resetGame() {
    setState(() {
      score = 0;
      questionCount = 0;
    });
    generateQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Math Game'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Text(
                    '$num1 $operator $num2',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () {
                        checkAnswer(options[index]);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.all(20.0),
                      ),
                      child: Text(
                        options[index].toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Score: $score/5',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
