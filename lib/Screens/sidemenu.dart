import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project_coding_game/Screens/profile.dart';

import '../Games/Entrainement.dart';

class side extends StatefulWidget {
  const side({Key? key, required this.title});
  final String title;

  @override
  State<side> createState() => _sideState();
}

class _sideState extends State<side> {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
  @override
  void initState() {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    super.initState();
  }

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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SideMenu(
              controller: sideMenu,
              style: SideMenuStyle(
                // showTooltip: false,
                displayMode: SideMenuDisplayMode.auto,
                unselectedTitleTextStyle: const TextStyle(color: Colors.white),
                hoverColor: Colors.black38,
                selectedColor: Colors.amber,
                selectedTitleTextStyle: const TextStyle(color: Colors.black),
                selectedIconColor: Colors.black,
                unselectedIconColor: Colors.white,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                // ),
                // backgroundColor: Colors.blueGrey[700]
              ),
              title: Column(
                children: [
                  const Divider(
                    indent: 8.0,
                    endIndent: 8.0,
                  ),
                  const Text(
                    '\n▫️ PYTHON ▫️\n',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 25.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),

              items: [

                SideMenuItem(
                  priority: 0,
                  title: ' Python Introduction',
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                  // icon: const Icon(Icons.home),
                  //badgeContent: const Text(
                  // '3',
                  // style: TextStyle(color: Colors.white),
                  // ),
                  // tooltipContent: "This is a tooltip for Dashboard item",
                ),
                SideMenuItem(

                  priority: 1,
                  title: 'Python Variables',
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                ),
                SideMenuItem(
                  priority: 2,
                  title: 'Python Syntax',
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                  //  trailing: Container(
                  //     decoration: const BoxDecoration(
                  //        color: Colors.amber,
                  //       borderRadius: BorderRadius.all(Radius.circular(6))),
                  //  child: Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 6.0, vertical: 3),
                  //  child: Text(
                  //  'New',
                  //   style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                  //   ),
                  //   )),
                ),
                SideMenuItem(
                  priority: 3,
                  title: 'Python Data Types',
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                ),
                SideMenuItem(
                  priority: 4,
                  title: 'Python Operators',
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                ),
                // SideMenuItem(
                //   priority: 5,
                //   onTap:(page){
                //     sideMenu.changePage(5);
                //   },
                //   icon: const Icon(Icons.image_rounded),
                // ),
                // SideMenuItem(
                //   priority: 6,
                //   title: 'Only Title',
                //   onTap:(page){
                //     sideMenu.changePage(6);
                //   },
                // ),
                SideMenuItem(
                  priority: 5,
                  title: 'Python Lists',
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                ),
                SideMenuItem(
                  priority: 6,
                  title: 'Python Loops',
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                ),
                SideMenuItem(
                  priority: 7,
                  title: 'Python Functions',
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                ),
                SideMenuItem(
                  priority: 8,
                  title: 'Python Classes and Objects',
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                ),
                SideMenuItem(
                  priority: 9,
                  title: 'Python Dates and Math',
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                ),
                SideMenuItem(
                  priority: 10,
                  title: 'Python Try ... Exceptions',
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                ),
              ],
            ),

            Expanded(
              child: PageView(
                controller: page,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '\n Introduction To Python ',
                              style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 35.0,
                                letterSpacing: 5,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
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
                          child: Text(
                            'What is PYTHON?\n'
                                '\n Python is a popular programming language. It was created by Guido van Rossum, and released in 1991.\n'
                                '\n It is used for:'
                                '\n - web development (server-side),\n'
                                '\n - software development, \n'
                                '\n - mathematics, \n'
                                '\n - system scripting.\n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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
                          child: Text(
                            '\n What can Python do?\n'
                                '\n - Python can be used on a server to create web applications.\n'
                                '\n - Python can be used alongside software to create workflows. \n'
                                '\n - Python can connect to database systems. It can also read and modify files.\n'
                                '\n - Python can be used to handle big data and perform complex mathematics. \n'
                                '\n - Python can be used for rapid prototyping, or for production-ready software development. \n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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
                          child: Text(
                            '\n Why use Python? \n'
                                '\n - Python has a simple syntax similar to the English language\n'
                                '\n - Python has syntax that allows developers to write programs with fewer lines than some other programming languages.\n'
                                '\n - Python runs on an interpreter system, meaning that code can be executed as soon as it is written. \n  This means that prototyping can be very quick.\n'
                                '\n - Python can be treated in a procedural way, an object-oriented way or a functional way. \n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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
                          child: Text(
                            '\n Python Syntax compared to other programming languages: \n'
                                '\n - Python was designed for readability, and has some similarities to the English language with influence from mathematics.\n'
                                '\n - Python uses new lines to complete a command, as opposed to other programming languages which often use semicolons or parentheses.\n'
                                '\n - Python relies on indentation, using whitespace, to define scope; such as the scope of loops, functions and classes. Other programming languages often use curly-brackets for this purpose.\n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 5,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '\n Example: \n  ',
                                style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 20.0,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                                child: Image.asset('assets/images/pythonintro.png',
                                  width: 650,
                                  height: 400,
                                  alignment: Alignment.topCenter,)
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '\n Variables in Python  ',
                              style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 35.0,
                                letterSpacing: 5,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
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
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '\n  Variables are containers for storing data values. \n'
                                    '\n  Creating Variables in Python: \n'
                                    '\n  Python has no command for declaring a variable.\n'
                                    '\n  A variable is created the moment you first assign a value to it.\n'
                                    '\n  Variables do not need to be declared with any particular type, and can even change type after they have been set. \n'
                                    '\n \n  For Example: \n \n',
                                style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 20.0,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                                child:  Image.asset('assets/images/varpy.jpg',
                                  width: 550,
                                  height: 400,
                                  alignment: Alignment.topLeft,)
                            )
                          ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 550,
                              child: Text(
                                '\n  Casting: \n'
                                    '\n  If you want to specify the data type of a variable, this can be done with casting.\n',
                                style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 20.0,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                                child: Image.asset('assets/images/casting.jpg',
                                  alignment: Alignment.center,
                                  width: 550,
                                  height: 300,)
                            )
                          ],
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n Get type: You can get the data type of a variable with the type() function. \n'
                                '\n String variables can be declared either by using single or double quotes. \n'
                                '\n Variable names are case-sensitive.\n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 5,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '\n Syntax  ',
                              style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 35.0,
                                letterSpacing: 5,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n  Python syntax can be executed by writing directly in the Command Line, \n'
                                '\n  Or by creating a python file on the server, using the .py file extension, and running it in the Command Line\n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Image.asset('assets/images/blockindentation.jpg',
                                alignment: Alignment.center,
                                width: 350,
                                height: 400,),
                            ),
                            Container(
                              width: 650,
                              alignment: Alignment.topLeft,
                              child: Text(
                                '\n  Python Indentation: \n'
                                    '\n  -Indentation refers to the spaces at the beginning of a code line.\n'
                                    '\n  -Where in other programming languages the indentation in code is for readability only, the indentation in Python is very important.\n'
                                    '\n  -Python uses indentation to indicate a block of code.\n'
                                    '\n  -Python will give you an error if you skip the indentation. \n'
                                    '\n  -The number of spaces is up to you as a programmer, the most common use is four, but it has to be at least one.\n'
                                    '\n  -You have to use the same number of spaces in the same block of code, otherwise Python will give you an error. \n',
                                style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 20.0,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n  Variables: \n'
                                '\n  In Python, variables are created when you assign a value to it.\n'
                                '\n Python has no command for declaring a variable. \n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n Comments: \n'
                                '\n Python has commenting capability for the purpose of in-code documentation. \n'
                                '\n Comments start with a #, and Python will render the rest of the line as a comment. \n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 5,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '\n Pre-Defined Data Types  ',
                              style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 35.0,
                                letterSpacing: 5,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n  In programming, data type is an important concept.\n'
                                '\n  Variables can store data of different types, and different types can do different things.\n'
                                '\n Python has the following data types built-in by default, in these categories: \n \n'
                                '\n -Text Type:	str \n \n -Numeric Types:	int, float, complex \n \n -Sequence Types:	list, tuple, range \n \n -Mapping Type:	dict \n'
                                '\n -Set Types:	set, frozenset \n \n -Boolean Type:	bool \n \n -Binary Types:	bytes, bytearray, memoryview \n \n -None Type:	NoneType',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n  Operations: \n \n'
                                '\n  - Getting the Data Type: You can get the data type of any object by using the type() function. \n'
                                '\n  - Setting the Data Type: In Python, the data type is set when you assign a value to a variable.\n'
                                '\n  - Setting a Specific Data Type: There are many constructor functions in python that help you specify the data type.\n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '\n Python Operators  ',
                              style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 35.0,
                                letterSpacing: 5,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n  Operators are used to perform operations on variables and values.\n'
                                '\n  Python divides the operators in the following groups:\n'
                                '\n  -Arithmetic operators \n \n -Assignment operators \n \n -Comparison operators \n \n -Logical operators \n \n -Identity operators \n \n -Membership operators \n \n -Bitwise operators.',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n  - Arithmetic operators are used with numeric values to perform common mathematical operations. \n'
                                '\n  - Assignment operators are used to assign values to variables \n'
                                '\n  - Comparison operators are used to compare two values.\n'
                                '\n  - Logical operators are used to combine conditional statements.\n'
                                '\n  - Identity operators are used to compare the objects, not if they are equal, but if they are actually the same object, with the same memory location. \n'
                                '\n  - Membership operators are used to test if a sequence is presented in an object. \n'
                                '\n  - Bitwise operators are used to compare (binary) numbers.',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 550,
                              alignment: Alignment.topLeft,
                              child: Text(
                                '\n  Operator precedence; \n \n Describes the order in which operations are performed. \n \n',
                                style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 20.0,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              child: Image.asset('assets/images/Precedence.jpg',
                                alignment: Alignment.center,
                                width: 550,
                                height: 300,),
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '\n Python Lists  ',
                              style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 35.0,
                                letterSpacing: 5,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
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
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '\n  Lists are used to store multiple items in a single variable.\n'
                                    '\n   Lists are one of 4 built-in data types in Python used to store collections of data, \n the other 3 are Tuple, Set, and Dictionary, all with different qualities and usage.\n'
                                    '\n  Lists are created using square brackets \n \n Example: \n \n',
                                style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 20.0,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                                child: Image.asset('assets/images/list.png',
                                  alignment: Alignment.topLeft,)
                            )
                          ],
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n  -List Items: List items are ordered, changeable, and allow duplicate values, they are indexed, the first item has index [0], the second item has index [1] etc \n'
                                '\n  -Ordered: When we say that lists are ordered, it means that the items have a defined order, and that order will not change, If you add new items to a list, the new items will be placed at the end of the list. \n'
                                '\n  -Changeable: The list is changeable, meaning that we can change, add, and remove items in a list after it has been created.\n'
                                '\n  -Allow Duplicates: Since lists are indexed, lists can have items with the same value.\n'
                                '\n  -List Length: To determine how many items a list has, use the len() function. \n'
                                '\n  -List Items: List items can be of any data type, it can also contain different data types. \n'
                                '\n  -The list() Constructor; It is also possible to use the list() constructor when creating a new list.',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n  Python Collections (Arrays) \n \n'
                                '\n There are four collection data types in the Python programming language: \n'
                                '\n List is a collection which is ordered and changeable. Allows duplicate members. \n'
                                '\n Tuple is a collection which is ordered and unchangeable. Allows duplicate members. \n'
                                '\n Set is a collection which is unordered, unchangeable*, and unindexed. No duplicate members. \n'
                                '\n Dictionary is a collection which is ordered** and changeable. No duplicate members. \n'
                                '\n \n (*Set items are unchangeable, but you can remove and/or add items whenever you like.\n **As of Python version 3.7, dictionaries are ordered. In Python 3.6 and earlier, dictionaries are unordered.)\n'
                                '\n \n When choosing a collection type, it is useful to understand the properties of that type. \n \n Choosing the right type for a particular data set could mean retention of meaning, and, it could mean an increase in efficiency or security.\n \n ',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '\n Python Loops  ',
                              style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 35.0,
                                letterSpacing: 5,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n Python While Loops \n \n'
                                '\n  While: With the while loop we can execute a set of statements as long as a condition is true. \n'
                                '\n  ( Note: remember to increment your variable, or else the loop will continue forever.)\n'
                                '\n  The while loop requires relevant variables to be ready \n \n - The break Statement: with it we can stop the loop even if the while condition is true. \n \n'
                                '- The continue Statement: with it we can stop the current iteration, and continue with the next. \n'
                                '\n - The else Statement: with it we can run a block of code once when the condition no longer is true.',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n  Python For Loops \n \n'
                                '\n  A for loop is used for iterating over a sequence (that is either a list, a tuple, a dictionary, a set, or a string). \n'
                                '\n  This is less like the for keyword in other programming languages, and works more like an iterator method as found in other object-orientated programming languages.\n'
                                '\n  With the for loop we can execute a set of statements, once for each item in a list, tuple, set etc.\n'
                                '\n  The for loop does not require an indexing variable to set beforehand. \n'
                                '\n  (Even strings are iterable objects, they contain a sequence of characters) \n'
                                '\n  - The break Statement: using it we can stop the loop before it has looped through all the items. \n'
                                '\n  - The continue Statement: using it we can stop the current iteration of the loop, and continue with the next. \n'
                                '\n  - The range() Function: To loop through a set of code a specified number of times, we can use this function which returns a sequence of numbers, starting from 0 by default, and increments by 1 (by default), and ends at a specified number.\n (Note that range(6) is not the values of 0 to 6, but the values 0 to 5.)\n'
                                '\n  - Else in For Loop: The else keyword in a for loop specifies a block of code to be executed when the loop is finished.(Note: The else block will NOT be executed if the loop is stopped by a break statement.)\n'
                                '\n  - Nested Loops: it is a loop inside a loop, The "inner loop" will be executed one time for each iteration of the "outer loop". \n'
                                '\n  - The pass Statement: for loops cannot be empty, but if you for some reason have a for loop with no content, put in the pass statement to avoid getting an error.\n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '\n Python Functions  ',
                              style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 35.0,
                                letterSpacing: 5,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n A function is a block of code which only runs when it is called. \n'
                                '\n  You can pass data, known as parameters, into a function. \n'
                                '\n  A function can return data as a result.\n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 500,
                              alignment: Alignment.topLeft,
                              child: Text(
                                '\n  The Basics \n \n'
                                    '\n -Creating a Function: In Python a function is defined using the def keyword. \n'
                                    '\n  -Calling a Function: To call a function, use the function name followed by parenthesis.\n',
                                style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 20.0,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Image.asset(
                              'assets/images/functions.png',
                              width: 600,
                              height: 350,)
                          ],
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n Arguments \n'
                                '\n  Information can be passed into functions as arguments. \n'
                                '\n  Information can be passed into functions as arguments.\n'
                                '\n Parameters or Arguments?; The terms parameter and argument can be used for the same thing: information that are passed into a function. \n'
                                '\n Arbitrary Arguments, *args; If you do not know how many arguments that will be passed into your function, add a * before the parameter name in the function definition. \n'
                                ' \n Other Types of arguments are; \n -Keyword Arguments,\n -Arbitrary Keyword Arguments, **kwargs. ',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n - Default Parameter Value: If we call the function without argument, it uses the default value. \n'
                                '\n  - Passing a List as an Argument: You can send any data types of argument to a function (string, number, list, dictionary etc.), and it will be treated as the same data type inside the function.  \n'
                                '\n  - Return Values: To let a function return a value, use the return statement.\n'
                                '\n - The pass Statement: function definitions cannot be empty, but if you for some reason have a function definition with no content, put in the pass statement to avoid getting an error. \n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '\n Recursion \n'
                                    '\n Python also accepts function recursion, which means a defined function can call itself.  \n'
                                    '\n Recursion is a common mathematical and programming concept. It means that a function calls itself.\n This has the benefit of meaning that you can loop through data to reach a result.\n',
                                style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 20.0,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Image.asset(
                              'assets/images/recursivepython.png',
                              width: 400,
                              height: 250,)
                          ],
                        ),

                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '\n Python Classes And Objects  ',
                              style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 35.0,
                                letterSpacing: 5,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n Python is an object oriented programming language. \n'
                                '\n  Almost everything in Python is an object, with its properties and methods. \n'
                                '\n  A Class is like an object constructor, or a "blueprint" for creating objects.\n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 500,
                              alignment: Alignment.topLeft,
                              child: Text(
                                '\n  Creating \n \n'
                                    '\n -Creating a Class: we use the keyword "class".\n'
                                    '\n  -Creating an Object: we use the classes we created to create objects.',
                                style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 20.0,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Image.asset(
                              'assets/images/ClassesObjects.png',
                              width: 600,
                              height: 350,)
                          ],
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n The __init__() Function: Use the __init__() function to assign values to object properties, or other operations that are necessary to do when the object is being created.\n (Note: The __init__() function is called automatically every time the class is being used to create a new object.) \n'
                                '\n  The __str__() Function: The __str__() function controls what should be returned when the class object is represented as a string. \n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n - Object Methods: Objects can also contain methods. Methods in objects are functions that belong to the object.\n'
                                '\n  - The self Parameter: it is a reference to the current instance of the class, and is used to access variables that belong to the class.  \n'
                                '\n  -Object Properties Manipulations: "Modify", "Delete" (using the "del" keyword).\n'
                                '\n - The pass Statement: class definitions cannot be empty, but if you for some reason have a class definition with no content, put in the pass statement to avoid getting an error. \n \n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '\n Python Dates and Math \n',
                              style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 35.0,
                                letterSpacing: 5,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n Python Dates \n'
                                '\n  A date in Python is not a data type of its own, but we can import a module named datetime to work with dates as date objects. \n'
                                '\n  Date Output: The date contains year, month, day, hour, minute, second, and microsecond. (The datetime module has many methods to return information about the date object.)\n'
                                '\n - Creating Date Objects: To create a date, we can use the datetime() class (constructor) of the datetime module. \n'
                                '\n - The strftime() Method: The datetime object has a method for formatting date objects into readable strings. (The method is called strftime(), and takes one parameter, format, to specify the format of the returned string) \n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n  Python Math \n \n'
                                '\n Built-in Math Functions: The min() and max() functions can be used to find the lowest or highest value in an iterable.\n'
                                '\n - The abs() function returns the absolute (positive) value of the specified number \n'
                                '\n - The pow(x, y) function returns the value of x to the power of y (xy). \n'
                                '\n The Math Module: \n'
                                '\n Python has also a built-in module called math, which extends the list of mathematical functions. (import math)\n'
                                '\n When you have imported the math module, you can start using methods and constants of the module.\n'
                                '\n - The math.sqrt() method for example, returns the square root of a number.\n'
                                '\n - The math.ceil() method rounds a number upwards to its nearest integer, and the math.floor() method rounds a number downwards to its nearest integer, and returns the result. \n'
                                '\n - The math.pi constant, returns the value of PI (3.14...) \n \n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          child: const Center(
                            child: Text(
                              '\n Python Try ... Except \n',
                              style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 35.0,
                                letterSpacing: 5,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 650,
                              alignment: Alignment.topLeft,
                              child: Text(
                                '\n The try block lets you test a block of code for errors.\n'
                                    '\n  The except block lets you handle the error. \n'
                                    '\n  The else block lets you execute code when there is no error.\n'
                                    '\n The finally block lets you execute code, regardless of the result of the try- and except blocks.\n',
                                style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 20.0,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Image.asset('assets/images/exception.png',
                              width: 450,
                              height: 400,)
                          ],
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
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\n -Exception Handling:\n'
                                '\n When an error occurs, or exception as we call it, Python will normally stop and generate an error message.\n'
                                '\n -Many Exceptions: \n'
                                '\n You can define as many exception blocks as you want, e.g. if you want to execute a special block of code for a special kind of error. \n'
                                '\n -Else: \n'
                                '\n You can use the else keyword to define a block of code to be executed if no errors were raised.\n'
                                '\n -Finally:\n'
                                '\n The finally block, if specified, will be executed regardless if the try block raises an error or not.\n'
                                '\n -Raise an exception: \n'
                                '\n To throw (or raise) an exception, use the raise keyword. \n \n',
                            style: TextStyle(
                              fontFamily: 'Inika',
                              fontSize: 20.0,
                              letterSpacing: 3,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}