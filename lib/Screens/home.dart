import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_coding_game/Screens/profile.dart';

/*import 'dart:math';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<IconData> icon = [
    Icons.home,
    Icons.account_tree_sharp,
    Icons.stairs_outlined,
    Icons.video_settings_sharp,
    Icons.document_scanner_outlined,
    Icons.source_outlined
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  child: const Text(
                    'Help-Line (+234)08128916397',
                    //   textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 700.0),
                  child: const Text(
                    'Email: codeninja@gmail.com',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
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
                    Container(
                      color: Colors.white,
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      height: MediaQuery.of(context).size.height,
                      width: 101.0,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 157, 130, 129),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Stack(children: [
                        Positioned(
                          top: 110,
                          child: Column(
                            children:
                                icon.map((e) => NavBarItem(icon: e)).toList(),
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class NavBarItem extends StatefulWidget {
  final IconData icon;
  // final Function onTap;
  // final bool selected;
  // ignore: use_key_in_widget_constructors
  const NavBarItem({required this.icon});

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 101.0,
      color: Colors.transparent,
      child: Stack(children: [
        Container(
          child: CustomPaint(painter: CurvePainter()),
        ),
        Container(
          height: 80.0,
          width: 101.0,
        )
      ]),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.moveTo(101, 20);
    path.quadraticBezierTo(101, 20, 75, 20);
    path.lineTo(50, 20);
    path.quadraticBezierTo(25, 20, 25, 40);
    path.lineTo(101, 40);
    path.close();

    path.moveTo(101, 80);
    path.quadraticBezierTo(101, 60, 75, 60);
    path.lineTo(50, 60);
    path.quadraticBezierTo(25, 60, 25, 40);
    path.lineTo(101, 40);
    path.close();

    paint.color = Colors.white;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
*/

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  bool _isHovered = false;
  bool isHoveringIcon = false;
  bool isHoveringChallenge = false;
  bool isHoveringCours = false;
  bool isHoveringSolo = false;
  bool isHoveringMulti = false;

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
            toolbarHeight: 70.0,
            backgroundColor: Colors.red.withOpacity(0.1),

            leading: Container(
              // Définir la hauteur souhaitée
              child: Image.asset('assets/images/logo.png'),
            ),
            title: Row(

              children: [
                GestureDetector(
                  child: Icon(Icons.home),
                  onTap: () {
                    // Action à effectuer lorsqu'on clique sur "Texte 1"
                  },
                ),
                SizedBox(width: 20), // Espace horizontal entre les textes

                MouseRegion(
                  onEnter: (_) => setState(() => isHoveringChallenge = true),
                  onExit: (_) => setState(() => isHoveringChallenge = false),
                  child: GestureDetector(
                    child: Text('CHALLENGES',
                      style: TextStyle(
                        color: isHoveringChallenge ? Colors.deepOrangeAccent : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // Action à effectuer lorsqu'on clique sur "Texte 1"
                    },
                  ),
                  onHover: (PointerEvent details) {
                    final RenderBox renderBox =
                    context.findRenderObject() as RenderBox;
                    final offset = renderBox.localToGlobal(
                      Offset.zero,
                      // ancestor: context.findRenderObject()?.parentData?.parentData
                      // as RenderObject?,
                    );



                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(  offset.dx + 80, offset.dy + 75, offset.dx + 120, offset.dy + 20),
                      color: Colors.black45,
                      items: <PopupMenuEntry>[
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Profil', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Amis', style: TextStyle(color: Colors.white)),
                          ),                        ),
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Paramètres', style: TextStyle(color: Colors.white)),
                          ),                         ),
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Déconnexion', style: TextStyle(color: Colors.white)),
                          ),                        ),
                      ],
                    );
                  },
                ),
                SizedBox(width: 18), // Espace horizontal entre les textes
                MouseRegion(
                  onEnter: (_) => setState(() => isHoveringCours = true),
                  onExit: (_) => setState(() => isHoveringCours = false),
                  child: GestureDetector(
                    child: Text('COURS',
                      style: TextStyle(
                        color: isHoveringCours ? Colors.deepOrangeAccent : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // Action à effectuer lorsqu'on clique sur "Texte 1"
                    },
                  ),
                  onHover: (PointerEvent details) {
                    final RenderBox renderBox =
                    context.findRenderObject() as RenderBox;
                    final offsett = renderBox.localToGlobal(
                      Offset.zero,
                      // ancestor: context.findRenderObject()?.parentData?.parentData
                      // as RenderObject?,
                    );



                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(  offsett.dx + 50, offsett.dy + 75, offsett.dx + 120, offsett.dy + 20),
                      color: Colors.black45,
                      items: <PopupMenuEntry>[
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Profil', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Amis', style: TextStyle(color: Colors.white)),
                          ),                        ),
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Paramètres', style: TextStyle(color: Colors.white)),
                          ),                         ),
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Déconnexion', style: TextStyle(color: Colors.white)),
                          ),                        ),
                      ],
                    );
                  },
                ),
                SizedBox(width: 18), // Espace horizontal entre les textes
                MouseRegion(
                  onEnter: (_) => setState(() => isHoveringSolo = true),
                  onExit: (_) => setState(() => isHoveringSolo = false),
                  child: GestureDetector(
                    child: Text('SOLO',
                      style: TextStyle(
                        color: isHoveringSolo ? Colors.deepOrangeAccent : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // Action à effectuer lorsqu'on clique sur "Texte 1"
                    },
                  ),
                  onHover: (PointerEvent details) {
                    final RenderBox appBarRenderBox =
                    context.findRenderObject() as RenderBox;
                    final appBarOffset = appBarRenderBox.localToGlobal(
                      Offset.zero,
                      // ancestor: context.findRenderObject()?.parentData?.parentData
                      // as RenderObject?,
                    );
                    const menuHeight = 75.0;
                    const menuWidht = 40.0;


                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB( appBarOffset.dx + 100,
                          appBarOffset.dy + menuHeight,
                          appBarOffset.dx + 120,
                          appBarOffset.dy),
                      color: Colors.black45,
                      items: <PopupMenuEntry>[
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Profil', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Amis', style: TextStyle(color: Colors.white)),
                          ),                        ),
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Paramètres', style: TextStyle(color: Colors.white)),
                          ),                         ),
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Déconnexion', style: TextStyle(color: Colors.white)),
                          ),                        ),
                      ],
                    );
                  },
                ),
                SizedBox(width: 18), // Espace horizontal entre les textes
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => setState(() => isHoveringMulti = true),
                  onExit: (_) => setState(() => isHoveringMulti = false),
                  child: GestureDetector(
                    child: Text('MULTI',
                      style: TextStyle(
                        color: isHoveringMulti ? Colors.deepOrangeAccent : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // Action à effectuer lorsqu'on clique sur "Texte 1"
                    },
                  ),
                  onHover: (PointerEvent details) {
                    final RenderBox appBarRenderBox =
                    context.findRenderObject() as RenderBox;
                    final appBarOffset = appBarRenderBox.localToGlobal(
                      Offset.zero,
                     // ancestor: context.findRenderObject()?.parentData?.parentData
                     // as RenderObject?,
                    );
                    const menuHeight = 75.0;
                    const menuWidht = 40.0;


                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB( appBarOffset.dx + 100,
                          appBarOffset.dy + menuHeight,
                          appBarOffset.dx + 120,
                          appBarOffset.dy),
                      color: Colors.black45,
                      items: <PopupMenuEntry>[
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Profil', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Amis', style: TextStyle(color: Colors.white)),
                          ),                        ),
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Paramètres', style: TextStyle(color: Colors.white)),
                          ),                         ),
                        PopupMenuItem(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage()),
                              );
                            },
                            child: Text('Déconnexion', style: TextStyle(color: Colors.white)),
                          ),                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            actions: [
              Row(

                // aligner les enfants à la fin
                children: [

                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Row(
                      children: [
                       CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/dragon.png'),
                        ),
                        SizedBox(width: 10),

                        Text('Dhia Bouslimi',style:TextStyle(fontSize: 20),),
                        SizedBox(width: 10),

                        GestureDetector(
                          child: Icon(Icons.arrow_drop_down, size: 20,),
                          onTap: () {},
                        ),
                      ],
                    ),
                    onHover: (PointerEvent details) {
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(70.0, 70.0, 10.0, 0.0),
                        color: Colors.black45,
                        items: <PopupMenuEntry>[
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ProfilePage()),
                                );
                              },
                              child: Text('Profil', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ProfilePage()),
                                );
                              },
                              child: Text('Amis', style: TextStyle(color: Colors.white)),
                            ),                        ),
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ProfilePage()),
                                );
                              },
                              child: Text('Paramètres', style: TextStyle(color: Colors.white)),
                            ),                         ),
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ProfilePage()),
                                );
                              },
                              child: Text('Déconnexion', style: TextStyle(color: Colors.white)),
                            ),                        ),
                        ],
                      );
                    },
                    onExit: (PointerEvent details) {
                      // Ne rien faire
                    },
                  ),
                ],
              ),
            ],
          ),






            body: Container(


          ),
        ));
  }
}
