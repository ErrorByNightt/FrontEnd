// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_coding_game/Games/Entrainement.dart';
import 'package:project_coding_game/Games/hangman.dart';

class GameHome extends StatelessWidget {
  const GameHome({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Column(children: [
                Container(
                  child: Image(
                    width: 300,
                    height: 200,
                    image: AssetImage(
                      "assets/hangman/startgame.png",
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image(
                        width: 380,
                        height: 380,
                        image: AssetImage(
                          "assets/hangman/gallow.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      child: Image(
                        width: 280,
                        height: 280,
                        image: AssetImage(
                          "assets/hangman/dragdrop.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Center(
                    child: IntrinsicWidth(
                  child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 60),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  const Size(150, 50)),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 215, 212, 59)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            child: Text('START',
                                style: TextStyle(
                                    fontFamily: 'Inika',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Hangman()),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 150),
                        Container(
                          margin: EdgeInsets.only(left: 80),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  const Size(150, 50)),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 215, 212, 59)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            child: Text('START',
                                style: TextStyle(
                                    fontFamily: 'Inika',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Entrainement()),
                              );
                            },
                          ),
                        ),
                      ]),
                )),
              ]),
            )));
  }
}
