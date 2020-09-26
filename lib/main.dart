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
      'answer': [
        {'text': 'Kiki', 'score': 6},
        {'text': 'Momo', 'score': 10},
        {'text': 'Koko', 'score': 4},
        {'text': 'Mimi', 'score': 3}
      ]
    },
    {
      'questionText': 'Whats\' your favourite food?',
      'answer': [
        {'text': 'Spaghetti', 'score': 4},
        {'text': 'Sushi', 'score': 5},
        {'text': 'Kimbap', 'score': 8},
        {'text': 'Nasi Lemak', 'score': 1}
      ]
    },
    {
      'questionText': 'Whats\' your favourite colour?',
      'answer': [
        {'text': 'Pink', 'score': 2},
        {'text': 'Blue', 'score': 4},
        {'text': 'White', 'score': 7},
        {'text': 'Black', 'score': 6}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    if (_questionIndex < _questions.length) {
      print('we have more question');
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
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
