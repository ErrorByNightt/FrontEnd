import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project_coding_game/Components/Custom_button.dart';
import 'package:project_coding_game/Components/Url.dart';
import 'package:project_coding_game/Components/cell.dart';
import 'package:project_coding_game/Games/game_home.dart';
import 'package:project_coding_game/Screens/courses.dart';
import 'package:project_coding_game/Screens/profile.dart';
import 'package:http/http.dart' as http;

import 'package:project_coding_game/Screens/rooms/create_room.dart';
import 'package:project_coding_game/Screens/rooms/join_room.dart';
import 'package:project_coding_game/models/BlogModel.dart';
import 'package:project_coding_game/models/addBlogModel.dart';
import 'package:project_coding_game/responsive/responsive.dart';
import 'package:logger/logger.dart';

class BlogHome extends StatefulWidget {
  static String routeName = '/BlogHome';
  const BlogHome({super.key});

  @override
  State<BlogHome> createState() => _BlogHomeState();
}

class _BlogHomeState extends State<BlogHome> {
  Future<List<AddBlogModel>> fetchData() async {
    final response =
        await http.get(Uri.parse('http://localhost:5000/blog/getALL'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => AddBlogModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  //var
  /*List<Blogg> games = [];

  late Future<bool> getb;

  //actions
  // String url = "http://192.168.1.17:5000";
  var log = Logger();
  Future<bool> getBlog() async {
    // url = formater(url);
    String url = "http://10.0.2.2:5000";

    final response = await http.get(
      Uri.http(url, '/blog/getALL'),
      headers: {
       
        'Content-Type': 'application/json''
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);

      return json.decode(response.body);
    }
    log.i(response.body);
    log.i(response.statusCode);
    return true;
  }
*/
  /* Future<bool> getGames() async {
    //url
    Uri fetchUri = Uri.parse("$BASE_URL/blog/getALL");
    //Headers
    Map<String, String> headers = {"Content-Type": "application/json"};
    //request
    await http.get(fetchUri, headers: headers).then((response) {
      if (response.statusCode == 200) {
        List<dynamic> jsonArray = json.decode(response.body);
        for (var item in jsonArray) {
          games.add(Blogg(
              item['_id'],
              item['coverImage'],
              item['count'],
              item['share'],
              item['comment'],
              item['title'],
              item['body'],
              item['username']));
        }
      }
    }).onError((error, stackTrace) {
      print("Internal error : ${error.toString()}");
    });
    return true;
  }*/

  //states
  /* @override
  void initState() {
    super.initState();
    getb = getBlog();
  }*/

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
                    onPressed: () {},
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
                    onPressed: () {},
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Icon(Feather.award, size: 20),
                        SizedBox(width: 5),
                        // ignore: prefer_const_constructors
                        Text(
                          'BlogHome',
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
                      //!  Navigator.push(
                      //!    context,
                      //!    MaterialPageRoute(
                      //!    builder: (context) => SIgnUp(),
                      //!   ),
                      //! );
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
                          builder: (context) => Courses(),
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
                                      builder: (context) => ProfilePage()),
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
                                      builder: (context) => ProfilePage()),
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
                                      builder: (context) => ProfilePage()),
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
                                      builder: (context) => ProfilePage()),
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
          body: Column(
            children: [
              Container(
                child: Text(
                  '🏅LATEST BLOG 🏅',
                  style: TextStyle(
                    fontFamily: 'Inika',
                    fontSize: 50.0,
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              FutureBuilder<List<AddBlogModel>>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final item = data[index];
                        return ListTile(
                          title: Text(item.title),
                          // subtitle: Text('Age: ${item.age}'),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ));
  }
}
