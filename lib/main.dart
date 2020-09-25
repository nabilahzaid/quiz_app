import 'package:flutter/material.dart';

// import './question.dart';
// import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Who\'s the best cat?',
      'answer': ['Kiki', 'Momo', 'Koko', 'Mimi']
    },
    {
      'questionText': 'Whats\' your favourite food?',
      'answer': ['Spaghetti', 'Sushi', 'Kimbap', 'Nasi Lemak']
    },
    {
      'questionText': 'Whats\' your favourite colour?',
      'answer': ['Pink', 'Blue', 'White', 'Black']
    }
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    if (_questionIndex < _questions.length) {
      print('we have more question');
      setState(() {
        _questionIndex += 1;
      });
    } else {
      _questionIndex = _questions.length;
    }

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions)
          : Result(),
    ));
  }
}
