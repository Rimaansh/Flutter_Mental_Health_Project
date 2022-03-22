import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './quiz.dart';
import './result.dart';
import 'provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'Welcome to the Mental Heath Assessment Quiz',
      'answers': [
        {'text': 'Start Quiz', 'score': 0},
      ],
    },
    {
      'questionText':
          'Teaching\n\nQ1. How satisfied are you with Activity Based Learning method adopted by your school?',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q2. How willing do you feel to participate in extra-curricular activities in your school?',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText': 'Q3. How cheerful do you feel in your classroom?',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q4. How much are the Physical Training sessions in your school influencing your Physical Fitness?',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q5. Rate the contribution of your school in your Personality Development.',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Student-Teacher Relation\n\nQ6. How freely can you discuss your doubts with your teachers?',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q7. How respectful and dignified bond do you share with your teachers?',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q8. How often do you share your problems with your teachers?',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText': 'Peers\n\nQ9. How often do you face peer pressure?',
      'answers': [
        {'text': 'Never', 'score': 5},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Frequently', 'score': 2},
        {'text': 'Always', 'score': 1}
      ],
    },
    {
      'questionText': 'Q10. How often do you feel isolated or left out?',
      'answers': [
        {'text': 'Never', 'score': 5},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Frequently', 'score': 2},
        {'text': 'Always', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q11. How often do you face bullying or discrimination in your school?',
      'answers': [
        {'text': 'Never', 'score': 5},
        {'text': 'Rarely', 'score': 4},
        {'text': 'Sometimes', 'score': 3},
        {'text': 'Frequently', 'score': 2},
        {'text': 'Always', 'score': 1}
      ],
    },
    {
      'questionText': 'Q12. To what extent do you feel safe in your school?',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'School Management\n\nQ13. How satisfied are you with the sanitation facilities available in your school?',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q14 .How satisfied are you with the facilities like Canteen/Mid-Day Meal, Potable Drinking Water,  Library, Playground provided by your school?',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    },
    {
      'questionText':
          'Q15 .How effectively are you able to convey your problems to the school management?',
      'answers': [
        {'text': '5 Points', 'score': 5},
        {'text': '4 Points', 'score': 4},
        {'text': '3 Points', 'score': 3},
        {'text': '2 Points', 'score': 2},
        {'text': '1 Point', 'score': 1}
      ],
    },
  ];

  var _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  int teaching = 0;
  int stRel = 0;

  int peers = 0;

  int schMan = 0;

  void _answerQuestion(int score) {
    _totalScore = score + _totalScore;
    switch (_questionIndex) {
      case 0:
        break;
      case 1:
        teaching = score;
        break;
      case 2:
        teaching = score;
        break;
      case 3:
        teaching = score;
        break;
      case 4:
        teaching = score;
        break;
      case 5:
        teaching = score;
        break;
      case 6:
        stRel = score;
        break;
      case 7:
        stRel = score;
        break;
      case 8:
        stRel = score;
        break;
      case 9:
        peers = score;
        break;
      case 10:
        peers = score;
        break;
      case 11:
        peers = score;
        break;
      case 12:
        peers = score;
        break;
      case 13:
        schMan = score;
        break;
      case 14:
        schMan = score;
        break;
      case 15:
        schMan = score;
        break;
    }

    setState(() {
      _questionIndex = _questionIndex + 1;

      avgTeaching = avgTeaching + teaching;

      avgstRel += stRel;

      avgPeers += peers;

      avgschMan += schMan;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print(avgTeaching / 15);
      print(avgPeers / 7);
      print(avgstRel / 10);
      print(avgschMan / 3);
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("KnowYa"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Color(0xFFDD83AD), Color(0xFFB4D6F4)])),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore, _resetQuiz, onPressed),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }

  void onPressed() {}
}
