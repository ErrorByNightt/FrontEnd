import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../models/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Define the data
  List<Question> questionList = getQuestions();
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
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  questionList[currentQuestionIndex].questionText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 70),
                _answerList(),
                const SizedBox(height: 30),
                _answerWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _answerList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: questionList[currentQuestionIndex]
            .answersList
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
                      answer.answerText,
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
      onPressed: () {
        // Check if the user input is correct
        String userAnswer = answerController.text.toLowerCase();
        bool isAnswerCorrect = false;
        for (Answer answer in questionList[currentQuestionIndex].answersList) {
          if (answer.isCorrect &&
              answer.answerText.toLowerCase() == userAnswer) {
            isAnswerCorrect = true;
            break;
          }
        }
        if (isAnswerCorrect) {
          // Increase the score if the answer is correct
          score++;
        }
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
