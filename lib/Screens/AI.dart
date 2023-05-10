import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../authentification/sign_in.dart';

class AI extends StatelessWidget {
  const AI({super.key});

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
                                Color.fromARGB(19, 238, 155, 155)),
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
                            style: TextStyle(fontSize: 10, letterSpacing: 1),
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
                            'Register',
                            style: TextStyle(fontSize: 10, letterSpacing: 1),
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
                            'Courses',
                            style: TextStyle(fontSize: 10, letterSpacing: 1),
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
                            'About Us',
                            style: TextStyle(fontSize: 10, letterSpacing: 1),
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
                            'Contact Us',
                            style: TextStyle(fontSize: 10, letterSpacing: 1),
                          ),
                        ),
                      ),
                    ]),
                const Center(
                  child: Text(
                    'About AI ',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 50.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Why did we use AI in our web application?  ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Inika',
                    letterSpacing: 2,
                    color: Color.fromARGB(255, 222, 124, 124),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/AI-Development.png',
                          width: 600,
                          height: 700,
                        ),
                        Container(
                            width: 550,
                            child: const Text(
                              'ABOUT AI\n'
                              '\n Artificial intelligence (AI) has been infiltrating nearly all virtual areas for quite some time now. Artificial intelligence in game development is not an exception. The technology is something that can do wonders for a game app development company in this era. Automation in-game creation is growing after performing an essential part in modern media.\n'
                              '\n Game creation is reaching amazingly additional levels, and it is all because of artificial intelligence. By recognizing gamers’ goals and issues, AI assists to guarantee that they get joy playing. AI also aids game creators in making more valuable enhancements and changes as per data-driven insights. Apart from meeting its core aim of offering a fantastic gameplay experience, AI also displays many new potentials in the gaming business. It is opening up new opportunities for many businesses that are looking to enter the market.',
                              style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 17.0,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ))
                      ],
                    )
                  ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              width: 550,
                              child: const Text(
                                'Coding with AI?\n'
                                '\n AI-assisted coding is the use of machine learning models to generate code automatically. Most existing AI-assisted coding tools let developers describe in natural language what they want their code to do.',
                                style: TextStyle(
                                    fontFamily: 'Inika',
                                    fontSize: 17.0,
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              )),
                          Image.asset(
                            'assets/images/coding.jpeg',
                            width: 550,
                            height: 600,
                          )
                        ],
                      )
                    ])
              ],
            ),
          ),
        ));
  }
}
