import 'package:flutter/material.dart';
import 'package:project_coding_game/Games/game_home.dart';
import 'package:project_coding_game/Games/hangman.dart';
import 'package:project_coding_game/Screens/Coding.dart';
import 'package:project_coding_game/Screens/Quiz.dart';
import 'package:project_coding_game/Screens/courses.dart';
import 'package:project_coding_game/Screens/home.dart';
import 'package:project_coding_game/Screens/profile.dart';
import 'package:project_coding_game/Screens/terms&conditions.dart';
import 'package:project_coding_game/authentification/sign_in.dart';
import 'package:project_coding_game/authentification/sign_up.dart';
import 'package:project_coding_game/soketMessages.dart';

import 'ChatBot.dart';
import 'Screens/admin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            //  primarySwatch: Colors.blue,
            ),
        home: HomePage());
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _showChatPopupConversation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: 480.0, // Hauteur de la boîte de dialogue
            width: 320.0, // Largeur de la boîte de dialogue
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return SoketMessages(
                  // Taille de police pour le widget de chat
                  );
            }),
          ),
        );
      },
    );
  }

  void _showChatPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return ChatBot();
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff951208), Color(0xff250402)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.red.withOpacity(0.1),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  child: const Text(
                    'Help-Line (+234)08128916397',
                    //   textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 700.0),
                  child: const Text(
                    'Email: codeninja@gmail.com',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // ignore: avoid_unnecessary_containers
                          Image.asset(
                            'assets/images/logo.png',
                            height: 100,
                            alignment: Alignment.topCenter,
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                shadowColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 238, 172, 172)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Login',
                                style:
                                    TextStyle(fontSize: 15, letterSpacing: 1),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                shadowColor: MaterialStateProperty.all(
                                    Color.fromARGB(19, 238, 155, 155)),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Join',
                                style:
                                    TextStyle(fontSize: 17, letterSpacing: 1),
                              ),
                            ),
                          ),
                          /* Container(
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(0, 241, 121, 121)),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'JOIN',
                        )),
                      ),*/
                        ]),
                    const SizedBox(height: 30),
                    const Center(
                      child: Text(
                        'Challenge yourself </> ',
                        style: TextStyle(
                          fontFamily: 'Inika',
                          fontSize: 50.0,
                          letterSpacing: 5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Improve your programming skills and have fun',
                          style: TextStyle(
                            fontSize: 30.0,
                            letterSpacing: 5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Image.asset('assets/images/dragon.png',
                            width: 50, height: 50),
                      ],
                    ),
                    const SizedBox(height: 90),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(300, 50)),
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 239, 150, 150)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      child: const Text('GET STARTED'),
                    ),
                    /*Container(
                      margin: EdgeInsets.only(right: 1000),
                      child: Image.asset('assets/images/chichbich.png',

                          width: 2000, height: 200)),*/
                    const SizedBox(height: 70),
                    Row(
                      children: [
                        Container(
                          //  margin: const EdgeInsets.only(top: 20),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Terms and Conditions',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                            child: Image.asset(
                                'assets/images/Programming_Humor-removebg-preview 1.png',
                                width: 250,
                                height: 200)),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
              Column(
              children: [
              SizedBox(
              height: 100,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 300,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: FloatingActionButton(
                      onPressed: () {
                        _showChatPopupConversation(context);
                      },
                      child: Image.asset('assets/images/robot.png'),
                    ),
                  ),
                ],
              ),
            ],
          ),

                  Column(
                    children: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _showChatPopup(context);
                          },
                          child: Image.asset('assets/images/robot.png'),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          /* floatingActionButton: FloatingDraggableWidget(
    floatingWidget: FloatingActionButton(
    onPressed: () {
    _showChatPopup(context);
    },
    child: Image.asset('assets/images/robot.png'),
    ),
    floatingWidgetHeight: 50,
    floatingWidgetWidth: 50,
    dx: 100,
    dy: 200,
    deleteWidgetDecoration: const BoxDecoration(
    gradient: LinearGradient(
    colors: [Colors.white12, Colors.grey],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [.0, 1],
    ),
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
    ),
    ),
    deleteWidget: Container(
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(width: 2, color: Colors.black87),
    ),
    child: const Icon(Icons.close, color: Colors.black87),
    ),
    onDeleteWidget: () {
    debugPrint('Widget deleted');
    },
    mainScreenWidget: Scaffold(
    body: Column(
    children: [
    SizedBox(
    height: 100,
    ),
    Row(
    children: [
    SizedBox(
    width: 300,
    ),
    Container(
    width: 50,
    height: 50,
    child: FloatingActionButton(
    onPressed: () {
    _showChatPopupConversation(context);
    },
    child: Image.asset('assets/images/robot.png'),
    ),
    ),
    ],
    ),
    ],
    ),
    appBar: AppBar(
    title: const Text('Floating Animated Widget'),
    ),
    ),
    ),
*/
        ));
  }
}
