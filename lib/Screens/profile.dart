import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project_coding_game/Games/game_home.dart';
import 'package:project_coding_game/Screens/Classement.dart';
import 'package:project_coding_game/Screens/quiz.dart';
import 'package:http/http.dart' as http;

import 'courses.dart';
import 'home.dart';
import 'level-page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  final String? userId;
  final Map<String, dynamic>? userData;

  const ProfilePage ({ Key? key,
    required this.userId,
    this.userData,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String _job;
  bool isHoveringName = false;
  bool isHoveringParis = false;
  bool isHoveringDevWeb = false;
  bool isHoveringEtudiant = false;
  TextEditingController _jobController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _schoolController = TextEditingController();


  late Map<String, dynamic> _userData = {};
  File? _imageFile;

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



  void _updateUserImage(Map<String, dynamic> updatedData) async {
    final userId = widget.userId;
    final url = 'http://localhost:9095/user/updateImage/$userId';
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(updatedData);

    final response = await http.put(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['user'] != null) {
        setState(() {
          _userData = responseData['user'];
          _userData = responseData['image'];



        });
      }
    } else {
      // handle error
    }
  }

  Future<void> uploadFile(File file) async {
    final userId = widget.userId;
    final formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path),
    });
    try {
      final response = await Dio().put(
        'http://localhost:9095/user/updateImage/$userId',
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData['user'] != null) {
          setState(() {
            _userData = responseData['user'];
            _userData = responseData['image'];
          });
        }
      }
    } catch (error) {
      // handle error
    }
  }




  Future<void> _getImageFromGallery() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() async {
        _imageFile = File(pickedFile.path);



      });
    }
  }

  Future<void> _updateProfileImage(String imageUrl) async {
    final userId = widget.userId;
    final url = 'http://localhost:9095/user/updateImage/$userId';
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'image': imageUrl});

    try {
      final response = await http.put(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['user'] != null) {
          setState(() {
            _userData = responseData['user'];
            _userData['image'] = responseData['imageUrl'];
          });
        }
      } else {
        // handle error
      }
    } catch (error) {
      // handle error
    }
  }


  Future<String> uploadImage(File imageFile) async {
    final url = 'http://localhost:9095/user/uploads';
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.transform(utf8.decoder).join();
      final imageUrl = json.decode(responseData)['imageUrl'];
      return imageUrl;
    } else {
      throw Exception('Failed to upload image.');
    }
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
            child: Container(
              width: double.infinity,

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.971, -1),
                  end: Alignment(1.057, -1),
                  colors: <Color>[
                    Color(0xffbe002d),
                    Color(0xff281d2a),
                    Color(0xdd200000)
                  ],
                  stops: <double>[0, 0.568, 1],
                ),
              ),
              child: Column(
                children: [

                  Stack(
                    children: [


                      Image.asset(
                        'assets/images/chichbich.png',
                        fit: BoxFit.cover,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.5,
                        width: double.maxFinite,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 20,
                        child: Stack(
                          children: [
                            if (_userData['image'] != null)
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    _userData['image']),
                              ),
                            IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () async {
                                  final pickedFile = await ImagePicker()
                                      .pickImage(
                                      source: ImageSource.gallery);
                                  if (pickedFile != null) {
                                    final bytes = await pickedFile
                                        .readAsBytes();
                                    final request = http.MultipartRequest(
                                      'PUT',
                                      Uri.parse(
                                          'http://localhost:9095/user/updateImage/${widget
                                              .userId}'),
                                    );
                                    request.files.add(
                                      http.MultipartFile.fromBytes(
                                        'image',
                                        bytes,
                                        filename: pickedFile.path
                                            .split('/')
                                            .last,
                                      ),
                                    );
                                    final response = await http.Response
                                        .fromStream(
                                        await request.send());
                                    if (response.statusCode == 200) {
                                      // handle success
                                      final responseData = json.decode(
                                          response.body);
                                      if (responseData['imageUrl'] != null) {
                                        setState(() {
                                          _userData['image'] =
                                          responseData['imageUrl'];
                                        });
                                      }
                                    } else {
                                      // handle error
                                      print("Erreur: ${response.statusCode}");
                                    }
                                  }
                                }
                            ),
                          ],
                        ),
                      ),


                      Positioned(
                        bottom: 20,
                        left: 140,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MouseRegion(
                              onEnter: (_) =>
                                  setState(() => isHoveringName = true),
                              onExit: (_) =>
                                  setState(() => isHoveringName = false),
                              child: GestureDetector(
                                onTap: () {
                                  // action à effectuer lors du clic sur l'icône d'édition


                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding: const EdgeInsets.all(40.0),
                                        child: AlertDialog(
                                          title: Center(
                                            child: Stack(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: <Widget>[
                                                // Stroked text as border.
                                                /*  Text(
                                          'Forget Password ?',
                                          style: TextStyle(
                                            fontSize: 40,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 6
                                              ..color =
                                                  Color.fromARGB(255, 239, 150, 150),
                                          ),
                                      ),*/
                                                // Solid text as fill.
                                                const Text(
                                                  'MODIFIER VOTRE PSEUDO',
                                                  style: TextStyle(
                                                    fontSize: 40,
                                                    color: Color.fromARGB(
                                                        255, 223, 91, 91),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          content: Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [

                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Pseudo',
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                TextField(
                                                  textAlign: TextAlign.start,
                                                  //Ajout de cette ligne pour centrer le texte
                                                  //controller: _emailCtrl,
                                                  decoration: InputDecoration(
                                                    hintText: 'dhia bouslimi',
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey
                                                            .shade600),
                                                    border: const OutlineInputBorder(
                                                        borderSide: BorderSide
                                                            .none,
                                                        borderRadius: BorderRadius
                                                            .all(
                                                            Radius.circular(12)
                                                        )
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.grey
                                                        .shade200,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),


                                          actions: [
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  20.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [

                                                  SizedBox(
                                                    width: 150,
                                                    child: ElevatedButton(
                                                      onPressed: () {

                                                      },
                                                      child: Text('CONFIRMER',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black),),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Color.fromARGB(
                                                            255, 194, 67,
                                                            67),
                                                        // couleur de fond du bouton
                                                        onPrimary: Colors
                                                            .white, // couleur du texte du bouton
                                                      ),
                                                      // Rest of the code
                                                    ),
                                                  ),

                                                  SizedBox(width: 20,),

                                                  SizedBox(
                                                    width: 150,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('CANCEL',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black),),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors
                                                            .grey[200],
                                                        // couleur de fond du bouton
                                                        onPrimary: Colors
                                                            .white, // couleur du texte du bouton
                                                      ),
                                                      // Rest of the code
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Row(
                                  children: [

                                    Text(
                                      _userData['userName'],
                                      style: TextStyle(
                                        color: isHoveringName
                                            ? Colors.grey
                                            : Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.edit,
                                      size: 18,
                                      color: isHoveringName
                                          ? Colors.black
                                          : Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 30),

                            MouseRegion(
                              onEnter: (_) =>
                                  setState(() => isHoveringParis = true),
                              onExit: (_) =>
                                  setState(() => isHoveringParis = false),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(

                                        title: Text(
                                            'Modifier votre emplacement'),
                                        content: TextField(
                                          controller: _cityController,
                                          decoration: InputDecoration(
                                            hintText: 'Entrez votre pays',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        actions: [
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                SizedBox(
                                                  width: 150,
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      final updatedCity = _cityController
                                                          .text.trim();
                                                      if (updatedCity
                                                          .isNotEmpty) {
                                                        // Send an HTTP request to update the user's job info
                                                        final updatedData = {
                                                          'city': updatedCity
                                                        };
                                                        _updateUserData(
                                                            updatedData);
                                                        // Close the dialog and update the UI
                                                        Navigator.of(context)
                                                            .pop();
                                                        setState(() {});
                                                      }
                                                    },
                                                    child: Text(
                                                      'CONFIRMER',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Color.fromARGB(
                                                          255, 194, 67, 67),
                                                      onPrimary: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                SizedBox(
                                                  width: 150,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'CANCEL',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.grey[200],
                                                      onPrimary: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Row(


                                  children: [
                                    Icon(Icons.work, color: Colors.black),
                                    SizedBox(width: 5),

                                    Text(
                                      _userData['city'],
                                      style: TextStyle(
                                        color: isHoveringParis
                                            ? Colors.grey
                                            : Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.edit,
                                      size: 18,
                                      color: isHoveringParis
                                          ? Colors.black
                                          : Colors.transparent,
                                    ),
                                  ],


                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            MouseRegion(
                              onEnter: (_) =>
                                  setState(() => isHoveringDevWeb = true),
                              onExit: (_) =>
                                  setState(() => isHoveringDevWeb = false),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(

                                        title: Text('Modifier le travail'),
                                        content: TextField(
                                          controller: _jobController,
                                          decoration: InputDecoration(
                                            hintText: 'Entrez votre travail',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        actions: [
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                SizedBox(
                                                  width: 150,
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      final updatedJob = _jobController
                                                          .text.trim();
                                                      if (updatedJob
                                                          .isNotEmpty) {
                                                        // Send an HTTP request to update the user's job info
                                                        final updatedData = {
                                                          'job': updatedJob
                                                        };
                                                        _updateUserData(
                                                            updatedData);
                                                        // Close the dialog and update the UI
                                                        Navigator.of(context)
                                                            .pop();
                                                        setState(() {});
                                                      }
                                                    },
                                                    child: Text(
                                                      'CONFIRMER',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Color.fromARGB(
                                                          255, 194, 67, 67),
                                                      onPrimary: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                SizedBox(
                                                  width: 150,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'CANCEL',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.grey[200],
                                                      onPrimary: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Row(


                                  children: [
                                    Icon(Icons.work, color: Colors.black),
                                    SizedBox(width: 5),

                                    Text(
                                      _userData['job'],
                                      style: TextStyle(
                                        color: isHoveringDevWeb
                                            ? Colors.grey
                                            : Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.edit,
                                      size: 18,
                                      color: isHoveringDevWeb
                                          ? Colors.black
                                          : Colors.transparent,
                                    ),
                                  ],


                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            MouseRegion(
                              onEnter: (_) =>
                                  setState(() => isHoveringEtudiant = true),
                              onExit: (_) =>
                                  setState(() => isHoveringEtudiant = false),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(

                                        title: Text(
                                            'Modifier votre university'),
                                        content: TextField(
                                          controller: _schoolController,
                                          decoration: InputDecoration(
                                            hintText: 'Entrez votre university',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        actions: [
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                SizedBox(
                                                  width: 150,
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      final updatedSchool = _schoolController
                                                          .text.trim();
                                                      if (updatedSchool
                                                          .isNotEmpty) {
                                                        // Send an HTTP request to update the user's job info
                                                        final updatedData = {
                                                          'school': updatedSchool
                                                        };
                                                        _updateUserData(
                                                            updatedData);
                                                        // Close the dialog and update the UI
                                                        Navigator.of(context)
                                                            .pop();
                                                        setState(() {});
                                                      }
                                                    },
                                                    child: Text(
                                                      'CONFIRMER',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Color.fromARGB(
                                                          255, 194, 67, 67),
                                                      onPrimary: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                SizedBox(
                                                  width: 150,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'CANCEL',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.grey[200],
                                                      onPrimary: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Row(


                                  children: [
                                    Icon(Icons.work, color: Colors.black),
                                    SizedBox(width: 5),

                                    Text(
                                      _userData['school'],
                                      style: TextStyle(
                                        color: isHoveringEtudiant
                                            ? Colors.grey
                                            : Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.edit,
                                      size: 18,
                                      color: isHoveringEtudiant
                                          ? Colors.black
                                          : Colors.transparent,
                                    ),
                                  ],


                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: 40,

                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14, vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.elliptical(5, 5),
                              bottomRight: Radius.zero,

                            ),
                          ),
                          child: Text(
                            'Ajouter une couverture',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60.0),

                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: double.infinity,

                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  elevation: 50,
                                  color: Color(0xff939ab0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/rectangle-9.png',),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("À propos de moi",
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              SizedBox(width: 10.0),
                                              Icon(Icons.edit,
                                                  color: Colors.white),
                                            ],
                                          ),
                                          SizedBox(height: 20.0),
                                          Text(
                                            "Présentez-vous à la communauté",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: CupertinoColors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),


                              ),

                              SizedBox(height: 20.0),

                              Container(
                                height: 100,
                                width: double.infinity,

                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  elevation: 50,
                                  color: Color(0xff939ab0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/rectangle-9.png',),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("CERTIFICATION",
                                                  style: TextStyle(
                                                      color: Colors.white)),

                                            ],
                                          ),
                                          SizedBox(height: 20.0),
                                          Text(
                                            "Présentez-vous à la communauté",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: CupertinoColors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),


                              ),


                              SizedBox(height: 20.0),
                              Container(
                                height: 100,
                                width: double.infinity,

                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  elevation: 50,
                                  color: Color(0xff939ab0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/rectangle-9.png',),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("COMPETANCE",
                                                  style: TextStyle(
                                                      color: Colors.white)),

                                            ],
                                          ),
                                          SizedBox(height: 20.0),
                                          Text(
                                            "Aucune compétence apprise pour le moment",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: CupertinoColors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),


                              ),
                              SizedBox(height: 20.0),

                              Container(
                                height: 600,
                                width: 700,
                                child: Card(
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(60.0)
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(
                                          0xFFFFE4E1), // Couleur à utiliser comme fond
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(40.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            'DÉCOUVREZ QUI PARMI VOS CONNAISSANCES EST DÉJÀ SUR CODINGAME',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(height: 20.0),
                                          Text(
                                            'Pour vous aider à retrouver et suivre vos connaissances, nous pouvons vous présenter vos contacts Facebook déjà enregistrés sur CodinGame.',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(height: 30.0),
                                          Divider(height: 20.0, thickness: 1.0),
                                          SizedBox(height: 10.0),

                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Cherchez par pseudo:',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Expanded(
                                                flex: 2,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    hintText: 'Entrez votre recherche',
                                                    border: OutlineInputBorder(),
                                                    suffixIcon: IconButton(
                                                      icon: Icon(Icons.search),
                                                      onPressed: () {
                                                        // Ajoutez ici le code à exécuter lorsque l'utilisateur appuie sur l'icône de recherche
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 30.0),
                                          Divider(height: 20.0, thickness: 1.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 220,
                                width: double.infinity,
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[
                                        Text(
                                          'Informations',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.star),
                                            SizedBox(width: 8),
                                            Text('Niveau : '),
                                            Text(
                                              '12',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.code),
                                            SizedBox(width: 8),
                                            Text('Compétences : '),
                                            Text(
                                              'Java, Python, C++',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.emoji_events),
                                            SizedBox(width: 8),
                                            Text('Réalisations : '),
                                            Text(
                                              '10',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  Container(
                                    height: 200.0,
                                    width: 250.0,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          color: Colors.blue, width: 5.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Progression',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(height: 10.0),
                                          Text(
                                            '20%',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          SizedBox(height: 20.0),
                                          Container(
                                            height: 40.0,
                                            width: 40.0,
                                            child: CircularProgressIndicator(
                                              value: 0.2,
                                              strokeWidth: 15.0,
                                              backgroundColor: Colors
                                                  .redAccent[200],
                                              valueColor: AlwaysStoppedAnimation<
                                                  Color>(Colors.blue),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 200.0,
                                    width: 480.0,
                                    child: Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: <Widget>[
                                            Text(
                                              'Progression',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    'Java : ',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: LinearProgressIndicator(
                                                    value: 0.7,
                                                    backgroundColor: Colors
                                                        .grey[300],
                                                    valueColor: AlwaysStoppedAnimation<
                                                        Color>(Colors.blue),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    '70%',
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    'Python : ',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: LinearProgressIndicator(
                                                    value: 0.5,
                                                    backgroundColor: Colors
                                                        .grey[300],
                                                    valueColor: AlwaysStoppedAnimation<
                                                        Color>(Colors.green),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    '50%',
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    'Kotlin : ',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: LinearProgressIndicator(
                                                    value: 0.5,
                                                    backgroundColor: Colors
                                                        .grey[300],
                                                    valueColor: AlwaysStoppedAnimation<
                                                        Color>(Colors.green),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    '50%',
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    'Swift : ',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: LinearProgressIndicator(
                                                    value: 0.5,
                                                    backgroundColor: Colors
                                                        .grey[300],
                                                    valueColor: AlwaysStoppedAnimation<
                                                        Color>(Colors.green),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    '50%',
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),


                ],


              ),
            ),
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