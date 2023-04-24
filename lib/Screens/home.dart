// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project_coding_game/Courses/pdf.dart';
import 'package:project_coding_game/Games/Entrainement.dart';
import 'package:project_coding_game/Games/game_home.dart';
import 'package:project_coding_game/Screens/AI.dart';
import 'package:project_coding_game/Screens/AccueilPage.dart';
import 'package:project_coding_game/Screens/Classement.dart';
import 'package:project_coding_game/Screens/courses.dart';
import 'package:project_coding_game/Screens/footer.dart';
import 'package:project_coding_game/Screens/profile.dart';
import 'package:project_coding_game/Screens/reader_screen.dart';
import 'package:project_coding_game/models/SearchBar.dart';
import '../models/document_model.dart';
import 'chalenge-page.dart';
import 'level-page.dart';

class HomePage extends StatefulWidget {
  final String? userId;
  final Map<String, dynamic>? userData;
  const HomePage({
    Key? key,
    required this.userId,
    this.userData,
  })  : assert(userId != null, 'userId must not be null'), super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map<String, dynamic> _userData = {};

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    final userId = widget.userId;

    final response = await http.get(Uri.parse('http://localhost:9095/user/$userId'));
    final responseData = json.decode(response.body);

    if (responseData['user'] == null) {
      return;
    }

