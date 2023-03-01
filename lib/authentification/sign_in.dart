import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_coding_game/authentification/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  static Future<http.Response> login(String username, String password) async {
    Uri LoginURI = Uri.parse("http://localhost:9095/user/login");
    final data = {"email": username, "password": password};
    String params = jsonEncode(data);
    http.Response response =
        await http.post(LoginURI, body: params, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    return response;
  }

  static Future<http.Response> SendMail(String email) async {
    Uri SendMailURI =
        Uri.parse("http://localhost:9095/user/send-confirmation-email");
    final data = {"email": email};
    String params = jsonEncode(data);
    http.Response response =
        await http.post(SendMailURI, body: params, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    return response;
  }

  //var

  late String _username;
  late String _password;
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const double kDefaultMargin = 40.0;
    const double kDefaultFontSize = 14.0;
    bool _isValidEmail(String email) {
      // Regex pattern for validating email
      RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      return regex.hasMatch(email);
    }

    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwdController = TextEditingController();
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
                                Color.fromARGB(19, 238, 155, 155)),
                          ),
                          onPressed: () {},
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
                  'Welcome Back </> ',
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
                    controller: _usernameController,
                    //textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          )),
                      fillColor: Color.fromARGB(103, 229, 229, 229),
                      filled: true,
                      prefixIcon: Icon(Icons.person,
                          color: Color.fromARGB(255, 252, 239, 239)),
                      hintText: "Username",
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
                  child: TextFormField(
                    controller: _passwdController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          )),
                      fillColor: Color.fromARGB(103, 229, 229, 229),
                      filled: true,
                      prefixIcon: Icon(Icons.lock,
                          color: Color.fromARGB(255, 252, 239, 239)),
                      hintText: "Password",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 252, 239, 239),
                          letterSpacing: 1,
                          fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 300),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Center(
                              child: Stack(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: <Widget>[
                                  // Stroked text as border.
                                  /*  Text(
                                    'Forget Password ?',
                                    style: TextStyle(
                                      fontSize: 40,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 6
                                        ..color =
                                            Color.fromARGB(255, 239, 150, 150),
                                    ),
                                  ),*/
                                  // Solid text as fill.
                                  const Text(
                                    'Forget Password  ?',
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Color.fromARGB(255, 223, 91, 91),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            content: Container(
                              padding: EdgeInsets.all(kDefaultMargin),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Enter your email address to receive a password reset link.',
                                    style:
                                        TextStyle(fontSize: kDefaultFontSize),
                                  ),
                                  SizedBox(height: kDefaultMargin),
                                  TextField(
                                    controller: _emailController,
                                    //controller: _emailCtrl,
                                    decoration: InputDecoration(
                                        hintText: 'Entre your E-mail',
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade600),
                                        prefixIcon: const Icon(
                                          CupertinoIcons.mail,
                                          color: Color.fromARGB(
                                              255, 237, 115, 115),
                                          size: 18,
                                        ),
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12))),
                                        filled: true,
                                        fillColor: Colors.grey.shade200),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () async {
                                  String email = _emailController.text;
                                  if (!_isValidEmail(email)) {
                                    // Show an error message
                                    print("errrrror");
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text(
                                            'Adresse e-mail invalide'),
                                        content: const Text(
                                            'Veuillez entrer une adresse e-mail valide.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () async {},
                                            child: Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    final response =
                                        await SendMail(_emailController.text);

                                    Map<String, dynamic> body =
                                        jsonDecode(response.body);
                                    switch (response.statusCode) {
                                      case 200:
                                        {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: const Text(
                                                  'Mail Sent Successfully'),
                                              content: Text('Sent to ' +
                                                  _emailController.text),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                        break;
                                      case 403:
                                        {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: const Text('Error'),
                                              content: Text('403'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                        break;
                                      default:
                                        {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: const Text('Error'),
                                              content: Text('Server Error'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                        break;
                                    }
                                    print('L\'e-mail $email a été envoyé');
                                  }
                                },
                                child: Text('Send'),
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 194, 67,
                                      67), // couleur de fond du bouton
                                  onPrimary: Colors
                                      .white, // couleur du texte du bouton
                                ),
                                // Rest of the code
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                                style:
                                    TextButton.styleFrom(primary: Colors.grey),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Forget Password',
                      style: TextStyle(
                        color: Color.fromARGB(255, 165, 157, 157),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // bouton get started

                ElevatedButton(
                  onPressed: () async {
                    final response = await login(
                        _usernameController.text, _passwdController.text);
                    Map<String, dynamic> body = jsonDecode(response.body);
                    switch (response.statusCode) {
                      case 200:
                        {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Login Successful'),
                              content:
                                  Text('Welcome ' + _usernameController.text),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                        break;
                      case 403:
                        {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Error'),
                              content: Text('403'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                        break;
                      default:
                        {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Error'),
                              content: Text('Server Error'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                        break;
                    }
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
