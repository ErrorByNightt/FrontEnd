import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project_coding_game/Components/BlogCard.dart';
import 'package:project_coding_game/Games/game_home.dart';
import 'package:project_coding_game/NetworkHandler.dart';
import 'package:project_coding_game/Screens/Blog.dart';
import 'package:project_coding_game/Components/Url.dart';
import 'package:project_coding_game/Screens/Blog/Blogs.dart';
import 'package:project_coding_game/Screens/courses.dart';
import 'package:project_coding_game/Screens/profile.dart';
import 'package:http/http.dart' as http;
import 'package:project_coding_game/models/BlogModel.dart';
import 'package:project_coding_game/models/SuperModel.dart';
import 'package:project_coding_game/models/addBlogModel.dart';
import 'package:logger/logger.dart';

import '../../Components/GridCellBlog.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  List<AddBlogModel> blogs = [];
  SuperModel superModel = SuperModel(data: []);

  var log = Logger();

  /*Future getBlogs() async {
    final url = await http.get(Uri.parse('http://localhost:5000/blog/getALL'));

    if (url.statusCode == 200 || url.statusCode == 201) {
      final response = await http.get(Uri.parse(url as String));

      var responseData = json.decode(response.body);
      List<AddBlogModel> blogs = [];
      for (var singleBlog in responseData) {
        AddBlogModel blog = AddBlogModel(
            coverImage: singleBlog['coverImage'],
            count: singleBlog['like'],
            share: singleBlog['share'],
            comment: singleBlog['comment'],
            id: singleBlog['_id'],
            title: singleBlog['title'],
            body: singleBlog['body'],
            username: '');

        //Adding user to the list.
        blogs.add(blog);
      }
      // print('blogs');
      return blogs;
    }
  }
*/
  Future<List<AddBlogModel>> getBlogs() async {
    final response =
        await http.get(Uri.parse('http://localhost:5000/blog/getALL'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List;
      return jsonData.map((blog) => AddBlogModel.fromJson(blog)).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }

  // SuperModel superModel = SuperModel(data: []);
  // NetworkHandler networkHandler = NetworkHandler();

/*  Future<List<AddBlogModel>> getRequest() async {
    //replace your restFull API here.
    String url = "http://localhost/blog/getALL";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<AddBlogModel> blogs = [];
    for (var singleBlog in responseData) {
      AddBlogModel blog = AddBlogModel(
          coverImage: singleBlog['coverImage'],
          count: singleBlog['like'],
          share: singleBlog['share'],
          comment: singleBlog['comment'],
          id: singleBlog['_id'],
          title: singleBlog['title'],
          body: singleBlog['body'],
          username: '');

      //Adding user to the list.
      blogs.add(blog);
    }
    // print('blogs');
    return blogs;
  }
*/
  /*Future<List<AddBlogModel>> getRequest() async {
    var data = await http.get("http://localhost/blog/getALL" as Uri);
    var jsonData = json.decode(data.body) as List;
    List<AddBlogModel> blogs = [];
    // convert the json to a list of companies
    blogs = jsonData
        .map((company) => AddBlogModel.fromJson(company))
        .toList(); // new line
    print(blogs.length);
    return blogs;
  }*/

  @override
  void initState() {
    super.initState();
    blogs;
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
                          'Classement',
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
                          builder: (context) => courses(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/Inspiration is everywhere.png',
                            width: 400.0,
                            height: 250.0,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: const Text(
                            'You’re ready to ask a programming-related question and this form \n will help guide you through the process.\n'
                            'Looking to ask a non-programming question?',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Blog()),
                            );
                          },
                          style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(const Size(200, 50)),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromARGB(255, 239, 150, 150)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Ask a Question',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 3),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: Image.asset(
                        'assets/images/Post-pana.png',
                        width: 500.0,
                        height: 500.0,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: const Text(
                    ' Latest Blog  💭',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 50.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                /*Container(
                  padding: EdgeInsets.all(16.0),
                  child: FutureBuilder(
                    future: getBlogs(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        final userList = snapshot.data!;
                        return ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(userList[index].title),
                              //subtitle: Text(userList[index].email),
                            );
                          },
                        );
                      }
                    },
                  ),
                  /* FutureBuilder(
                      future: getRequest(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Text(
                                    ' $index title: ${snapshot.data[index].title}');
                              });
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )*/
                ),*/

                // Blogs(url: "/getALL")
                /* blogs.length > 0
                    //? Column(
                        children: blogs
                            .map((item) => BlogCard(
                                addBlogModel: item,
                                networkHandler: networkHandler))
                            .toList(),
                      )
                    : const Center(
                        child: Text("We don't have any Blog Yet"),
                      )*/
              ],
            ),
          ),
        ));
  }
}
