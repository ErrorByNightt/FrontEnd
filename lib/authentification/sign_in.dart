import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_coding_game/Screens/FeedBack.dart';
import 'package:project_coding_game/Screens/home.dart';
import 'package:project_coding_game/Screens/terms&conditions.dart';
import 'package:project_coding_game/authentification/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController pin1Controller = TextEditingController();
  TextEditingController pin2Controller = TextEditingController();
  TextEditingController pin3Controller = TextEditingController();
  TextEditingController pin4Controller = TextEditingController();

  late FocusNode pin1FocusNode;

  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();

    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode.dispose();

    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  static Future<http.Response> login(String username, String password) async {
    Uri LoginURI = Uri.parse("http://localhost:9095/user/login");
    final data = {"mail": username, "password": password};
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

    return AlertDialog(
        backgroundColor: Color.fromRGBO(3, 3, 3, 0.6),
        title: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  //Container(
                  //margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  //child:
                  Center(
                    child: Text(
                      'LET THE CODING BEGIN !',
                      style: TextStyle(
                        fontFamily: 'Inika',
                        fontSize: 60,
                        color: Colors.amber,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  //),

                  Container(
                    width: 1000,
                    height: 500,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(250, 100, 250, 0),
                          child: TextFormField(
                            controller: _usernameController,
                            //textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0.0)),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                  )),
                              fillColor: Colors.transparent,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              hintText: "USERNAME",
                              hintStyle: TextStyle(
                                  fontFamily: 'Inika',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 2,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),

                        // textfield Password

                        Container(
                          margin: const EdgeInsets.fromLTRB(250, 20, 250, 40),
                          child: TextFormField(
                            controller: _passwdController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0.0)),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                  )),
                              fillColor: Colors.transparent,
                              filled: true,
                              prefixIcon: Icon(Icons.lock, color: Colors.white),
                              hintText: "PASSWORD",
                              hintStyle: TextStyle(
                                  fontFamily: 'Inika',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                  fontSize: 20),
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
                                        children: <Widget>[
                                          const Text(
                                            'Forget Password ?',
                                            style: TextStyle(
                                              fontFamily: 'Inika',
                                              letterSpacing: 3,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 40,
                                              color: Colors.black,
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
                                            style: TextStyle(
                                                fontFamily: 'Inika',
                                                letterSpacing: 3,
                                                fontWeight: FontWeight.w500,
                                                fontSize: kDefaultFontSize),
                                          ),
                                          SizedBox(height: kDefaultMargin),
                                          TextField(
                                            controller: _emailController,
                                            //controller: _emailCtrl,
                                            decoration: InputDecoration(
                                                hintText: 'Enter your E-mail',
                                                hintStyle: TextStyle(
                                                    fontFamily: 'Inika',
                                                    fontSize: 10.0,
                                                    letterSpacing: 3,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                                prefixIcon: const Icon(
                                                  CupertinoIcons.mail,
                                                  color: Color(0xff951208),
                                                  size: 18,
                                                ),
                                                border:
                                                    const OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    0.0)),
                                                        borderSide: BorderSide(
                                                          width: 2,
                                                          color: Colors.black,
                                                          style:
                                                              BorderStyle.solid,
                                                        )),
                                                filled: true,
                                                fillColor: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  String email =
                                                      _emailController.text;
                                                  if (!_isValidEmail(email)) {
                                                    Navigator.of(context).pop();

                                                    // Show an error message
                                                    print("errrrror");
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(40.0),
                                                          child: AlertDialog(
                                                            title: Center(
                                                              child: Stack(
                                                                children: <
                                                                    Widget>[
                                                                  const Text(
                                                                    'Type in the code that you have reveived.',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          30.0,
                                                                      letterSpacing:
                                                                          2,
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontFamily:
                                                                          'Inika',
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            content: Container(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 50,
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          pin1Controller,
                                                                      focusNode:
                                                                          pin1FocusNode,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        border:
                                                                            OutlineInputBorder(
                                                                               borderSide: BorderSide(
                                                                                 color: Color(0xff951208),
                                                                              )
                                                                            ),
                                                                      ),
                                                                      onChanged:
                                                                          (value) {
                                                                        if (value.length ==
                                                                            1) {
                                                                          pin2FocusNode
                                                                              .requestFocus();
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 50,
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          pin2Controller,
                                                                      focusNode:
                                                                          pin2FocusNode,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        border:
                                                                            OutlineInputBorder(
                                                                               borderSide: BorderSide(
                                                                                 color: Color(0xff951208),
                                                                              )
                                                                            ),
                                                                      ),
                                                                      onChanged:
                                                                          (value) {
                                                                        if (value.length ==
                                                                            1) {
                                                                          pin3FocusNode
                                                                              .requestFocus();
                                                                        } else if (value
                                                                            .isEmpty) {
                                                                          pin1Controller
                                                                              .clear();
                                                                          pin1FocusNode
                                                                              .requestFocus();
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 50,
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          pin3Controller,
                                                                      focusNode:
                                                                          pin3FocusNode,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        border:
                                                                            OutlineInputBorder(
                                                                               borderSide: BorderSide(
                                                                                 color: Color(0xff951208),
                                                                              )
                                                                            ),
                                                                      ),
                                                                      onChanged:
                                                                          (value) {
                                                                        if (value.length ==
                                                                            1) {
                                                                          pin4FocusNode
                                                                              .requestFocus();
                                                                        } else if (value
                                                                            .isEmpty) {
                                                                          pin2Controller
                                                                              .clear();
                                                                          pin2FocusNode
                                                                              .requestFocus();
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 50,
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          pin4Controller,
                                                                      focusNode:
                                                                          pin4FocusNode,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        border:
                                                                            OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                 color: Color(0xff951208),
                                                                              )
                                                                            ),
                                                                      ),
                                                                      onChanged:
                                                                          (value) {
                                                                        if (value
                                                                            .isEmpty) {
                                                                          pin3Controller
                                                                              .clear();
                                                                          pin3FocusNode
                                                                              .requestFocus();
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            actions: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        20.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                        showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return Padding(
                                                                              padding: const EdgeInsets.all(40.0),
                                                                              child: AlertDialog(
                                                                                title: Center(
                                                                                  child: Stack(
                                                                                    children: <Widget>[
                                                                                      const Text(
                                                                                        'CREATE A NEW PASSWORD',
                                                                                        style: TextStyle(
                                                                                          fontSize: 40.0,
                                                                                          letterSpacing: 2,
                                                                                          color: Colors.black,
                                                                                          fontWeight: FontWeight.w300,
                                                                                          fontFamily: 'Inika',
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                content: Container(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: [
                                                                                      Row(
                                                                                        children: [
                                                                                          const Text(
                                                                                            'Password',
                                                                                            style: TextStyle(
                                                                                              fontSize: 20.0,
                                                                                              letterSpacing: 2,
                                                                                              color: Color(0xff951208),
                                                                                              fontWeight: FontWeight.w300,
                                                                                              fontFamily: 'Inika',
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      SizedBox(height: 6),
                                                                                      TextField(
                                                                                        textAlign: TextAlign.start,
                                                                                        decoration: InputDecoration(
                                                                                          hintText: '........',
                                                                                          hintStyle: TextStyle(color: Color(0xff951208)),
                                                                                          border: const OutlineInputBorder(
                                                                                              borderRadius: BorderRadius.all(Radius.circular(0.0)),
                                                                                              borderSide: BorderSide(
                                                                                                width: 2,
                                                                                                color: Color(0xff951208),
                                                                                                style: BorderStyle.solid,
                                                                                              )),
                                                                                          filled: true,
                                                                                          fillColor: Colors.white,
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(height: 30),
                                                                                      Row(
                                                                                        children: [
                                                                                          const Text(
                                                                                            'Confirm Password',
                                                                                             style: TextStyle(
                                                                                              fontSize: 20.0,
                                                                                              letterSpacing: 2,
                                                                                              color: Color(0xff951208),
                                                                                              fontWeight: FontWeight.w300,
                                                                                              fontFamily: 'Inika',
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      SizedBox(height: 6),
                                                                                      TextField(
                                                                                        textAlign: TextAlign.start, //Ajout de cette ligne pour centrer le texte
                                                                                        //controller: _emailCtrl,
                                                                                        decoration: InputDecoration(
                                                                                          hintText: '.........',
                                                                                          hintStyle: TextStyle(color: Color(0xff951208)),
                                                                                          border: const OutlineInputBorder(
                                                                                              borderRadius: BorderRadius.all(Radius.circular(0.0)),
                                                                                              borderSide: BorderSide(
                                                                                                width: 2,
                                                                                                color: Color(0xff951208),
                                                                                                style: BorderStyle.solid,
                                                                                              )),
                                                                                          filled: true,
                                                                                          fillColor: Colors.white,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                actions: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.all(20.0),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        SizedBox(
                                                                                          width: 150,
                                                                                          child: ElevatedButton(
                                                                                            onPressed: () {},
                                                                                            child: Text(
                                                                                              'CONFIRMER',
                                                                                              style: TextStyle(color: Colors.white,
                                                                                               fontFamily: 'Inika',),
                                                                                            ),
                                                                                            style: ElevatedButton.styleFrom(
                                                                                              primary: Colors.black, // couleur de fond du bouton
                                                                                              onPrimary: Colors.white, // couleur du texte du bouton
                                                                                            ),
                                                                                            // Rest of the code
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 20,
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 150,
                                                                                          child: ElevatedButton(
                                                                                            onPressed: () {
                                                                                              Navigator.of(context).pop();
                                                                                            },
                                                                                            child: Text(
                                                                                              'CANCEL',
                                                                                              style: TextStyle(color: Colors.black,
                                                                                               fontFamily: 'Inika',),
                                                                                            ),
                                                                                            style: ElevatedButton.styleFrom(
                                                                                              primary: Colors.white, // couleur de fond du bouton
                                                                                              onPrimary: Colors.white, // couleur du texte du bouton
                                                                                            ),
                                                                                            // Rest of the code
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'CONFIRM',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        primary: Colors.black, // couleur de fond du bouton
                                                                        onPrimary:
                                                                            Colors.white, // couleur du texte du bouton
                                                                      ),
                                                                      // Rest of the code
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    final response =
                                                        await SendMail(
                                                            _emailController
                                                                .text);

                                                    Map<String, dynamic> body =
                                                        jsonDecode(
                                                            response.body);
                                                    switch (
                                                        response.statusCode) {
                                                      case 200:
                                                        {}
                                                        break;
                                                      case 403:
                                                        {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                              title: const Text(
                                                                  'Error'),
                                                              content:
                                                                  Text('403'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child: Text(
                                                                      'OK'),
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
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                              title: const Text(
                                                                  'Error'),
                                                              content: Text(
                                                                  'Server Error'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child: Text(
                                                                      'OK'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }
                                                        break;
                                                    }
                                                    print(
                                                        'L\'e-mail $email a été envoyé');
                                                  }
                                                },
                                                child: Text('Send'),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors
                                                      .black, // couleur de fond du bouton
                                                  onPrimary: Colors
                                                      .white, // couleur du texte du bouton
                                                ),
                                                // Rest of the code
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  'CANCEL',
                                                  style: TextStyle(
                                                      color: Color(0xff951208)),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors
                                                      .white, // couleur de fond du bouton
                                                  onPrimary: Colors
                                                      .white, // couleur du texte du bouton
                                                ),
                                                // Rest of the code
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text(
                              'Forget Password',
                              style: TextStyle(
                                color: Color(0xff951208),
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
                                _usernameController.text,
                                _passwdController.text);
                            Map<String, dynamic> body =
                                jsonDecode(response.body);
                            print(response.statusCode);
                            switch (response.statusCode) {
                              case 200:
                                {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Login Successful'),
                                      content: Text('Welcome ' +
                                          _usernameController.text),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage(),
                                              ),
                                            );
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
                            fixedSize:
                                MaterialStateProperty.all(const Size(300, 50)),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.amber),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                          ),
                          child: const Text(
                            ' LOGIN',
                            style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 29.0,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                        ),

                        Row(
                          //  crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            /* Container(
                            margin: const EdgeInsets.only(top: 80),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TermsConditions(),
                                  ),
                                );
                              },
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
                                  height: 160)),*/
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
