import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../models/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  static Future<QCM> GetQCM() async {
    Uri getQCMURI = Uri.parse("http://localhost:9095/ai/genQCM");
    http.Response response =
    await http.get(getQCMURI, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    var decoded = json.decode(response.body);
    QCM object = new QCM(decoded[0]['_id'], decoded[0]['question'], decoded[0]['answer1'], decoded[0]['answer2'], decoded[0]['answer3'], decoded[0]['answer4'], decoded[0]['correctAnswer']);
    return object;
  }


  static Future<http.Response> GetHint(String question) async {
    Uri GetHintURI = Uri.parse("http://localhost:9095/ai/getHINT");
    final data = {"question": question};
    String params = jsonEncode(data);
    http.Response response =
    await http.post (GetHintURI, body: params, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print(response);
    return response;
  }




  static Future<http.Response> SolveQCM(String id, String UserAttepmt) async {
    Uri solveQCMURI = Uri.parse("http://localhost:9095/ai/solveQCM");
    final data = {"id": id, "userAttempt": UserAttepmt};
    String params = jsonEncode(data);
    http.Response response =
    await http.post(solveQCMURI, body: params, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print(response);
    return response;
  }

  void populateQuestionList() async {
    QCM qcm = await GetQCM();
    questionList.add(qcm);
  }

  // Define the data
  List<QCM> questionList = [];
  int currentQuestionIndex = 0;
  int score = 0;
  TextEditingController answerController = TextEditingController();
  late final Timer _timer; // Use "late final" instead of "late"
  int _timeLeft = 60;
  bool _timeUp = false;
  // Add a flag to check if time is up
  final backgroundColor = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xff951208), Color(0xff250402)],
    ),
  );

  final scaffoldMargin =
  const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  final questionTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  final answerTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  final hintTextStyle = const TextStyle(
    color: Colors.grey,
  );
  final answerBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.black, Colors.grey],
    ),
    borderRadius: BorderRadius.circular(16),
  );

  @override
  void initState() {
    super.initState();
    for (int i=0; i<5; i++) {
      populateQuestionList();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _timer.cancel();
          _showScoreDialog();
          _timeUp = true; // Set time up flag to true
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backgroundColor,
        // margin: scaffoldMargin,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Simple Quiz App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 20),
              SlideCountdown(
                key: ValueKey(currentQuestionIndex),
                duration: Duration(seconds: _timeLeft),
                separatorType: SeparatorType.title,
                slideDirection: SlideDirection.down,
              ),
              _questionWidget(),
              const SizedBox(height: 20),
              _nextButton(),
            ],
          ),
        ),
      ),
    );
  }

  _questionWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        questionList[currentQuestionIndex].question,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 30),
                      _answerList(),
                      const SizedBox(height: 10),
                      _answerWidget(),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () async {

                    final response = await GetHint(questionList[currentQuestionIndex].question );
                    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
                    String hint = jsonResponse['hint'];
                    _showHintDialog(hint);
                  },
                  child: Image.asset(
                    'assets/images/Live-Chatbot-unscreen.gif',
                    height: 200,
                    width: 150,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  _showHintDialog(String hint ) {
    final theme = Theme.of(context);
    final dialog = Dialog(
      child: Container(
        width: 500,
        height: 160,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hint",
                style: theme.textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                hint,
                style: theme.textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("OK"),
              ),
            ),
          ],
        ),
      ),
    );

    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        return RotationTransition(
          turns: Tween(begin: 1.0, end: 6.0).animate(animation),
          child: dialog,
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 600),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: child,
        );
      },
    );
  }

  _answerList() {
    List<String> AnswerList = [];
    AnswerList.add(questionList[currentQuestionIndex].answer1);
    AnswerList.add(questionList[currentQuestionIndex].answer2);
    AnswerList.add(questionList[currentQuestionIndex].answer3);
    AnswerList.add(questionList[currentQuestionIndex].answer4);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: AnswerList
            .map((answer) => GestureDetector(
          onTap: () {},
          child: Container(
            // Adjust the width as per your needs
            margin: const EdgeInsets.symmetric(vertical: 2),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              answer,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ))
            .toList(),
      ),
    );
  }

  Widget _answerWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: answerBoxDecoration,
      child: TextField(
        controller: answerController,
        style: answerTextStyle,
        decoration: InputDecoration(
          hintText: "Type your answer here",
          hintStyle: hintTextStyle,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _nextButton() {
    return ElevatedButton.icon(
      onPressed: () async {
        // Check if the user input is correct
        String userAnswer = answerController.text;
        bool isAnswerCorrect = false;

        print(questionList[currentQuestionIndex].id);
        print(userAnswer);

        final response = await SolveQCM(questionList[currentQuestionIndex].id, userAnswer);

        print(response.statusCode);


        if (response.statusCode == 200) {
          // Increase the score if the answer is correct
          score++;
        } else if (response.statusCode == 403) {
          print("Bad Answer");
        }

        print(score);
        // Clear the answer text field
        answerController.clear();

        // Move to the next question
        if (currentQuestionIndex < questionList.length - 1) {
          setState(() {
            currentQuestionIndex++;
          });
        } else {
          // If all questions have been answered, show the score dialog
          _showScoreDialog();
        }
      },
      icon: Icon(Icons.arrow_forward_sharp, size: 24),
      label: currentQuestionIndex < questionList.length - 1
          ? Text("Next Question", style: TextStyle(fontSize: 20))
          : Text("Finish", style: TextStyle(fontSize: 20)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  void _showScoreDialog() {
    showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: ("Quiz Completed"),
          contentText: ("Your score is $score/${questionList.length}"),
          actions: [
            TextButton(
              onPressed: () {
// Reset the quiz
                setState(() {
                  currentQuestionIndex = 0;
                  score = 0;
                  answerController.clear();
                  _timeLeft = 60;
                  _timeUp = false;
                });
                Navigator.pop(context);
              },
              child: const Text("Play Again"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("Quit"),
            ),
          ],
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
    );
  }
}

class QCM {
  final String id;
  final String question;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final String correctAnswer;

  QCM(this.id, this.question, this.answer1, this.answer2, this.answer3, this.answer4, this.correctAnswer);
}