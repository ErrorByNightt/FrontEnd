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
    return AlertDialog(
        backgroundColor: Color.fromRGBO(3, 3, 3, 0.6),
        title: Center(
          child: Column(
            children: [
              Center(
                child: Text(
                  'LEARN CODING IN A NEW WAY !',
                  style: TextStyle(
                    fontFamily: 'Inika',
                    fontSize: 60,
                    color: Colors.amber,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
    
                      child: Column(
                        children: [

                          const Text(
                            'Signup For Better Experience with CodeNinja.',
                            style: TextStyle(
                              fontSize: 20.0,
                              letterSpacing: 2,
                              color: Colors.white,
                               fontWeight: FontWeight.w300,
                               fontFamily: 'Inika',
                            ),
                          ),

                          const SizedBox(height: 40),

                          //  Text Field

                          Container(
                            margin: const EdgeInsets.fromLTRB(250, 20, 250, 0),
                            child: TextFormField(
                              controller: _usernameCtrl,
                              //textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.all(Radius.circular(0.0)),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                    )),
                                fillColor: Colors.transparent,
                                filled: true,
                                prefixIcon: Icon(Icons.person,
                                    color: Color.fromARGB(255, 252, 239, 239)),
                                hintText: "Your Username",
                                hintStyle: TextStyle(
                                   fontFamily: 'Inika',
                                color: Colors.white,
                                 fontWeight: FontWeight.w400,
                                letterSpacing: 2,
                                fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // textfield Password

                          Container(
                            margin: const EdgeInsets.fromLTRB(250, 0, 250, 0),
                            child: TextFormField(
                              controller: _emailCtrl,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                    )),
                                fillColor: Colors.transparent,
                                filled: true,
                                prefixIcon: Icon(Icons.mail,
                                    color: Color.fromARGB(255, 252, 239, 239)),
                                hintText: "Your E-mail",
                                hintStyle: TextStyle(
                                   fontFamily: 'Inika',
                                color: Colors.white,
                                 fontWeight: FontWeight.w400,
                                letterSpacing: 2,
                                fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          Container(
                            margin: const EdgeInsets.fromLTRB(250, 0, 250, 0),
                            child: TextFormField(
                              controller: _passCtrl,
                              //textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(0.0)),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                    )),
                                fillColor: Colors.transparent,
                                filled: true,
                                prefixIcon: Icon(Icons.lock,
                                    color: Color.fromARGB(255, 252, 239, 239)),
                                hintText: "Your password",
                                hintStyle: TextStyle(
                                   fontFamily: 'Inika',
                                color: Colors.white,
                                 fontWeight: FontWeight.w400,
                                letterSpacing: 2,
                                fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // confirm password

                          Container(
                            margin: const EdgeInsets.fromLTRB(250, 0, 250, 0),
                            child: TextFormField(
                              controller: _confirmPassCtrl,
                              //textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(0.0)),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                    )),
                                fillColor: Colors.transparent,
                                filled: true,
                                prefixIcon: Icon(Icons.lock_outline,
                                    color: Color.fromARGB(255, 252, 239, 239)),
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                    fontFamily: 'Inika',
                                color: Colors.white,
                                 fontWeight: FontWeight.w400,
                                letterSpacing: 2,
                                fontSize: 20),
                              ),
                            ),
                          ),

                          const SizedBox(height: 40),
  
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'SIGN UP Using:',
                                style: TextStyle(
                                    fontFamily: 'Inika',
                                fontSize: 29.0,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                              const SizedBox(width: 30),

                              // ignore: avoid_unnecessary_containers
                              InkWell(
                                onTap: () async {
                                  var user = await LoginAPi.login();
                                  if (user != null) {
                                    print("ok");
                                    print(user.displayName);
                                    print(user.email);
                                    {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(),
                                        ),
                                      );
                                    }
                                  } else {
                                    print("error");
                                  }
                                },
                                child: Image.asset(
                                  'assets/images/google.png',
                                  height: 25,
                                  width: 25,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              const SizedBox(width: 20),

                              InkWell(
                                onTap: () {
                                  print("fbbbbb");
                                },
                                child: Image.asset(
                                  'assets/images/facebook.png',
                                  height: 25,
                                  width: 25,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                            ],
                          ),
                          // bouton get started
                              const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              final response = await signup(_passCtrl.text,
                                  _emailCtrl.text, _usernameCtrl.text);

                              Map<String, dynamic> body =
                                  jsonDecode(response.body);
                              switch (response.statusCode) {
                                case 200:
                                  {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title:
                                            const Text('SignUp Successfully'),
                                        content: Text('Welcome Abord ' +
                                            _usernameCtrl.text),
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
                              fixedSize: MaterialStateProperty.all(
                                  const Size(300, 50)),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Colors.amber),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                            ),
                            child: const Text('Sign UP',
                             style: TextStyle(
                           fontFamily: 'Inika',
                                fontSize: 29.0,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w800,
                                color: Colors.black
                        ),),
                          ),
                        
                        ],
                      ),
                   ),
            ],
          ),
        ));
  }
}
