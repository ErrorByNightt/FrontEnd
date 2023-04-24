import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_coding_game/Games/game_home.dart';
import 'package:project_coding_game/Screens/Classement.dart';
import 'package:project_coding_game/Screens/level-page.dart';
import 'package:project_coding_game/Screens/profile.dart';
import 'package:project_coding_game/Screens/quiz.dart';
import 'package:project_coding_game/Screens/utils.dart';
import 'package:http/http.dart' as http;

import 'courses.dart';
import 'home.dart';

class Scene extends StatefulWidget {
  final String? userId;
  final Map<String, dynamic>? userData;

  const Scene ({ Key? key,
    required this.userId,
    this.userData,
  }) : super(key: key);
  @override
  State<Scene> createState() => _SceneState();
}

class _SceneState extends State<Scene> {

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

  void _updateUserData(Map<String, dynamic> updatedData) async {
    final userId = widget.userId;
    final url = 'http://localhost:9095/user/update/$userId';
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(updatedData);

    final response = await http.put(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['user'] != null) {
        setState(() {
          _userData = responseData['user'];
          _userData = responseData['job'];
          _userData = responseData['city'];
          _userData = responseData['school'];


        });
      }
    } else {
      // handle error
    }
  }

  @override
  Widget build(BuildContext context) {

    double baseWidth = 1908.96875;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
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
                      MaterialPageRoute(builder: (context) => Level(userId: _userData['_id'], userData: {},),
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
                        radius: 20,
                        backgroundImage: AssetImage(
                          'assets/images/avatar-1.png',
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
                                    builder: (context) => ProfilePage(userId: '',)),
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
                                    builder: (context) => ProfilePage(userId: '',)),
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
                                    builder: (context) => ProfilePage(userId: '',)),
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
                                    builder: (context) => ProfilePage(userId: '',)),
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
              const SizedBox(width: 10),
              GestureDetector(
                child: const Icon(
                  Icons.notifications_none,
                  size: 30,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            width: double.infinity,
            height: 1122.11*fem,
            decoration: BoxDecoration (
              gradient: LinearGradient (
                begin: Alignment(-0.971, -1),
                end: Alignment(1.057, -1),
                colors: <Color>[Color(0xffbe002d), Color(0xff281d2a), Color(0xdd200000)],
                stops: <double>[0, 0.568, 1],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  // rectangle840LLD (166:187)
                  left: 0*fem,
                  top: 12*fem,
                  child: Align(
                    child: SizedBox(
                      width: 1908.97*fem,
                      height: 1102*fem,
                      child: Container(
                        decoration: BoxDecoration (
                          gradient: LinearGradient (
                            begin: Alignment(-0.971, -1),
                            end: Alignment(1.057, -1),
                            colors: <Color>[Color(0xffbe002d), Color(0xff281d2a), Color(0xdd200000)],
                            stops: <double>[0, 0.568, 1],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle861jdF (169:230)
                  left: 996*fem,
                  top: 765*fem,
                  child: Align(
                    child: SizedBox(
                      width: 181*fem,
                      height: 172*fem,
                      child: Container(
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(20*fem),
                          color: Color(0x93d9d9d9),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle3511Ks (166:449)
                  left: 620*fem,
                  top: 236*fem,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur (
                        sigmaX: 2*fem,
                        sigmaY: 2*fem,
                      ),
                      child: Align(
                        child: SizedBox(
                          width: 1017*fem,
                          height: 327*fem,
                          child: Container(
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(20*fem),
                              color: Color(0x3f1f1f1f),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // metaimageremovebgpreview8SAH (169:229)
                  left: 1454*fem,
                  top: 807*fem,
                  child: Align(
                    child: SizedBox(
                      width: 134*fem,
                      height: 112*fem,
                      child: Image.asset(
                        'assets/images/meta-image-removebg-preview-8.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // metaimageremovebgpreview1idb (169:225)
                  left: 615*fem,
                  top: 807*fem,
                  child: Align(
                    child: SizedBox(
                      width: 120*fem,
                      height: 106*fem,
                      child: Image.asset(
                        'assets/images/meta-image-removebg-preview-1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // metaimageremovebgpreview5Pzd (169:227)
                  left: 1607*fem,
                  top: 803*fem,
                  child: Align(
                    child: SizedBox(
                      width: 168*fem,
                      height: 122*fem,
                      child: Image.asset(
                        'assets/images/meta-image-removebg-preview-5.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // metaimageremovebgpreview3V25 (169:228)
                  left: 425*fem,
                  top: 796*fem,
                  child: Align(
                    child: SizedBox(
                      width: 182*fem,
                      height: 101*fem,
                      child: Image.asset(
                        'assets/images/meta-image-removebg-preview-3.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // goodboy55yhw (169:223)
                  left: 1397*fem,
                  top: 513*fem,
                  child: Align(
                    child: SizedBox(
                      width: 191*fem,
                      height: 45*fem,
                      child: Text(
                        'GOODBOY55',
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 30*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5*ffem/fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // goodboy55SrR (169:224)
                  left: 618*fem,
                  top: 513*fem,
                  child: Align(
                    child: SizedBox(
                      width: 191*fem,
                      height: 45*fem,
                      child: Text(
                        'GOODBOY55',
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 30*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5*ffem/fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // metaimageremovebgpreview6uzu (166:455)
                  left: 1203*fem,
                  top: 757*fem,
                  child: Align(
                    child: SizedBox(
                      width: 251*fem,
                      height: 222*fem,
                      child: Image.asset(
                        'assets/images/meta-image-removebg-preview-6.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // metaimageremovebgpreview4QAy (166:456)
                  left: 970*fem,
                  top: 744*fem,
                  child: Align(
                    child: SizedBox(
                      width: 233*fem,
                      height: 207*fem,
                      child: Image.asset(
                        'assets/images/meta-image-removebg-preview-4.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // metaimageremovebgpreview7Giy (166:457)
                  left: 773*fem,
                  top: 774*fem,
                  child: Align(
                    child: SizedBox(
                      width: 160*fem,
                      height: 153*fem,
                      child: Image.asset(
                        'assets/images/meta-image-removebg-preview-7.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // group9102ZCH (166:188)
                  left: 364.5*fem,
                  top: 0*fem,
                  child: Container(
                    width: 625*fem,
                    height: 207*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // group3THf (166:190)
                          left: 182.5*fem,
                          top: 105*fem,
                          child: Container(
                            width: 198*fem,
                            height: 59*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // ellipse1Kqf (166:192)
                                  margin: EdgeInsets.fromLTRB(0*fem, 5.02*fem, 50.03*fem, 0*fem),
                                  width: 20.97*fem,
                                  height: 15.24*fem,
                                  child: Image.asset(
                                    'assets/images/ellipse-1-AJZ.png',
                                    width: 20.97*fem,
                                    height: 15.24*fem,
                                  ),
                                ),
                                Container(
                                  // vsPqX (166:191)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 37.03*fem, 0*fem),
                                  child: Text(
                                    'VS\n',
                                    style: SafeGoogleFont (
                                      'Montserrat',
                                      fontSize: 48*ffem,
                                      fontWeight: FontWeight.w900,
                                      height: 1.2175*ffem/fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  // ellipse2GuK (166:193)
                                  margin: EdgeInsets.fromLTRB(0*fem, 5.02*fem, 0*fem, 0*fem),
                                  width: 20.97*fem,
                                  height: 15.24*fem,
                                  child: Image.asset(
                                    'assets/images/ellipse-2-tVT.png',
                                    width: 20.97*fem,
                                    height: 15.24*fem,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // challenge9y7 (166:194)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 625*fem,
                              height: 207*fem,
                              child: Text(
                                'CHALLENGE',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Inknut Antiqua',
                                  fontSize: 80*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 2.5775*ffem/fem,
                                  color: Color(0x5ecac3c3),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  // codeninja6removebgpreview39gq (166:358)
                  left: 37*fem,
                  top: 28*fem,
                  child: Align(
                    child: SizedBox(
                      width: 234*fem,
                      height: 164*fem,
                      child: Image.asset(
                        'assets/images/codeninja6-removebg-preview-3-GNZ.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  // player1dnM (166:370)
                  left: 1579*fem,
                  top: 221.1296386719*fem,
                  child: Container(
                    width: 235*fem,
                    height: 58.3*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          // autogroupb2usdA5 (8jTD4sB7dRyGY5mTaMB2us)
                          padding: EdgeInsets.fromLTRB(12*fem, 8.16*fem, 0*fem, 11.15*fem),
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroupmanyvus (8jTCpnkEfszuGK1pZPmany)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 0*fem),
                                width: 134*fem,
                                height: double.infinity,
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // pxsmpwario1u17 (166:451)
                  left: 1375*fem,
                  top: 194*fem,
                  child: Align(
                    child: SizedBox(
                      width: 253*fem,
                      height: 315*fem,
                      child: Image.asset(
                        'assets/images/px-smpwario-1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // sonicthehedgehogtysonhessepose (166:452)
                  left: 606*fem,
                  top: 208*fem,
                  child: Align(
                    child: SizedBox(
                      width: 234*fem,
                      height: 308*fem,
                      child: Image.asset(
                        'assets/images/sonicthehedgehogtysonhesseposeissue1bykolnzberserkdd40fdm-fullview-1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // premiumvectorversusgamecoverba (166:453)
                  left: 874*fem,
                  top: 221*fem,
                  child: Align(
                    child: SizedBox(
                      width: 379*fem,
                      height: 362*fem,
                      child: Image.asset(
                        'assets/images/premiumvectorversusgamecoverbannersportvsteamconcept-removebg-preview-1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // choosealanguageriy (166:458)
                  left: 889.5*fem,
                  top: 650*fem,
                  child: Align(
                    child: SizedBox(
                      width: 433*fem,
                      height: 61*fem,
                      child: Text(
                        'Choose a language',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Irish Grover',
                          fontSize: 50*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.21*ffem/fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // playJL5 (166:460)
                  left: 1025.5*fem,
                  top: 991*fem,
                  child: Align(
                    child: SizedBox(
                      width: 84*fem,
                      height: 71*fem,
                      child: Text(
                        'Play',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Nunito',
                          fontSize: 40*ffem,
                          fontWeight: FontWeight.w800,
                          height: 1.775*ffem/fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle6x9j (229:207)
                  left: 876*fem,
                  top: 979*fem,
                  child: Align(
                    child: SizedBox(
                      width: 377*fem,
                      height: 104*fem,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom (
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(60*fem),
                            border: Border.all(color: Color(0xff000000)),
                            color: Color(0xff3d87ff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // playCZs (229:208)
                  left: 1018*fem,
                  top: 997*fem,
                  child: Align(
                    child: SizedBox(
                      width: 94*fem,
                      height: 71*fem,
                      child: Text(
                        'Play',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Nunito',
                          fontSize: 45*ffem,
                          fontWeight: FontWeight.w800,
                          height: 1.5777777778*ffem/fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}