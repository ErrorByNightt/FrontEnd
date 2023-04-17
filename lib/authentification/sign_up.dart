import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_coding_game/authentification/login_api.dart';
import 'package:project_coding_game/authentification/sign_in.dart';

import '../Screens/home.dart';

bool _isPassMatch = false;

class SIgnUp extends StatefulWidget {
  const SIgnUp({super.key});

  @override
  State<SIgnUp> createState() => _SIgnUpState();
}

class _SIgnUpState extends State<SIgnUp> {
  //var
  static Future<http.Response> signup(
      String password, String email, String username) async {
    Uri signupURI = Uri.parse("http://localhost:9095/user/register");
    final data = {"mail": email, "password": password, "userName": username};
    String params = jsonEncode(data);
    http.Response response =
        await http.post(signupURI, body: params, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    return response;
  }

  //var
  GlobalKey<FormState> formKey = GlobalKey();

  late String username;

  late String mail;

  late String password;

  late String Confirmpassword;

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailCtrl = TextEditingController();
    TextEditingController _usernameCtrl = TextEditingController();
    TextEditingController _passCtrl = TextEditingController();
    TextEditingController _confirmPassCtrl = TextEditingController();
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
                                Color.fromARGB(255, 238, 172, 172)),
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
                            'Contact Us',
                            style: TextStyle(fontSize: 10, letterSpacing: 1),
                          ),
                        ),
                      ),
                    ]),
                const Center(
                  child: Text(
                    'Create Account ',
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
                  'Signup For Better Experience',
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
                    controller: _usernameCtrl,
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
                      hintText: "Your Username",
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
                    controller: _emailCtrl,
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

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 550),
                  child: TextFormField(
                    controller: _passCtrl,
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
                      prefixIcon: Icon(Icons.lock,
                          color: Color.fromARGB(255, 252, 239, 239)),
                      hintText: "Your password",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 252, 239, 239),
                          letterSpacing: 1,
                          fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // confirm password

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 550),
                  child: TextFormField(
                    controller: _confirmPassCtrl,
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
                      prefixIcon: Icon(Icons.lock_outline,
                          color: Color.fromARGB(255, 252, 239, 239)),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 252, 239, 239),
                          letterSpacing: 1,
                          fontSize: 15),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // bouton get started

                ElevatedButton(
                  onPressed: () async {
                    final response = await signup(
                        _passCtrl.text, _emailCtrl.text, _usernameCtrl.text);

                    Map<String, dynamic> body = jsonDecode(response.body);
                    switch (response.statusCode) {
                      case 200:
                        {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('SignUp Successfully'),
                              content:
                                  Text('Welcome Abord ' + _usernameCtrl.text),
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
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Or Sign in with',
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 1, color: Colors.white),
                    ),
                    const SizedBox(width: 10),

                    // ignore: avoid_unnecessary_containers
                    InkWell(
                      onTap: () async {
                        var user = await LoginAPi.login();
                        if (user != null) {
                          print("ok");
                          print(user.displayName);
                          print(user.email);
                          {
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(userId: '',),
                              ),
                            );*/
                          }
                        } else {
                          print("error");
                        }
                      },
                      child: Image.asset(
                        'assets/images/google.png',
                        height: 20,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    const SizedBox(width: 10),

                    InkWell(
                      onTap: () {
                        print("fbbbbb");
                      },
                      child: Image.asset(
                        'assets/images/facebook.png',
                        height: 20,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
