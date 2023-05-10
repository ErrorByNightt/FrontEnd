import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project_coding_game/Games/Entrainement.dart';
import 'package:project_coding_game/Screens/profile.dart';

import '../authentification/sign_in.dart';

class AI extends StatelessWidget {
  const AI({super.key});

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
          body: SingleChildScrollView(
            child: Column(
              children: [
                 Center(
                  child: Text(
                    'About AI ',
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
                  'Why did we use AI in our web application?  ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Inika',
                    letterSpacing: 2,
                    color: Color.fromARGB(255, 222, 124, 124),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                '▫️ Lets begin ▫️',
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/AI-Development.png',
                          width: 600,
                          height: 700,
                        ),
                        Container(
                            width: 550,
                            child: const Text(
                              '\n Artificial intelligence (AI) has been infiltrating nearly all virtual areas for quite some time now. Artificial intelligence in game development is not an exception. The technology is something that can do wonders for a game app development company in this era. Automation in-game creation is growing after performing an essential part in modern media.\n'
                              '\n Game creation is reaching amazingly additional levels, and it is all because of artificial intelligence. By recognizing gamers’ goals and issues, AI assists to guarantee that they get joy playing. AI also aids game creators in making more valuable enhancements and changes as per data-driven insights. Apart from meeting its core aim of offering a fantastic gameplay experience, AI also displays many new potentials in the gaming business. It is opening up new opportunities for many businesses that are looking to enter the market.',
                              style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 17.0,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ))
                      ],
                    )
                  ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                '▫️ How does AI help with coding?▫️',
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              width: 550,
                              child: const Text(
                                'Coding with AI?\n'
                                '\n AI-assisted coding is the use of machine learning models to generate code automatically. Most existing AI-assisted coding tools let developers describe in natural language what they want their code to do.',
                                style: TextStyle(
                                    fontFamily: 'Inika',
                                    fontSize: 17.0,
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              )),
                          Image.asset(
                            'assets/images/coding.jpeg',
                            width: 550,
                            height: 600,
                          )
                        ],
                      )
                    ]),
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                '▫️ Benefits of AI ▫️',
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            width: 600,
                            child: const Text(
                              '\n The following are the primary advantages of AI:\n'
                              '\n  ▫️AI drives down the time taken to perform a task. It enables multi-tasking and eases the workload for existing resources.\n'
                              '\n  ▫️AI enables the execution of hitherto complex tasks without significant cost outlays.\n'
                              '\n  ▫️AI operates 24x7 without interruption or breaks and has no downtime.\n'
                              '\n  ▫️AI augments the capabilities of differently abled individuals.\n'
                              '\n  ▫️AI facilitates decision-making by making the process faster and smarter.\n',
                              style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 17.0,
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            )),
                             Image.asset(
                          'assets/images/ai.jpg',
                          width: 400,
                          height: 700,
                        ),
                      ],
                    )
                  ],
                ),
              ],  
            ), 
          ),
        ));
  }
}
