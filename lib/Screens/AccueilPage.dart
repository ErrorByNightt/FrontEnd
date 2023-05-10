import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../authentification/sign_in.dart';
import 'Classement.dart';
import 'ListeUsers.dart';
import 'admin2.dart';
import 'courses.dart';
import 'level-page.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  double x = 0;
  double y = 0;
  double amplitude = 0.3;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff951208), Color(0xff250402)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Column(
          children: [

            Row(
              children: <Widget>[
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

                    },
                    child: const Text(
                      'Home',
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn(),
                      ),
                      );
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(fontSize: 10, letterSpacing: 1),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 150),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCard(),
                    _buildCard2(),
                    _buildCard3(),
                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }

  Widget _buildCard() {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()..rotateX(x)..rotateY(y),
      child: GestureDetector(
        onTap: () {
          // Ajouter l'action ici
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserListPage()));
        },
        onPanUpdate: (details) {
          if (y - details.delta.dx < 0) {
            setState(() {
              y = max(y - details.delta.dx / 100, -amplitude);
            });
          } else {
            setState(() {
              y = max(y - details.delta.dx / 100, amplitude);
            });
          }

          if (x - details.delta.dy < 0) {
            setState(() {
              x = min(x - details.delta.dy / 100, amplitude);
            });
          } else {
            setState(() {
              x = min(y - details.delta.dy / 100, -amplitude);
            });
          }
        },
        child: Container(
          width: 250,
          height: 230,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/images/USER.png"),
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 6,
                offset: Offset(x, y + 4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard2() {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()..rotateX(x)..rotateY(y),
      child: GestureDetector(
        onTap: () {
          // Ajouter l'action ici
          Navigator.push(context, MaterialPageRoute(builder: (context) => UrlExecutor2()));
        },
        onPanUpdate: (details) {
          if (y - details.delta.dx < 0) {
            setState(() {
              y = max(y - details.delta.dx / 100, -amplitude);
            });
          } else {
            setState(() {
              y = max(y - details.delta.dx / 100, amplitude);
            });
          }

          if (x - details.delta.dy < 0) {
            setState(() {
              x = min(x - details.delta.dy / 100, amplitude);
            });
          } else {
            setState(() {
              x = min(y - details.delta.dy / 100, -amplitude);
            });
          }
        },
        child: Container(
          width: 250,
          height: 230,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/images/QUIZ.png"),
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 6,
                offset: Offset(x, y + 4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard3() {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()..rotateX(x)..rotateY(y),
      child: GestureDetector(
        onPanUpdate: (details) {
          if (y - details.delta.dx < 0) {
            setState(() {
              y = max(y - details.delta.dx / 100, -amplitude);
            });
          } else {
            setState(() {
              y = max(y - details.delta.dx / 100, amplitude);
            });
          }

          if (x - details.delta.dy < 0) {
            setState(() {
              x = min(x - details.delta.dy / 100, amplitude);
            });
          } else {
            setState(() {
              x = min(y - details.delta.dy / 100, -amplitude);
            });
          }
        },
        child: Container(
          width: 250,
          height: 230,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/images/tlchargement-removebg-preview-2-3-nPX.png"),
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 6,
                offset: Offset(x, y + 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}