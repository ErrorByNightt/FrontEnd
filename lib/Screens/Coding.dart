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
  final String? userId;
  final Map<String, dynamic>? userData;
  const coding({
    Key? key,
    required this.userId,
    this.userData,
  })  : assert(userId != null, 'userId must not be null'),
        super(key: key);

  @override
  State<coding> createState() => _codingState();
}

class _codingState extends State<coding> {
  final _controller = TextEditingController();

  late Map<String, dynamic> _userData = {};

  void _fetchUserData() async {
    final userId = widget.userId;

    final response =
    await http.get(Uri.parse('http://localhost:9095/user/$userId'));
    final responseData = json.decode(response.body);

    if (responseData['user'] == null) {
      return;
    }

    setState(() {
      _userData = responseData['user'];
    });
  }

  String FormatString(String code) {
    String originalString = code;

    StringBuffer formattedString = StringBuffer();

    int indentLevel = 0;
    bool isNewLine = true;

    for (int i = 0; i < originalString.length; i++) {
      String char = originalString[i];

      if (char == ' ') {
        if (isNewLine) {
          indentLevel++;
        } else {
          formattedString.write(char);
        }
      } else if (char == ':') {
        formattedString.write(char);
        formattedString.write('\n');
        isNewLine = true;
      } else if (char == '\n') {
        isNewLine = true;
      } else {
        if (isNewLine) {
          for (int j = 0; j < indentLevel; j++) {
            formattedString.write('  ');
          }
          isNewLine = false;
        }
        formattedString.write(char);
      }
    }
    return formattedString.toString();
  }

  Future<http.Response?> CompileCode(String code) async {
    Uri CompileCodeURI = Uri.parse("http://localhost:9095/compile/CompileCode");
    String singleLineString = code.replaceAll('\n', '\\n');
    final data = {"code": singleLineString};
    String params = jsonEncode(data);
    http.Response response =
    await http.post(CompileCodeURI, body: params, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 200) {
      return response;
    } else {
      print(response.statusCode);
    }

    return null;
  }

  late Future<Code> object;
  @override
  void initState() {
    super.initState();
    object = GetCode();
    _controller.text = 'Your output';
  }

  Future<Code> GetCode() async {
    Uri getCodeURI = Uri.parse("http://localhost:9095/code/testCode");
    http.Response response = await http.get(
      getCodeURI,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 201) {
      var decoded = json.decode(response.body);

      Code object = Code(
        //decoded[0]['_id'],
          decoded['problem'],
          decoded['solution'],
          decoded['output']);
      print(object.solution);
      return object;
    }
    return Code(
      //decoded[0]['_id'],
        'problem',
        'solution',
        'outuput');
  }

