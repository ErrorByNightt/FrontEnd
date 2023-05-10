// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_coding_game/Components/letter.dart';
import 'package:project_coding_game/provider/room_data_provider.dart';
import 'package:provider/provider.dart';

class Hangman extends StatefulWidget {
  static String routeName = '/hangman';
  const Hangman({super.key});

  @override
  State<Hangman> createState() => _HangmanState();
}

class _HangmanState extends State<Hangman> {
  String word = wordsList[Random().nextInt(wordsList.length)];
  List guessedalphabets = [];
  int points = 0;
  int status = 0;
  List images = [
    "assets/hangman/0.png",
    "assets/hangman/1.png",
    "assets/hangman/2.png",
    "assets/hangman/3.png",
    "assets/hangman/4.png",
    "assets/hangman/5.png",
    "assets/hangman/6.png",
  ];

  opendialog(String titre) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 250, 250, 250)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      titre,
                      style: TextStyle(
                          fontFamily: 'Inika',
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Your points : $points",
                      style: TextStyle(
                          fontFamily: 'Inika',
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            status = 0;
                            guessedalphabets.clear();
                            points = 0;
                            word =
                            wordsList[Random().nextInt(wordsList.length)];
                          });
                        },
                        child: Center(
                          child: Text(
                            'PLAY AGAIN ',
                            style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 25,
                                color: Color.fromARGB(255, 59, 91, 182),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          );
        });
  }

  String handletext() {
    String displayword = "";
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (guessedalphabets.contains(char)) {
        displayword += "$char ";
      } else {
        displayword += "? ";
      }
    }
    return displayword;
  }

  checkletter(String alphabet) {
    if (word.contains(alphabet)) {
      setState(() {
        guessedalphabets.add(alphabet);
        points += 5;
      });
    } else if (status != 6) {
      setState(() {
        status += 1;
        points -= 5;
      });
    } else {
      // ignore: avoid_print
      opendialog("YOU  LOST ❌");
    }

    bool isWon = true;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!guessedalphabets.contains(char)) {
        setState(() {
          isWon = false;
        });
        break;
      }
    }

    if (isWon) {
      opendialog("CONGRATULATION 👏🏻");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(215, 0, 0, 0),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 96, 17, 11),
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
                const Spacer(),
                Container(
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
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //alignment: Alignment.center,
                    const Text(
                      '▫️ Hangman ▫️',
                      style: TextStyle(
                        fontFamily: 'Inika',
                        fontSize: 50.0,
                        letterSpacing: 5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.volume_up_sharp),
                      color: Colors.purpleAccent,
                      iconSize: 50,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 5,
                  decoration: const BoxDecoration(color: Colors.lightBlueAccent),
                  height: 30,
                  child: Center(
                      child: Text(
                        "$points Points",
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: 'Inika',
                            letterSpacing: 3),
                      )),
                ),
                SizedBox(height: 20),
                Image(
                  width: 250,
                  height: 250,
                  image: AssetImage(images[status]),
                  color: Colors.white,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 15),
                Text(
                  "${7 - status} lives left",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 139, 113, 113),
                      fontFamily: 'Inika',
                      letterSpacing: 3),
                ),
                const SizedBox(height: 15),
                Text(
                  handletext(),
                  style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontFamily: 'Inika',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3),
                ),
                const SizedBox(height: 15),
                GridView.count(
                  crossAxisCount: 9,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(left: 20),
                  childAspectRatio: 4,
                  children: letters.map((alphabet) {
                    return InkWell(
                      onTap: () => checkletter(alphabet),
                      child: Center(
                        child: Text(alphabet,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inika',
                                fontWeight: FontWeight.bold)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ));
  }
}