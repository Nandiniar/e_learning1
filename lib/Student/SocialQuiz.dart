import 'package:flutter/material.dart';



class SocialQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Quiz'),
        backgroundColor: Colors.indigo,
      ),
      body: QuizContent(),
    );
  }
}

class QuizContent extends StatefulWidget {
  @override
  _QuizContentState createState() => _QuizContentState();
}

class _QuizContentState extends State<QuizContent> {
  List<String> questions = [
    'Who is the author of "To Kill a Mockingbird"?',
    'Which Shakespeare play features the character Macbeth?',
    'In which year was William Wordsworth born?',
    'What is a palindrome?',
    'What is the plural form of the word "ox"?',
    'Who wrote the poem "The Waste Land"?',
    'What is the opposite of nocturnal?',
    'What is the longest word in the English language?',
    'Who is the protagonist in George Orwell\'s "1984"?',
    'What is the capital of Australia?',
  ];

  List<List<String>> options = [
    ['Harper Lee', 'J.K. Rowling', 'Ernest Hemingway', 'George Orwell'],
    ['Hamlet', 'Othello', 'Macbeth', 'Romeo and Juliet'],
    ['1770', '1805', '1830', '1850'],
    ['A word, phrase, or sequence that reads the same backward as forward', 'A large carnivorous dinosaur', 'A type of tropical fruit', 'A mathematical equation'],
    ['Oxen', 'Oxes', 'Oxi', 'Ox'],
    ['T.S. Eliot', 'Robert Frost', 'W.B. Yeats', 'John Keats'],
    ['Diurnal', 'Nocturnal', 'Eternal', 'Maternal'],
    ['Pneumonoultramicroscopicsilicovolcanoconiosis', 'Antidisestablishmentarianism', 'Supercalifragilisticexpialidocious', 'Floccinaucinihilipilification'],
    ['Winston Smith', 'John Proctor', 'Holden Caulfield', 'Atticus Finch'],
    ['Canberra', 'Sydney', 'Melbourne', 'Perth'],
  ];

  List<int> correctAnswers = [0, 2, 0, 0, 0, 0, 1, 0, 0, 0]; // Index of the correct option for each question

  int currentQuestionIndex = 0;
  int totalQuestions = 0;
  int correctAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    totalQuestions = questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildQuestion(),
          SizedBox(height: 20),
          _buildAnswerButtons(),
          SizedBox(height: 20),
          _buildScore(),
        ],
      ),
    );
  }

  Widget _buildQuestion() {
    return Text(
      questions[currentQuestionIndex],
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildAnswerButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(options[currentQuestionIndex].length, (index) {
        return ElevatedButton(
          onPressed: () {
            _checkAnswer(index);
          },
          child: Text(options[currentQuestionIndex][index]),
        );
      }),
    );
  }

  Widget _buildScore() {
    return Text(
      'Score: $correctAnswersCount / $totalQuestions',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  void _checkAnswer(int selectedOptionIndex) {
    int correctOptionIndex = correctAnswers[currentQuestionIndex];

    if (selectedOptionIndex == correctOptionIndex) {
      setState(() {
        correctAnswersCount++;
      });
    }

    setState(() {
      if (currentQuestionIndex < totalQuestions - 1) {
        currentQuestionIndex++;
      } else {
        // Quiz completed, show a dialog or navigate to the result screen
        _showResultDialog();
      }
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Quiz Completed'),
          content: Text('Your final score: $correctAnswersCount / $totalQuestions'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Add navigation to the result screen or any other action needed
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
