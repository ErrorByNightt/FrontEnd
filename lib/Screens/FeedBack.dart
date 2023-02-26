import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_coding_game/Components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:project_coding_game/authentification/sign_up.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  //var

  late String _email;
  late String _text;

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
                                Color.fromARGB(19, 238, 155, 155)),
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
                                Color.fromARGB(255, 238, 172, 172)),
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
                const Center(
                  child: Text(
                    'HELLO, WORLD ! ',
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
                  'Weʼd love your feedBack !',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 2,
                    color: Color.fromARGB(255, 222, 124, 124),
                  ),
                ),

                const SizedBox(height: 40),

                //  Text Field

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 550),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          )),
                      fillColor: Color.fromARGB(103, 229, 229, 229),
                      filled: true,
                      prefixIcon: Icon(Icons.mail,
                          color: Color.fromARGB(255, 252, 239, 239)),
                      hintText: "Your E-mail",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 252, 239, 239),
                          letterSpacing: 1,
                          fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // textfield Password


            Container(
              margin: const EdgeInsets.symmetric(horizontal: 550),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  fillColor: Color.fromARGB(103, 229, 229, 229),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.feedback,
                    color: Color.fromARGB(255, 252, 239, 239),
                  ),
                  hintText: "Your FeedBack",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 252, 239, 239),
                    letterSpacing: 1,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
                const SizedBox(height: 20),
                
                ElevatedButton(
                  onPressed: () {},
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
                  child: const Text('SEND'),
                ),
                const SizedBox(height: 60),

                Row(
                  //  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 80),
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
                            'assets/images/Live-Chatbot-unscreen.gif',
                            width: 550,
                            height: 160)),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