  @override
  Widget build(BuildContext context) {
    CodeController? _codeController;
    CodeController? _input;
    CodeController? _output;
    Map<String, TextStyle>? theme = monokaiSublimeTheme;
    final source = "print(\"ok\")\n";
    final inn = "your input";
    final out = "the output of\n your code.\n\n\n\n\n\n\n\n";

    // Instantiate the CodeController
    _codeController = CodeController(
      language: python,
    );
    _input = CodeController(
      text: inn,
      language: python,
    );
    _output = CodeController(
      text: out,
      language: python,
    );
    return FutureBuilder<Code>(
      future: object,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
                              padding:
                              const EdgeInsets.symmetric(horizontal: 15),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
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
                                      style: const TextStyle(
                                          fontSize: 12, letterSpacing: 1),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 15),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
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
                                      style: const TextStyle(
                                          fontSize: 12, letterSpacing: 1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 15),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
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
                                      style: const TextStyle(
                                          fontSize: 12, letterSpacing: 1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 15),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
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
                                    Icon(Icons.my_library_books_outlined,
                                        size: 20),
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
                              padding:
                              const EdgeInsets.symmetric(horizontal: 15),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
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
                                      style: const TextStyle(
                                          fontSize: 12, letterSpacing: 1),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 15),
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
                                          color: Color.fromARGB(
                                              255, 143, 139, 139)),
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
                                    position: const RelativeRect.fromLTRB(
                                        70.0, 70.0, 10.0, 0.0),
                                    color: Color.fromARGB(115, 133, 112, 112),
                                    items: <PopupMenuEntry>[
                                      PopupMenuItem(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfilePage(userId: '',)),
                                            );
                                          },
                                          child: Text('Profil',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      PopupMenuItem(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfilePage(userId: '',)),
                                            );
                                          },
                                          child: Text('Amis',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      PopupMenuItem(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfilePage(userId: '',)),
                                            );
                                          },
                                          child: Text('Paramètres',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      PopupMenuItem(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfilePage(userId: '',)),
                                            );
                                          },
                                          child: Text('Déconnexion',
                                              style: TextStyle(
                                                  color: Colors.white)),
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
                                color: Colors.transparent,
                                // Set border color
                                borderRadius: BorderRadius.all(Radius.circular(
                                    3.0)), // Set rounded corner radius
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.transparent,
                                      offset: Offset(1, 3))
                                ] // Make rounded corner of border
                            ),
                            child: Column(
                              children: <Widget>[
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
                                    child: Text(
                                      problem,
                                      style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 25.0,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 20),
                            Container(
                              width: 868,
                              height: 40,
                              child: Text(
                                '  Solution',
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
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    shadowColor: MaterialStateProperty.all(
                                        Color.fromARGB(19, 238, 155, 155)),
                                  ),
                                  onPressed: () async {
                                    //("testing jdoodle api");
                                    final response = await CompileCode(
                                        _codeController!.text);
                                    Map<String, dynamic> body =
                                    jsonDecode(response!.body);
                                    switch (response?.statusCode) {
                                      case 200:
                                        {
                                          setState(() {
                                            _controller.text =
                                            body['data']['output'];
                                            _codeController?.text =
                                                _codeController!.text;
                                          });
                                          if ("Output : " +
                                              body['data']['output'] ==
                                              code.output + "\n") {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: const Text('Good Job!',
                                                  style: TextStyle(
                                                    fontFamily: 'Inika',
                                                    letterSpacing: 3,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 30,
                                                    color: Color(0xff951208),
                                                  ),
                                                ),
                                                content: Text(
                                                  'You are correct!',
                                                  style: TextStyle(
                                                    fontFamily: 'Inika',
                                                    letterSpacing: 3,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Next',
                                                      style: TextStyle(
                                                        fontFamily: 'Inika',
                                                        letterSpacing: 3,
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        }
                                        break;
                                      case 403:
                                        {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: const Text('Error',
                                                style: TextStyle(
                                                  fontFamily: 'Inika',
                                                  letterSpacing: 3,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 30,
                                                  color: Color(0xff951208),
                                                ),
                                              ),
                                              content: Text('403',
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('OK',
                                                    style: TextStyle(
                                                      fontFamily: 'Inika',
                                                      letterSpacing: 3,
                                                      fontWeight: FontWeight.w300,
                                                      fontSize: 25,
                                                      color: Colors.black,
                                                    ),
                                                  ),
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
                                            builder: (context) => AlertDialog(
                                              title: const Text('Error',
                                                style: TextStyle(
                                                  fontFamily: 'Inika',
                                                  letterSpacing: 3,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 40,
                                                  color: Color(0xff951208),
                                                ),
                                              ),
                                              content: Text('Server Error',
                                                style: TextStyle(
                                                  fontFamily: 'Inika',
                                                  letterSpacing: 3,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 30,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('OK',
                                                    style: TextStyle(
                                                      fontFamily: 'Inika',
                                                      letterSpacing: 3,
                                                      fontWeight: FontWeight.w300,
                                                      fontSize: 25,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                        break;
                                    }
                                  },
                                  child: Icon(Feather.play)),
                            ),
                            Container(
                              width: 250,
                              child: Text(
                                '  Input',
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
                              child: Text(
                                '  Output',
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
                        children: <Widget>[
                          Container(
                            width: 900,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 121, 34, 30),
                                // Set border color
                                borderRadius: BorderRadius.all(Radius.circular(
                                    3.0)), // Set rounded corner radius
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.transparent,
                                      offset: Offset(1, 3))
                                ] // Make rounded corner of border
                            ),
                            child: CodeField(
                              controller: _codeController!,
                              textStyle: TextStyle(
                                  fontFamily: 'SourceCode', fontSize: 20),
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
                                borderRadius: BorderRadius.all(Radius.circular(
                                    1.0)), // Set rounded corner radius
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.transparent,
                                      offset: Offset(1, 3))
                                ] // Make rounded corner of border
                            ),
                            child: CodeField(
                              controller: _input!,
                              textStyle: TextStyle(
                                  fontFamily: 'SourceCode', fontSize: 20),
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
                                borderRadius: BorderRadius.all(Radius.circular(
                                    3.0)), // Set rounded corner radius
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.transparent,
                                      offset: Offset(1, 3))
                                ] // Make rounded corner of border
                            ),
                            child: TextFormField(
                              controller: _controller,
                              //textStyle: TextStyle(fontFamily: 'SourceCode', fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
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
}
