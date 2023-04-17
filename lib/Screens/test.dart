/*
import 'package:audioplayers/audioplayers.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project_coding_game/Games/Entrainement.dart';
import 'package:project_coding_game/Screens/profile.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/python.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/darcula.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class coding extends StatefulWidget {


  coding({super.key});

  @override
  State<coding> createState() => _codingState();
}

class _codingState extends State<coding> {

  static Future<http.Response> ExecuteCode(String Code) async {
    Uri LoginURI = Uri.parse("https://api.jdoodle.com/v1/execute");
    final data = { "clientId": "26a0fa26959b444c769e829e62bb4b10", "clientSecret": "cde26308ed67991743c4fefedc06867df45eae3a5aa7fe41d6edad57b4acd824", "script": Code, "stdin": "StdIn", "language": "python", "versionIndex": 4, "compileOnly": "false" };
    String params = jsonEncode(data);
    http.Response response =
    await http.post(LoginURI, body: params, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    return response;
  }

  late Future<Code> object;
  @override
  void initState() {
    super.initState();
    object = GetCode();
  }
  Future<Code> GetCode() async {
    Uri getCodeURI = Uri.parse("http://localhost:9095/code/testCode");
    http.Response response = await http.get(
      getCodeURI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if(response.statusCode == 201) {
      var decoded = json.decode(response.body);

      Code object = Code(
        //decoded[0]['_id'],
          decoded['problem'],
          decoded['solution'],
          decoded['output']
      );

      return object;
    } return
      Code(
        //decoded[0]['_id'],
          'problem','solution','outuputzposfdqpfj,'
      );
  }


  @override
  Widget build(BuildContext context) {
    CodeController? _codeController;
    CodeController? _input;
    CodeController? _output;
    Map<String, TextStyle>? theme = monokaiSublimeTheme;
    final source = "void main() {\n    print(\"Hello, world!\");}\n\n\n\n\n\n\n\n";
    final inn = "your input\n\n\n\n\n\n\n\n\n";
    final out = "the output of\n your code.\n\n\n\n\n\n\n\n";

    // Instantiate the CodeController
    _codeController = CodeController(

      text: source,
      language: python,
    );
    _input = CodeController(
      text: inn,
      language: python,
    );
    _output=CodeController(
      text: out,
      language: python,
    );
    return FutureBuilder<Code>(
      future: object,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          final code = snapshot.data!;
          final problem = code.problem;
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
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
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
                                  MaterialStateProperty.all(Colors.transparent) ,
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
                          ]),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 950, 10),
                        child: Text(
                          'Python Basics',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Inika',
                            fontSize: 40.0,
                            letterSpacing: 5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),

                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 60),
                          Container(

                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 121, 34, 30),
                                // Set border color
                                borderRadius: BorderRadius.all(
                                    Radius.circular(3.0)), // Set rounded corner radius
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.transparent,
                                      offset: Offset(1, 3))
                                ] // Make rounded corner of border
                            ),
                            child: Column(
                              children:<Widget> [
                                // ignore: prefer_const_constructors
                                Text(
                                  ' \n ▫️Start Coding: ▫️ \n',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Inika',
                                    fontSize: 35.0,
                                    letterSpacing: 5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
                                  ),
                                ),

                                Container(
                                    width: 800,
                                    child:Text( problem,
                                      style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 25.0,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    ))

                              ],
                            ), ),
                        ],  ),

                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 20),
                            Container(
                              width: 868,
                              height: 40,
                              child: Text('  Solution',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 35.0,
                                  letterSpacing: 5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    alignment: Alignment.centerRight,
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.transparent),
                                    shadowColor: MaterialStateProperty.all(
                                        Color.fromARGB(19, 238, 155, 155)),
                                  ),
                                  onPressed: () async {
                                    final response = await ExecuteCode(
                                        _codeController!.text);
                                    print(_codeController!.text);
                                    Map<String, dynamic> body = jsonDecode(response.body);
                                    print(response.statusCode);
                                    switch (response.statusCode) {
                                      case 200:
                                        {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                AlertDialog(
                                                  title: const Text('Success'),
                                                  content:
                                                  Text('Output: ' + body['output']),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text('OK'),
                                                    ),
                                                  ],
                                                ),
                                          );
                                        }
                                        break;
                                      case 403:
                                        {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                AlertDialog(
                                                  title: const Text('Error'),
                                                  content: Text('403'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text('OK'),
                                                    ),
                                                  ],
                                                ),
                                          );
                                        }
                                        break;
                                      default:
                                        {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                AlertDialog(
                                                  title: const Text('Error'),
                                                  content: Text('Server Error'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text('OK'),
                                                    ),
                                                  ],
                                                ),
                                          );
                                        }
                                        break;
                                    }

                                  },
                                  child: Icon(
                                      Feather.play)
                              ),
                            ),
                            Container(
                              width: 250,
                              child: Text('  Input',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 28.0,
                                  letterSpacing: 5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              child: Text('  Output',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Inika',
                                  fontSize: 28.0,
                                  letterSpacing: 5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                          ]),
                      Row(
                        children:<Widget> [
                          Container(
                            width: 900,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 121, 34, 30),
                                // Set border color
                                borderRadius: BorderRadius.all(
                                    Radius.circular(3.0)), // Set rounded corner radius
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.transparent,
                                      offset: Offset(1, 3))
                                ] // Make rounded corner of border
                            ),
                            child: CodeField(
                              controller: _codeController!,
                              textStyle: TextStyle(fontFamily: 'SourceCode', fontSize: 20),
                            ),
                          ),
                          Container(
                            width: 250,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 121, 34, 30),
                                // Set border color
                                borderRadius: BorderRadius.all(
                                    Radius.circular(1.0)), // Set rounded corner radius
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.transparent,
                                      offset: Offset(1, 3))
                                ] // Make rounded corner of border
                            ),
                            child: CodeField(
                              controller: _input!,
                              textStyle: TextStyle(fontFamily: 'SourceCode', fontSize: 20),
                            ),
                          ),
                          Container(
                            width: 250,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 121, 34, 30),
                                // Set border color
                                borderRadius: BorderRadius.all(
                                    Radius.circular(3.0)), // Set rounded corner radius
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.transparent,
                                      offset: Offset(1, 3))
                                ] // Make rounded corner of border
                            ),
                            child: CodeField(
                              controller: _output!,
                              textStyle: TextStyle(fontFamily: 'SourceCode', fontSize: 20),
                            ),
                          ),

                        ],
                      ),



                    ],
                  ),
                ),
              ));
        }
        else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        else {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          );

        }
      },

    );

  }
}


class Code {
  //final String id;
  final String problem;
  final String solution;
  final String output;

  Code(this.problem, this.solution, this.output);
}*/
