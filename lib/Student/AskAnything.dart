import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class Ask extends StatefulWidget {
  @override
  _AskState createState() => _AskState();
}

class _AskState extends State<Ask> {
  final List<ChatMessage> messages = [];
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Anything'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.grey[100],
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return _buildMessage(messages[index]);
                },
              ),
            ),
          ),
          _buildMessageComposer(),
        ],
      ),
    );
  }

  Widget _buildMessage(ChatMessage message) {
    return Align(
      alignment: message.isUser ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.blue : Colors.green,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Ask a question...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              String question = _textController.text;
              _sendMessage(question, true);

              // Simulate response after a short delay
              Future.delayed(Duration(seconds: 1), () {
                String answer = getAnswer(question);
                _sendMessage(answer, false);
              });

              _textController.clear();
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text, bool isUser) {
    setState(() {
      messages.insert(0, ChatMessage(text: text, isUser: isUser));
    });
  }

  String getAnswer(String question) {
    // Implement your logic to map questions to answers here
    // You can use if-else statements, switch-case, or any other method
    // For demonstration, a simple example is shown below
    if (question.toLowerCase().contains('science')) {
      return 'Science is the systematic enterprise that builds and organizes knowledge in the form of testable explanations and predictions about the universe.';
    } else if (question.toLowerCase().contains('artificial intelligence')) {
      return 'Artificial intelligence (AI) refers to the simulation of human intelligence in machines that are programmed to think and learn.';
    } else if (question.toLowerCase().contains('your_custom_question')) {
      return 'Your custom answer';
    } else {
      return 'I don\'t have an answer for that question.';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: Ask(),
  ));
}
