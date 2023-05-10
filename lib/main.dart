import 'package:flutter/material.dart';
import 'package:project_coding_game/Games/game_home.dart';
import 'package:project_coding_game/Games/hangman.dart';
import 'package:project_coding_game/Screens/Blog.dart';
import 'package:project_coding_game/Screens/Blog/addBlog.dart';
import 'package:project_coding_game/Screens/Classement.dart';
import 'package:project_coding_game/Screens/Coding.dart';
import 'package:project_coding_game/Screens/Quiz.dart';
import 'package:project_coding_game/Screens/courses.dart';
import 'package:project_coding_game/Screens/home.dart';
import 'package:project_coding_game/Screens/profile.dart';
import 'package:project_coding_game/Screens/sidemenu.dart';
import 'package:project_coding_game/Screens/terms&conditions.dart';
import 'package:project_coding_game/authentification/sign_in.dart';
import 'package:project_coding_game/authentification/sign_up.dart';
import 'package:connectivity/connectivity.dart';
import 'package:project_coding_game/provider/room_data_provider.dart';
import 'package:provider/provider.dart';

import 'Games/testing-game_room.dart';
import 'Screens/AccueilPage.dart';
import 'Screens/SpeechToText.dart';
import 'Screens/admin.dart';
import 'Screens/chalenge-page.dart';
import 'Screens/level-page.dart';
import 'Screens/rooms/create_room.dart';
import 'Screens/rooms/join_room.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CodeNinja',
          theme: ThemeData(
            //  primarySwatch: Colors.blue,
          ),
          routes: {
            JoinRoom.routeName: (context) => const JoinRoom(),
            CreateRoom.routeName: (context) => const CreateRoom(),
            Hangman.routeName: (context) => const Hangman(),
            GameScreen.routeName: (context) => const GameScreen()
          },
          home: ProfilePage(userId: '6435dfa7b98f0ee65b3f870d',)),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
        body: SingleChildScrollView(
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
                          backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
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
                          style: TextStyle(fontSize: 15, letterSpacing: 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(
                              Color.fromARGB(19, 238, 155, 155)),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Join',
                          style: TextStyle(fontSize: 17, letterSpacing: 1),
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
                      builder: (context) => HomePage(userId: '',),
                    ),
                  );
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(300, 50)),
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
      ),
    );
  }
}