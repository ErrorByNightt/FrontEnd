import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Question {
  final String question;
  final bool answer;

  Question({required this.question, required this.answer});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      answer: json['answer'].toLowerCase() == 'true',
    );
  }

}

class JavaScreen extends StatefulWidget {
  @override
  _JavaScreenState createState() => _JavaScreenState();
}

class _JavaScreenState extends State<JavaScreen> {
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  TextEditingController _answerController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    String data = await rootBundle.loadString('assets/data/questions.json');
    print(data); // affiche le contenu de fichier JSON chargé
    List<dynamic> questionsJson = jsonDecode(data);
    setState(() {
      _questions = questionsJson.map((q) => Question.fromJson(q)).toList();
    });
  }

  void _showScoreDialog(int score, int total) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz complet!'),
        content: Text('Votre score est de $score / $total'),
        actions: <Widget>[
          TextButton(
            child: Text('Rejouer'),
            onPressed: () {
              setState(() {
                _currentQuestionIndex = 0;
                _answerController.clear();
                _score = 0;
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _checkAnswer() {
    bool userAnswer = _answerController.text.toLowerCase() == 'true';
    bool correctAnswer = _questions[_currentQuestionIndex].answer;
    if (userAnswer == correctAnswer) {
      setState(() {
        _score++;
      });
    }
    _answerController.clear();
    _showNextQuestion();
  }

  void _showNextQuestion() {
    setState(() {
      _currentQuestionIndex++;
    });
    if (_currentQuestionIndex >= _questions.length) {
      _showScoreDialog(_score, _questions.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        body: Center(

        ),
      );
    }

    Question currentQuestion = _questions[_currentQuestionIndex];

    String questionText = currentQuestion.question.replaceAll(
      '/* complétez ici */',
      'isEven(',
    ) + ') ? true : false;';

    return Scaffold(
        appBar: AppBar(
          title: Text('Code Quiz'),
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Form(
    key: _formKey,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Text(
    'Question ${_currentQuestionIndex + 1} / ${_questions.length}',
    style: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    questionText,
    style: TextStyle(
    fontSize: 16.0,
    fontFamily: 'monospace',
    ),
    ),
    SizedBox(height: 16.0),
    TextFormField(
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Réponse',
    ),
    controller: _answerController,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Veuillez entrer une réponse';
    }
    return null;
    },
    ),
    SizedBox(height: 16.0),
    ElevatedButton(
    onPressed: () {
    if (_formKey.currentState!.validate()) {
    _checkAnswer();
    }
    },
    child: Text('Valider'),
    ),
    ],
    ),
    ),
        ) );
  }
}
