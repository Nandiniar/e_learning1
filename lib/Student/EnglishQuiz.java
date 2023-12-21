class EnglishQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Quiz'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Text('This is the English quiz for class 5.'),
      ),
    );
  }
}
