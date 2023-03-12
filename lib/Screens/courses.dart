import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project_coding_game/Games/Entrainement.dart';
import 'package:project_coding_game/Screens/profile.dart';
import 'package:project_coding_game/models/PDFCourse.dart';

class Courses extends StatelessWidget {
  final List<PDFCourse> courses = [
    PDFCourse(
      name: 'Course 1',
      path: 'assets/pdf/cours-python.pdf',
    ),
    PDFCourse(
      name: 'Course 2',
      path: 'assets/pdf/cours-python.pdf',
    ),
    PDFCourse(
      name: 'Course 3',
      path: 'assets/pdf/cours-python.pdf',
    ),
    PDFCourse(
      name: 'Course 4',
      path: 'assets/pdf/cours-python.pdf',
    ),
    PDFCourse(
      name: 'Course 5',
      path: 'assets/pdf/cours-python.pdf',
    ),
    PDFCourse(
      name: 'Course 6',
      path: 'assets/pdf/cours-python.pdf',
    ),
    PDFCourse(
      name: 'Course 7',
      path: 'assets/pdf/cours-python.pdf',
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                          builder: (context) => Entrainement(),
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
          body: GridView.count(
            crossAxisCount: 4,
            padding: EdgeInsets.all(16),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: courses.map((course) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFView(
                        filePath: course.path,
                      ),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.picture_as_pdf,
                        color: Color(0xff951208),
                        size: 30,
                      ),
                      SizedBox(height: 5),
                      Text(
                        course.name,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Inika',
                            color: Color(0xff951208),
                            letterSpacing: 2),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }
}
