import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project_coding_game/Components/Custom_button.dart';
import 'package:project_coding_game/Games/game_home.dart';
import 'package:project_coding_game/Screens/courses.dart';
import 'package:project_coding_game/Screens/level-page.dart';
import 'package:project_coding_game/Screens/profile.dart';
import 'package:project_coding_game/Screens/rooms/create_room.dart';
import 'package:project_coding_game/Screens/rooms/join_room.dart';
import 'package:project_coding_game/responsive/responsive.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class classement extends StatefulWidget {

  final String? userId;
  final Map<String, dynamic>? userData;
  const classement({
    Key? key,
    required this.userId,
    this.userData,
  })  : assert(userId != null, 'userId must not be null'), super(key: key);

  static String routeName = '/classement';


  @override
  State<classement> createState() => _classementState();
}

class _classementState extends State<classement> {

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

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoom.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoom.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
                          style:
                              const TextStyle(fontSize: 12, letterSpacing: 1),
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
                          'classement',
                          style:
                              const TextStyle(fontSize: 12, letterSpacing: 1),
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
                          builder: (context) =>  Level(userId: _userData['_id'], userData: {},),
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
                          style:
                              const TextStyle(fontSize: 12, letterSpacing: 1),
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
                          style:
                              const TextStyle(fontSize: 12, letterSpacing: 1),
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
                          style:
                              const TextStyle(fontSize: 12, letterSpacing: 1),
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
                                      builder: (context) => ProfilePage(userId: '6435dfa7b98f0ee65b3f870d')),
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
                                      builder: (context) => ProfilePage(userId: '6435dfa7b98f0ee65b3f870d')),
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
                                      builder: (context) => ProfilePage(userId: '6435dfa7b98f0ee65b3f870d')),
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
                                      builder: (context) => ProfilePage(userId: '6435dfa7b98f0ee65b3f870d')),
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
                child: Container(
                  margin: EdgeInsets.all(10),
                  //width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height,
                  child: Text(
                    '🏅 CLASSEMENT 🏅',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 50.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Responsive(
                      child: Container(
                          child: CustomButton(
                              onTap: () => createRoom(context),
                              text: 'Create Room'))),
                  const SizedBox(width: 10),
                  Responsive(
                      child: Container(
                          child: CustomButton(
                              onTap: () => joinRoom(context),
                              text: 'Join Room'))),
                ],
              ),
            ],
          )),
        ));
  }
}
