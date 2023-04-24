import 'dart:convert';

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project_coding_game/Screens/javacourse.dart';
import 'package:project_coding_game/Screens/kotlincourse.dart';
import 'package:project_coding_game/Screens/profile.dart';
import 'package:project_coding_game/Screens/sidemenu.dart';
import 'package:project_coding_game/Screens/swiftcourse.dart';

import '../Games/Entrainement.dart';
import '../models/SearchBar.dart';
import 'Classement.dart';
import 'home.dart';
import 'package:http/http.dart' as http;

import 'level-page.dart';

class courses extends StatefulWidget {
  final String? userId;
  final Map<String, dynamic>? userData;
  const courses({
    Key? key,
    required this.userId,
    this.userData,
  })  : assert(userId != null, 'userId must not be null'), super(key: key);

  @override
  State<courses> createState() => _coursesState();
}

class _coursesState extends State<courses> {

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
                      MaterialStateProperty.all(Colors.transparent) ,
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
                          style: const TextStyle(fontSize: 12, letterSpacing: 1),
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
                          style: const TextStyle(fontSize: 12, letterSpacing: 1),
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
                          style: const TextStyle(fontSize: 12, letterSpacing: 1),
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
                          style: const TextStyle(fontSize: 12, letterSpacing: 1),
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
                          builder: (context) => Entrainement(),
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
                          style: const TextStyle(fontSize: 12, letterSpacing: 1),
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
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            'assets/images/avatar.png',
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Dhia Bouslimi',
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage(userId: '6435dfa7b98f0ee65b3f870d',)),
                                );
                              },
                              child: Text('Profil',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage(userId: '6435dfa7b98f0ee65b3f870d',)),
                                );
                              },
                              child: Text('Amis',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage(userId: '6435dfa7b98f0ee65b3f870d',)),
                                );
                              },
                              child: Text('Paramètres',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage(userId: '6435dfa7b98f0ee65b3f870d',)),
                                );
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
            child: Column(
                children: [
                  Center(
                    child: Text(
                      '\n Courses  ',
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
                    'Trying to learn a new coding Language? Search for it in our documentation section.  \n  ',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Inika',
                      letterSpacing: 2,
                      color: Colors.amber,
                    ),
                  ),
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
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              width: 350,
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
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://blog.dyma.fr/content/images/2022/02/python1200x628.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                                child:  TextButton(
                                    onPressed: (() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => side(title: 'python')),
                                      );
                                    }),
                                    child: const Text(
                                      'Python',
                                      style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 25.0,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ))
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              width: 350,
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
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUHrOwyRvPEzqFVAhZQZ5sSqbGYI8lrAtawE2fJHDwIVm8LM9KEGXChiZNFT3q0T8KV6Y&usqp=CAU'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                                child:  TextButton(
                                    onPressed: (() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => side(title: 'python')),
                                      );
                                    }),
                                    child: const Text(
                                      'Java Script',
                                      style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 25.0,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ))
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              width: 350,
                              height: 200,
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
                                      'https://miro.medium.com/v2/resize:fit:828/format:webp/1*OgeU8HPo8TFF1cZQ-4XjJw.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                                child:  TextButton(
                                    onPressed: (() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => swift(title: 'swift')),
                                      );
                                    }),
                                    child: const Text(
                                      'Swift',
                                      style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 25.0,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ))
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              width: 350,
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
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTlGDOUySS72sF0kMpKlNc9dZQPkR2Fik71cHBNHsLvEKnWJd-qcqqlzSlbTTXH1d27T8&usqp=CAU'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                                child:  TextButton(
                                    onPressed: (() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => java(title: 'java')),
                                      );
                                    }),
                                    child: const Text(
                                      'Java',
                                      style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 25.0,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ))
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              width: 350,
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
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'data:image/png;base64,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'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                                child:  TextButton(
                                    onPressed: (() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => side(title: 'python')),
                                      );
                                    }),
                                    child: const Text(
                                      'php',
                                      style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 25.0,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ))
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              width: 350,
                              height: 200,
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
                                      'https://i.redd.it/31b2ii8hchi31.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                                child:  TextButton(
                                    onPressed: (() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => side(title: 'python')),
                                      );
                                    }),
                                    child: const Text(
                                      'C++',
                                      style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 25.0,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ))
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              width: 350,
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
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'data:image/png;base64,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'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                                child:  TextButton(
                                    onPressed: (() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => side(title: 'python')),
                                      );
                                    }),
                                    child: const Text(
                                      'C#',
                                      style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 25.0,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ))
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              width: 350,
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
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'data:image/jpeg;base64,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'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                                child:  TextButton(
                                    onPressed: (() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => kotlin(title: 'kotlin')),
                                      );
                                    }),
                                    child: const Text(
                                      'Kotlin',
                                      style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 25.0,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ))
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              width: 350,
                              height: 200,
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
                                      'https://cdn4.iconfinder.com/data/icons/logos-3/454/nodejs-new-pantone-white-512.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                                child:  TextButton(
                                    onPressed: (() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => side(title: 'python')),
                                      );
                                    }),
                                    child: const Text(
                                      'Node JS',
                                      style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 25.0,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ))
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
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

                ]),
          ),
        ));
  }
}