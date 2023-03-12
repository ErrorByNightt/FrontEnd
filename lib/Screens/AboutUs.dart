import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_coding_game/Components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:project_coding_game/Screens/FeedBack.dart';
import 'package:project_coding_game/authentification/sign_up.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  //var

  late String _username;
  late String _password;

  //final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const double kDefaultMargin = 40.0;
    const double kDefaultFontSize = 14.0;
    bool _isValidEmail(String email) {
      // Regex pattern for validating email
      RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      return regex.hasMatch(email);
    }

    TextEditingController _emailController = TextEditingController();
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
                          onPressed: () {},
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutUs(),
                              ),
                            );
                          },
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SIgnUp(),
                              ),
                            );
                          },
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FeedBack(),
                              ),
                            );
                          },
                          child: const Text(
                            'Contact Us',
                            style: TextStyle(fontSize: 10, letterSpacing: 1),
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
                Column(
                  children: [
                    const Center(
                      child: Text(
                        'ABOUT US',
                        style: TextStyle(
                          fontFamily: 'Inika',
                          fontSize: 50.0,
                          letterSpacing: 5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      width: 350.0,
                      height: 220.0,
                    ),
                    SizedBox(height: 7.0),
                    Text(
                      'CodeNinja is a game created under the ErrorByNight student group.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.5,
                        letterSpacing: 2,
                        color: Color.fromARGB(255, 222, 124, 124),
                      ),
                    ),
                    Text(
                      'The members of ErrorByNight have worked hard to bring CodeNinja to life using their skills and creativity.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.5,
                        letterSpacing: 2,
                        color: Color.fromARGB(255, 222, 124, 124),
                      ),
                    ),
                    Text(
                      'This game has been crafted with passion and expertise to deliver an immersive and captivating gaming experience for gamers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.5,
                        letterSpacing: 2,
                        color: Color.fromARGB(255, 222, 124, 124),
                      ),
                    ),
                    Text(
                      'And to enrich the lives of gamers by creating memorable and meaningful gaming experiences.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.5,
                        letterSpacing: 2,
                        color: Color.fromARGB(255, 222, 124, 124),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'A platform that allows users to take programming tests according to the chosen technology/programming language.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.5,
                        letterSpacing: 2,
                        color: Color.fromARGB(255, 222, 124, 124),
                      ),
                    ),
                    Text(
                      'It also includes a documentation area that serves to help users get to know the different languages',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.5,
                        letterSpacing: 2,
                        color: Color.fromARGB(255, 222, 124, 124),
                      ),
                    ),
                    Text(
                      'We aim to create a learning and gaming platform at the same time Users will be able to play with others or solo against AI,',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.5,
                        letterSpacing: 2,
                        color: Color.fromARGB(255, 222, 124, 124),
                      ),
                    ),
                    Text(
                      'earning points and badges as they progress to other levels.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.5,
                        letterSpacing: 2,
                        color: Color.fromARGB(255, 222, 124, 124),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ));
  }
}
