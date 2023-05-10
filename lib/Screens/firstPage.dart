import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:gif_view/gif_view.dart';
import 'package:project_coding_game/Games/Entrainement.dart';
import 'package:project_coding_game/Screens/AccueilPage.dart';
import 'package:project_coding_game/Screens/footer.dart';
import 'package:project_coding_game/Screens/home.dart';
import 'package:project_coding_game/Screens/profile.dart';
import 'package:project_coding_game/authentification/sign_in.dart';

import '../authentification/sign_up.dart';

class firstPage extends StatelessWidget {
  const firstPage({super.key});

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
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.black38,
            title: Row(
              children: [
                // ignore: avoid_unnecessary_containers
                Image.asset(
                  'assets/images/logo.png',
                  height: 110,
                  alignment: Alignment.topCenter,
                ),
                Spacer(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shadowColor: MaterialStateProperty.all(Colors.amber),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SignIn();
                        },
                      );
                    },
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Icon(Icons.login, size: 20),
                        SizedBox(width: 10),
                        // ignore: prefer_const_constructors
                        Text(
                          'LOGIN',
                          style:
                              const TextStyle(fontSize: 17, letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shadowColor: MaterialStateProperty.all(Colors.amber),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SIgnUp();
                        },
                      );
                    },
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Icon(Icons.login, size: 20),
                        SizedBox(width: 10),
                        // ignore: prefer_const_constructors
                        Text(
                          'SIGN UP',
                          style:
                              const TextStyle(fontSize: 17, letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    GifView.asset(
                      'assets/images/ninjagif.gif',
                      height: 650,
                      width: 1550,
                      frameRate: 30,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 250, 0, 0),
                        child: Center(
                          child: Text(
                            '"IT\'S A DIFFERENT TYPE OF LEARNING."',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 60.0,
                              letterSpacing: 5,
                              fontWeight: FontWeight.w700,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 350, 0, 0),
                        child: Center(
                          child: Text(
                            'Learn Coding and gain developing skills with a whole new experience.',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 25.0,
                              letterSpacing: 5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: 175,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(650, 450, 0, 0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.amber),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            },
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                SizedBox(width: 5),
                                // ignore: prefer_const_constructors
                                Text(
                                  'GET STARTED',
                                  style: const TextStyle(
                                      fontSize: 17,
                                      letterSpacing: 1,
                                      color: Colors.black,
                                      fontFamily: 'Inika',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: 175,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(690, 580, 0, 0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {},
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 60,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 5),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 0.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.flag_sharp, size: 60, color: Color(0xff250402)),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
                      child: Text(
                        '\n The First AI Generated Coding Game in Tunisia!',
                        style: TextStyle(
                            fontFamily: 'Inika',
                            fontSize: 50.0,
                            letterSpacing: 3,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                    Icon(Icons.flag_sharp, size: 60, color: Color(0xff951208)),
                  ],
                ),
                const SizedBox(height: 0.5),
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/prog2.jpg',
                      height: 650,
                      width: 1550,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(1),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 121, 34, 30),
                      // Set border color
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Set rounded corner radius
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(1, 3))
                      ] // Make rounded corner of border
                      ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: const Text(
                    '▫️ Support Languages ▫️',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 30.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/c++.png',
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      child: Image.asset(
                        'assets/images/javaScript.png',
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      child: Image.asset(
                        'assets/images/swift.png',
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      child: Image.asset(
                        'assets/images/c#.png',
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      child: Image.asset(
                        'assets/images/dart.png',
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      child: Image.asset(
                        'assets/images/python.png',
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      child: Image.asset(
                        'assets/images/java.png',
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      child: Image.asset(
                        'assets/images/html.png',
                        height: 80,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(1),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 121, 34, 30),
                      // Set border color
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Set rounded corner radius
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(1, 3))
                      ] // Make rounded corner of border
                      ),
                ),
                const SizedBox(height: 50),
                Stack(
                  children: [
                    GifView.asset(
                      'assets/images/giphy.gif',
                      height: 550,
                      width: 1550,
                      frameRate: 30,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Text(
                            '\n Learn Coding in a FUN way!',
                            style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 50.0,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/mayssa.png',
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Container(
                        child: Text(
                          '\n "What we think we become"',
                          style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        child: Text(
                          ' By Mayssa Mejri.',
                          style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 10.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/ninja3.jpg',
                      height: 650,
                      width: 1550,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(700, 0, 0, 0),
                          child: Text(
                            '\n\n GAMIFIED LEARNING',
                            style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 50.0,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w900,
                                color: Colors.amber),
                          )),
                    ),
                    Positioned(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(700, 150, 0, 0),
                          child: Text(
                            '\n ▫️Great documentation.\n'
                            ' Learn new coding languages\n!'
                            '\n ▫️Enjoy learning. \n'
                            ' By using our website you will enjoy gaining new experiences.',
                            style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 29.0,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w800,
                                color: Colors.amber),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/aziza.png',
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Container(
                        child: Text(
                          '\n "Knowledge is power"',
                          style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        child: Text(
                          ' By Aziza Taboubi.',
                          style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 10.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/ninja2.jpg',
                      height: 800,
                      width: 1750,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                          child: Text(
                            '\n\n GAIN KNOWLEDGE'
                            '\n\n STRENGTHEN YOUR CODING GAME'
                            '\n\n INVITE YOUR FRIENDS'
                            '\n\n PLAY!',
                            style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 50.0,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/amor.png',
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Container(
                        child: Text(
                          '\n "Make it work, make it right, make it last."',
                          style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        child: Text(
                          ' By Med Dhia Ben Amar.',
                          style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 10.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/prog.jpg',
                      height: 650,
                      width: 1550,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/bousslimi.png',
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Container(
                        child: Text(
                          '\n "Don\'t comment bad code - rewrite it."',
                          style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        child: Text(
                          ' By Dhiaeddin Bousslimi.',
                          style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 10.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Stack(
                  children: [
                    GifView.asset(
                      'assets/images/ninja4.gif',
                      height: 650,
                      width: 1550,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(450, 0, 0, 0),
                          child: Text(
                            '\n\n ▫️ GAMIFIED LEARNING ▫️ \n',
                            style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 50.0,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w900,
                                color: Colors.amber),
                          )),
                    ),
                    Positioned(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(350, 150, 0, 0),
                          child: Text(
                            '\n\n ▫️ Challenge yourself; By playing against AI.\n'
                            ' ▫️ Challenge others; By playing against your friends.\n',
                            style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 29.0,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w800,
                                color: Colors.amber),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/mehdi.png',
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Container(
                        child: Text(
                          '\n "Talk is cheap, show me the code."',
                          style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        child: Text(
                          ' By Med Mehdi Ghezal.',
                          style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 10.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Stack(
                  children: [
                    GifView.asset(
                      'assets/images/penguin.gif',
                      height: 650,
                      width: 1550,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Footer(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  height: 400.0,
                                  width: 500.0,
                                  child: Center(
                                    child: Card(
                                      color: Colors.black,
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // half of height and width of Image
                                      ),
                                      child: Image.asset(
                                        'assets/images/logo.png',
                                        height: 300,
                                        width: 500,
                                        alignment: Alignment.topLeft,
                                      ),
                                    ),
                                  )),
                              // ignore: sized_box_for_whitespace
                              Container(
                                  height: 200.0,
                                  width: 200.0,
                                  margin: EdgeInsets.fromLTRB(10, 40, 50, 10), 
                                  child: Center(
                                      child: ListView(children: <Widget>[
                                    // ignore: avoid_unnecessary_containers
                                    Center(
                                      child: Container(
                                        child: const Text(
                                          'FOR INFORMATION',
                                         style: TextStyle(
                                            fontFamily: 'Inika',
                                            fontSize: 16,
                                            color: Colors.amber,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child:  TextButton(
                                       onPressed: (){}, 
                                       child: Text(
                                        'About Us',
                                        style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),)
                                    
                                    ),
                                    Container(
                                      child: TextButton(
                                        onPressed: (){},
                                        child: Text(
                                        'Terms and Conditions',
                                         style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),) 
                                    ),
                                    Container(
                                      child: TextButton(
                                        onPressed: () {
                                        
                                      },
                                      child: Text(
                                        'Rules',
                                         style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),)
                                       
                                    ),
                                    Container(
                                      child: TextButton(onPressed: () {
                                        
                                      },
                                      child: Text(
                                        'Contact Us',
                                        style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),) 
                                    ),
                                    Container(
                                      child: TextButton(onPressed: () {
                                        
                                      },
                                      child: Text(
                                        'FAQ',
                                        style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),) 
                                    ),
                                  ]))),
                                   Container(
                                  height: 200.0,
                                  width: 200.0,
                                  margin: EdgeInsets.fromLTRB(10, 40, 50, 10), 
                                  child: Center(
                                      child: ListView(children: <Widget>[
                                    // ignore: avoid_unnecessary_containers
                                    Center(
                                      child: Container(
                                        child: const Text(
                                          'LEARNING',
                                         style: TextStyle(
                                            fontFamily: 'Inika',
                                            fontSize: 16,
                                            color: Colors.amber,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: TextButton(onPressed: () {
                                        
                                      },
                                      child:Text(
                                        'Courses',
                                        style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ), ) 
                                    ),
                                    Container(
                                      child: TextButton(onPressed: () {
                                        
                                      },
                                      child: Text(
                                        'Games',
                                         style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ), )
                                    ),
                                    Container(
                                      child: TextButton(onPressed: () {
                                        
                                      },
                                      child: Text(
                                        'Quizes',
                                         style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),) 
                                    ),
                                    Container(
                                      child: TextButton(onPressed: () {
                                        
                                      },
                                      child: Text(
                                        'Coding Challenges',
                                        style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),) 
                                    ),
                                    Container(
                                      child: TextButton(onPressed: () {
                                        
                                      },
                                      child:  Text(
                                        'Multiplayer',
                                        style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),)
                                    ),
                                     Container(
                                      child: TextButton(onPressed: () {
                                        
                                      },
                                      child: Text(
                                        'More..',
                                        style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),) 
                                    ),
                                  ]))),
                                   Container(
                                  height: 200.0,
                                  width: 200.0,
                                  margin: EdgeInsets.fromLTRB(10, 40, 50, 10), 
                                  child: Center(
                                      child: ListView(children: <Widget>[
                                    // ignore: avoid_unnecessary_containers
                                    Center(
                                      child: Container(
                                        child: const Text(
                                          'FOR EMPLOYEES',
                                         style: TextStyle(
                                            fontFamily: 'Inika',
                                            fontSize: 16,
                                            color: Colors.amber,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: TextButton(onPressed: () {
                                        
                                      },
                                      child: Text(
                                        'Hiring',
                                        style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),) 
                                    ),
                                    Container(
                                      child: TextButton(onPressed:(){} ,
                                      child: Text(
                                        'Tests',
                                         style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),) 
                                    ),
                                    Container(
                                      child: TextButton(onPressed: () {
                                        
                                      },
                                      child: Text(
                                        'Interviewing',
                                         style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),) 
                                    ),
                                  
                                  ]))),
                              Container(
                                  height: 45.0,
                                  width: 45.0,
                                  child: Center(
                                    child: Card(
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            25.0), // half of height and width of Image
                                      ),
                                      child: IconButton(
                                        // ignore: prefer_const_constructors
                                        icon: Icon(
                                          Icons.mail,
                                          size: 20.0,
                                        ),
                                        color: Colors.black,
                                        onPressed: () {},
                                      ),
                                    ),
                                  )),
                              Container(
                                  height: 45.0,
                                  width: 45.0,
                                  child: Center(
                                    child: Card(
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            25.0), // half of height and width of Image
                                      ),
                                      child: IconButton(
                                        icon: new Icon(
                                          Icons.facebook,
                                          size: 20.0,
                                        ),
                                        color: Colors.black,
                                        onPressed: () {},
                                      ),
                                    ),
                                  )),
                                    Container(
                                  height: 45.0,
                                  width: 45.0,
                                  child: Center(
                                    child: Card(
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            25.0), // half of height and width of Image
                                      ),
                                      child: IconButton(
                                        icon: new Icon(
                                          Icons.location_city,
                                          size: 20.0,
                                        ),
                                        color: Colors.black,
                                        onPressed: () {},
                                      ),
                                    ),
                                  )),
                              Container(
                                  height: 45.0,
                                  width: 45.0,
                                  child: Center(
                                    child: Card(
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            25.0), // half of height and width of Image
                                      ),
                                      child: IconButton(
                                        icon: new Icon(
                                          Icons.call,
                                          size: 20.0,
                                        ),
                                        color: Colors.black,
                                        onPressed: () {},
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Center(
                          child: Text(
                            'Copyright ©2023, All Rights Reserved.',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0,
                                color: Colors.white),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Powered by Error By Night',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0,
                                color: Colors.white),
                          ),
                        ),
                      ]),
                )
              ],
            ),
          )),
    );
  }
}