    setState(() {
      _userData = responseData['user'];
    });
  }



  @override
  Widget build(BuildContext context) {
    if (_userData['_id'] != null) {
      return Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
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
              children: [
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
                          builder: (context) =>  HomePage(userId: _userData['_id'], userData: {},),
                        ),
                      );
                    },
                    // ignore: prefer_const_constructors
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Icon(Feather.home, size: 20),
                        SizedBox(width: 5),
                        // ignore: prefer_const_constructors
                        Text(
                          'Home',
                          style: const TextStyle(
                              fontSize: 12, letterSpacing: 1),
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
                      shadowColor: MaterialStateProperty.all(
                          Color.fromARGB(19, 207, 123, 123)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  classement(userId: _userData['_id'], userData: {},),
                        ),
                      );
                    },
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Icon(Feather.award, size: 20),
                        SizedBox(width: 5),
                        // ignore: prefer_const_constructors
                        Text(
                          'Classement',
                          style: const TextStyle(
                              fontSize: 12, letterSpacing: 1),
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
                      shadowColor: MaterialStateProperty.all(
                          Color.fromARGB(19, 238, 155, 155)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Level(userId: _userData['_id'], userData: {},),
                        ),
                      );
                    },
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Icon(Feather.layers, size: 20),
                        SizedBox(width: 5),
                        // ignore: prefer_const_constructors
                        Text(
                          'Levels',
                          style: const TextStyle(
                              fontSize: 12, letterSpacing: 1),
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
                      shadowColor: MaterialStateProperty.all(
                          Color.fromARGB(19, 238, 155, 155)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => courses(userId: _userData['_id'], userData: {},),
                        ),
                      );
                    },
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Icon(Icons.my_library_books_outlined, size: 20),
                        SizedBox(width: 5),
                        // ignore: prefer_const_constructors
                        Text(
                          'Documentation',
                          style: const TextStyle(
                              fontSize: 12, letterSpacing: 1),
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
                      shadowColor: MaterialStateProperty.all(
                          Color.fromARGB(19, 238, 155, 155)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameHome(),
                        ),
                      );
                    },
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Icon(Feather.youtube, size: 20),
                        SizedBox(width: 5),
                        // ignore: prefer_const_constructors
                        Text(
                          'Entrainement',
                          style: const TextStyle(
                              fontSize: 12, letterSpacing: 1),
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
                      shadowColor: MaterialStateProperty.all(
                          Color.fromARGB(19, 207, 123, 123)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scene(userId: _userData['_id'], userData: {},),
                        ),
                      );
                    },
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Icon(Feather.award, size: 20),
                        SizedBox(width: 5),
                        // ignore: prefer_const_constructors
                        Text(
                          'Challenge',
                          style: const TextStyle(
                              fontSize: 12, letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(_userData['image']),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _userData['userName'],
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 143, 139, 139)),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          child: const Icon(
                            Icons.arrow_drop_down,
                            size: 20,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    onHover: (PointerEvent details) {
                      showMenu(
                        context: context,
                        position:
                        const RelativeRect.fromLTRB(70.0, 70.0, 10.0, 0.0),
                        color: Color.fromARGB(115, 133, 112, 112),
                        items: <PopupMenuEntry>[
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                if (_userData['_id'] != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProfilePage(
                                                userId: _userData['_id'])),
                                  );
                                }
                              },

                              child: Text('Profil',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Text('Amis',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),

                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Text('Paramètres',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Text('Déconnexion',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      );
                    },
                    onExit: (PointerEvent details) {
                      // Ne rien faire
                    },
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 400, right: 400),
                child: Flexible(
                  flex: 1,
                  child: TextField(
                    cursorColor: Color.fromARGB(255, 255, 255, 255),
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(163, 252, 246, 246),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none),
                        hintText: 'Search Something..',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 8, 8, 8),
                            fontSize: 15,
                            letterSpacing: 2),
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          // ignore: prefer_const_constructors, sort_child_properties_last
                          child: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 15,
                          ),
                          width: 18,
                        )),
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: MySearchDelegate(),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/images/Group 9106.png',
                  height: 200,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
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
                child: const Text(
                  '▫️ Courses ▫️',
                  style: TextStyle(
                    fontFamily: 'Inika',
                    fontSize: 30.0,
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PdfBook()));
                      }),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        width: 250,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(99, 64, 195, 255),
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Color.fromARGB(66, 222, 211, 211)
                            ],
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://blog.dyma.fr/content/images/2022/02/python1200x628.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: 250,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(99, 64, 195, 255),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Color.fromARGB(66, 222, 211, 211)
                          ],
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUHrOwyRvPEzqFVAhZQZ5sSqbGYI8lrAtawE2fJHDwIVm8LM9KEGXChiZNFT3q0T8KV6Y&usqp=CAU'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: 250,
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(99, 64, 195, 255),
                        borderRadius: BorderRadius.circular(20),
                        // ignore: prefer_const_constructors
                        gradient: LinearGradient(
                          // ignore: prefer_const_literals_to_create_immutables
                          colors: [
                            Colors.white,
                            Color.fromARGB(66, 222, 211, 211)
                          ],
                        ),

                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDfS08paYD_Vp3jULBoIe4a3uRMGNRcGRnL0uz1HgGQZEXtmpxsntZZ4w7jnogz1uVC1M&usqp=CAU'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Container(
                child: const Text(
                  'What can I use CodeNinja for?',
                  style: TextStyle(
                    fontFamily: 'Inika',
                    fontSize: 50.0,
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                child: const Text(
                  'From beginner to expert and beyond...',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 172, 165, 165),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  // ignore: avoid_unnecessary_containers
                  Column(
                    children: [
                      Container(
                        child: Center(
                          child: const Text(
                            '🥷 CHALLENGE 🥷',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 28.0,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 14, 174, 60),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(50),
                        child: const Text(
                          'Challenge your friends, colleagues or AI to \n'
                              'programming games and show them who"s boss! 🥇',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 172, 165, 165),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Center(
                          child: const Text(
                            '🥷 RANK 🥷',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 28.0,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 14, 174, 60),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(30),
                        child: const Text(
                          'Reach the top of the rankings \n'
                              'Improve your level in different languages. 🥇',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 172, 165, 165),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Center(
                          child: const Text(
                            '🥷 LEARNING 🥷',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 28.0,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 14, 174, 60),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(30),
                        child: const Text(
                          ' Challenge yourself in a language you are comfortable \n'
                              ' with and then in a language you want to improve..🥇\n',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 172, 165, 165),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
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
                child: const Text(
                  '▫️ Support Language ▫️',
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
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
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
                child: const Text(
                  '▫️ Our Team ▫️',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(99, 64, 195, 255),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Color.fromARGB(66, 222, 211, 211)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(99, 64, 195, 255),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Color.fromARGB(66, 222, 211, 211)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(99, 64, 195, 255),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Color.fromARGB(66, 222, 211, 211)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(99, 64, 195, 255),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Color.fromARGB(66, 222, 211, 211)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(99, 64, 195, 255),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Color.fromARGB(66, 222, 211, 211)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
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
                child: const Text(
                  '▫️ Artificial Intelligence ▫️',
                  style: TextStyle(
                    fontFamily: 'Inika',
                    fontSize: 30.0,
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/roobot.png'),
                      Spacer(
                        flex: 2,
                      ),
                      SizedBox(height: 60),
                      Column(
                        children: <Widget>[
                          Container(
                              width: 550,
                              child: const Text(
                                'What is Artificial Intelligence? \n'
                                    '\n Artificial intelligence (AI), the ability of a digital computer or computer-controlled robot to perform tasks commonly associated with intelligent beings. \n The term is frequently applied to the project of developing systems endowed with the intellectual processes characteristic of humans, such as the ability to reason, discover meaning, generalize, or learn from past experience.',
                                style: TextStyle(
                                    fontFamily: 'Inika',
                                    fontSize: 15.0,
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              )),
                          TextButton(
                              onPressed: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AI()),
                                );
                              }),
                              child: const Text(
                                'Explore Now',
                                style: TextStyle(
                                    fontFamily: 'Inika',
                                    fontSize: 25.0,
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: Color.fromRGBO(
                                        149, 197, 244, 1),
                                    color: Colors.black),
                              ))
                        ],
                      )
                    ])
              ]),
            ]),
          ),
        ),
      );
    }
    else {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        ),
      );
    }
  }
}