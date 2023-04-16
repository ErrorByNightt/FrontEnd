// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:path/path.dart';
import 'package:project_coding_game/Components/OverlayCard.dart';
import 'package:project_coding_game/Games/game_home.dart';
import 'package:project_coding_game/Screens/Blog/addBlog.dart';
import 'package:project_coding_game/Screens/courses.dart';
import 'package:project_coding_game/Screens/profile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:project_coding_game/NetworkHandler.dart';

class Blog extends StatefulWidget {
  Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  static Future<http.Response> addBlog(String title, String body) async {
    Uri BlogURI = Uri.parse("http://localhost:5000/blog/add");
    final data = {"title": title, "body": body};
    String params = jsonEncode(data);
    http.Response response =
        await http.post(BlogURI, body: params, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    return response;
  }

  late String title;

  //late String coverImage;

  late String body;

  final _key1 = GlobalKey<FormState>();
  final _key2 = GlobalKey<FormState>();

  TextEditingController _title = TextEditingController();
  //TextEditingController _imagee = TextEditingController();

  TextEditingController _body = TextEditingController();
  //ImagePicker _picker = ImagePicker();
  //late PickedFile _imageFile;
  IconData iconphoto = Icons.image;
  late Uint8List imagevalue;
  NetworkHandler networkHandler = NetworkHandler();

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
            child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 40, 0, 0),
                  child: Text(
                    'Ask a Public Question !',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 50.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Be specific and imagine you’re asking a question to another person.',
                    style: TextStyle(
                      //fontFamily: 'Inika',
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 207, 198, 198),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Form(
                  key: _key1,
                  child: SizedBox(
                      // <-- SEE HERE
                      width: 700,
                      child: TextFormField(
                        controller: _title,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Title can't be empty";
                          } else if (value.length > 100) {
                            return "Title length should be <=100";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 120, 46, 240)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 66, 125, 145)),
                            ),
                            labelText:
                                "Add Image and Type catching attention title",
                            labelStyle: TextStyle(color: Colors.grey.shade600),
                            prefix: IconButton(
                              icon: Icon(iconphoto, color: Colors.teal),
                              onPressed: uploadImage,
                            )),
                        maxLength: 100,
                      )),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'What are the details of your problem?',
                    style: TextStyle(
                      //fontFamily: 'Inika',
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 207, 198, 198),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Form(
                  key: _key2,
                  child: SizedBox(
                      // <-- SEE HERE
                      width: 700,
                      child: TextFormField(
                        controller: _body,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "body can't be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          // focusColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 65, 46, 240)),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 40),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 66, 125, 145)),
                          ),
                          labelText: " Introduce the problem",
                          labelStyle: TextStyle(color: Colors.grey.shade600),
                        ),
                        maxLines: null,
                      )),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    final response = await addBlog(_title.text, _body.text);

                    Map<String, dynamic> body = jsonDecode(response.body);
                    if (response.statusCode == 200 ||
                        response.statusCode == 201) {
                      Navigator.pushAndRemoveUntil(
                          context as BuildContext,
                          MaterialPageRoute(builder: (context) => AddBlog()),
                          (route) => false);
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(300, 50)),
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 239, 150, 150)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  child: const Text(
                    'POST',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 3),
                  ),
                ),
                Container(
                  child: TextButton(
                    child: Text(
                      "Preview",
                      style: TextStyle(
                          fontSize: 10, color: Colors.blue, letterSpacing: 2),
                    ),
                    onPressed: () {
                      if (Image.memory(imagevalue).image != null &&
                          _key1.currentState!.validate()) {
                        showModalBottomSheet(
                            context: context,
                            builder: ((builder) => OverlayCard(
                                imagevalue: imagevalue, title: _title.text)));
                      }
                    },
                  ),
                )
              ],
            ),
          ]),
        ])),
      ),
    );
  }

  /* void takeCoverPhoto() async {
    ImagePicker imagePicker = ImagePicker();
    final imageFile = await imagePicker.getImage(source: ImageSource.camera);
//    final coverPhoto = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = imageFile!;
      iconphoto = Icons.check_box;
    });
  }*/

  uploadImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'svg', 'jpeg']);

    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        imagevalue = file.bytes!;
      });
    } else {
      // User canceled the picker
    }
  }
}
