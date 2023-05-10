// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project_coding_game/Courses/pdf.dart';
import 'package:project_coding_game/Games/Entrainement.dart';
import 'package:project_coding_game/Games/game_home.dart';
import 'package:project_coding_game/Screens/AI.dart';
import 'package:project_coding_game/Screens/AccueilPage.dart';
import 'package:project_coding_game/Screens/courses.dart';
import 'package:project_coding_game/Screens/footer.dart';
import 'package:project_coding_game/Screens/profile.dart';
import 'package:project_coding_game/Screens/reader_screen.dart';
import 'package:project_coding_game/models/SearchBar.dart';
import '../ChatBot.dart';
import '../chat_screen.dart';
import '../model/Chat_screen.dart';
import '../models/document_model.dart';
import '../soketMessages.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  void _showChatPopupConversation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: 480.0, // Hauteur de la boîte de dialogue
            width: 320.0, // Largeur de la boîte de dialogue
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return SoketMessages(
                  // Taille de police pour le widget de chat
                  );
            }),
          ),
        );
      },
    );
  }

  void _showChatPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return ChatBot();
          }),
        );
      },
    );
  }

  int tabSelected = 3;
  List<ChatModel> chats = <ChatModel>[];

  @override
  void initState() {
    // TODO: implement initState
    /// Filling up some data ///

    //1
    ChatModel chatModel = new ChatModel();
    chatModel.setUserName("Sanskar");
    chatModel.setUserPicAssetPath("assets/images/chat_screen/profilepic.jpg");
    chatModel.setLastMessage("This is strange i can send message to myself");
    chatModel.setTime("2 hours");
    chatModel.setUnreadMessage(4);
    chatModel.setLastMessageSendByMe(false);
    chats.add(chatModel);

    //2
    ChatModel chatModel2 = new ChatModel();
    chatModel2.setUserName("Jessica");
    chatModel2.setUserPicAssetPath("assets/images/chat_screen/profilepic2.png");
    chatModel2.setLastMessage("Hahaha, yeah!");
    chatModel2.setTime("22 min");
    chatModel2.setUnreadMessage(0);
    chatModel2.setLastMessageSendByMe(true);
    chats.add(chatModel2);

    //3
    ChatModel chatModel3 = new ChatModel();
    chatModel3.setUserName("Adrianne");
    chatModel3.setUserPicAssetPath("assets/images/chat_screen/profilepic3.png");
    chatModel3.setLastMessage("Let's catch up sometime sanskar");
    chatModel3.setTime("2 min");
    chatModel3.setUnreadMessage(0);
    chatModel3.setLastMessageSendByMe(false);
    chats.add(chatModel3);

    //4
    ChatModel chatModel4 = new ChatModel();
    chatModel4.setUserName("Marlene");
    chatModel4.setUserPicAssetPath("assets/images/chat_screen/profilepic4.png");
    chatModel4.setLastMessage("Hey Sanskar how are you?");
    chatModel4.setTime("22 min");
    chatModel4.setUnreadMessage(0);
    chatModel4.setLastMessageSendByMe(false);
    chats.add(chatModel4);

    //5
    ChatModel chatModel5 = new ChatModel();
    chatModel5.setUserName("Samanta");
    chatModel5.setUserPicAssetPath("assets/images/chat_screen/profilepic5.png");
    chatModel5.setLastMessage("That's awesome sanskar");
    chatModel5.setTime("15 minutes");
    chatModel5.setUnreadMessage(0);
    chatModel5.setLastMessageSendByMe(false);
    chats.add(chatModel5);

    print(chats.toString() + "this is the data we are saving");
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatScreen()));
                  },
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Icon(Feather.award, size: 20),
                      SizedBox(width: 5),
                      // ignore: prefer_const_constructors
                      Text(
                        'Chat',
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
                        radius: 25,
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 400, right: 400),
                  child: Flexible(
                    flex: 1,
                    child: TextField(
                      cursorColor: Color.fromARGB(255, 255, 255, 255),
                      decoration: InputDecoration(
                          fillColor: Color.fromARGB(163, 252, 246, 246),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none),
                          hintText: 'Search Something..',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 8, 8, 8),
                              fontSize: 15,
                              letterSpacing: 2),
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(15),
                            // ignore: prefer_const_constructors, sort_child_properties_last
                            child: Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 0, 0, 0),
                              size: 15,
                            ),
                            width: 18,
                          )),
                      onTap: () {
                        showSearch(
                          context: context,
                          delegate: MySearchDelegate(),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    'assets/images/Group 9106.png',
                    height: 200,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.all(10),
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
                    '▫️ Courses ▫️',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 30.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PdfBook()));
                        }),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          width: 250,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(99, 64, 195, 255),
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Color.fromARGB(66, 222, 211, 211)
                              ],
                            ),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://blog.dyma.fr/content/images/2022/02/python1200x628.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        width: 250,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(99, 64, 195, 255),
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Color.fromARGB(66, 222, 211, 211)
                            ],
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUHrOwyRvPEzqFVAhZQZ5sSqbGYI8lrAtawE2fJHDwIVm8LM9KEGXChiZNFT3q0T8KV6Y&usqp=CAU'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        width: 250,
                        height: 150,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(99, 64, 195, 255),
                          borderRadius: BorderRadius.circular(20),
                          // ignore: prefer_const_constructors
                          gradient: LinearGradient(
                            // ignore: prefer_const_literals_to_create_immutables
                            colors: [
                              Colors.white,
                              Color.fromARGB(66, 222, 211, 211)
                            ],
                          ),

                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDfS08paYD_Vp3jULBoIe4a3uRMGNRcGRnL0uz1HgGQZEXtmpxsntZZ4w7jnogz1uVC1M&usqp=CAU'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  child: const Text(
                    'What can I use CodeNinja for?',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 50.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  child: const Text(
                    'From beginner to expert and beyond...',
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 172, 165, 165),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Column(
                      children: [
                        Container(
                          child: Center(
                            child: const Text(
                              '🥷 CHALLENGE 🥷',
                              style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 28.0,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 14, 174, 60),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(50),
                          child: const Text(
                            'Challenge your friends, colleagues or AI to \n'
                            'programming games and show them who"s boss! 🥇',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 172, 165, 165),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: Center(
                            child: const Text(
                              '🥷 RANK 🥷',
                              style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 28.0,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 14, 174, 60),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(30),
                          child: const Text(
                            'Reach the top of the rankings \n'
                            'Improve your level in different languages. 🥇',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 172, 165, 165),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: Center(
                            child: const Text(
                              '🥷 LEARNING 🥷',
                              style: TextStyle(
                                fontFamily: 'Inika',
                                fontSize: 28.0,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 14, 174, 60),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(30),
                          child: const Text(
                            ' Challenge yourself in a language you are comfortable \n'
                            ' with and then in a language you want to improve..🥇\n',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 172, 165, 165),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                    '▫️ Support Language ▫️',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/c++.png',
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      child: Image.asset(
                        'assets/images/javaScript.png',
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      child: Image.asset(
                        'assets/images/swift.png',
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      child: Image.asset(
                        'assets/images/c#.png',
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      child: Image.asset(
                        'assets/images/dart.png',
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      child: Image.asset(
                        'assets/images/python.png',
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      child: Image.asset(
                        'assets/images/java.png',
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      child: Image.asset(
                        'assets/images/html.png',
                        height: 80,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  margin: const EdgeInsets.all(10),
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
                    '▫️ Our Team ▫️',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(99, 64, 195, 255),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Color.fromARGB(66, 222, 211, 211)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(99, 64, 195, 255),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Color.fromARGB(66, 222, 211, 211)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(99, 64, 195, 255),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Color.fromARGB(66, 222, 211, 211)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(99, 64, 195, 255),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Color.fromARGB(66, 222, 211, 211)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(99, 64, 195, 255),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Color.fromARGB(66, 222, 211, 211)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.all(10),
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
                    '▫️ Artificial Intelligence ▫️',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 30.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/images/roobot.png'),
                            Spacer(
                              flex: 2,
                            ),
                            SizedBox(height: 60),
                            Column(
                              children: <Widget>[
                                Container(
                                    width: 550,
                                    child: const Text(
                                      'What is Artificial Intelligence? \n'
                                      '\n Artificial intelligence (AI), the ability of a digital computer or computer-controlled robot to perform tasks commonly associated with intelligent beings. \n The term is frequently applied to the project of developing systems endowed with the intellectual processes characteristic of humans, such as the ability to reason, discover meaning, generalize, or learn from past experience.',
                                      style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 15.0,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    )),
                                TextButton(
                                    onPressed: (() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AI()),
                                      );
                                    }),
                                    child: const Text(
                                      'Explore Now',
                                      style: TextStyle(
                                          fontFamily: 'Inika',
                                          fontSize: 25.0,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.bold,
                                          backgroundColor:
                                              Color.fromRGBO(149, 197, 244, 1),
                                          color: Colors.black),
                                    ))
                              ],
                            )
                          ])
                    ]),
              ]),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: 600,
                    height: 600,
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            /* SizedBox(
                height: 90,
              ),*/

                            /// Tab Options ///
                            /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: tabSelected == 1
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  gradient: LinearGradient(
                                      colors: [
                                        const Color(0xffA2834D),
                                        const Color(0xffBC9A5F)
                                      ],
                                      begin: FractionalOffset.topRight,
                                      end: FractionalOffset.bottomLeft))
                              : BoxDecoration(),
                          child: Image.asset(
                            "assets/images/profile.png",
                            width: 35,
                            height: 35,
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Chat",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: tabSelected == 1
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                gradient: LinearGradient(
                                    colors: [
                                      const Color(0xffA2834D),
                                      const Color(0xffBC9A5F)
                                    ],
                                    begin: FractionalOffset.topRight,
                                    end: FractionalOffset.bottomLeft))
                            : BoxDecoration(),
                        child: Image.asset(
                          "assets/images/tindergoldlogo.png",
                          width: 35,
                          height: 35,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Pairs",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              gradient: LinearGradient(
                                  colors: [
                                    const Color(0xffA2834D),
                                    const Color(0xffBC9A5F)
                                  ],
                                  begin: FractionalOffset.topRight,
                                  end: FractionalOffset.bottomLeft)),
                          child: Image.asset(
                            "assets/images/chatbubble.png",
                            width: 30,
                            height: 30,
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Activities",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),*/
                            SizedBox(
                              height: 16,
                            ),

                            Expanded(
                              flex: 1,
                              child: LayoutBuilder(builder:
                                  (BuildContext context,
                                      BoxConstraints viewportConstraints) {
                                return SingleChildScrollView(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minHeight: viewportConstraints.maxHeight,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 0.2,
                                            color: Colors.white70,
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemCount: chats.length,
                                              itemBuilder: (context, index) {
                                                return ChatTile(
                                                  myWidth: MediaQuery.of(context).size.width,
                                                  userName: chats[index]
                                                          .getUserName() ??
                                                      '',
                                                  userPicAssetPath: chats[index]
                                                          .getUserPicAssetPath() ??
                                                      '',
                                                  lastMessage: chats[index]
                                                          .getLastMessage() ??
                                                      '',
                                                  time: chats[index].getTme() ??
                                                      '',
                                                  unreadMessages: chats[index]
                                                          .getUnreadMessages() ??
                                                      0,
                                                  lastMessageSendByMe: chats[
                                                              index]
                                                          .getlastMessageSendByMe() ??
                                                      false,
                                                );
                                              })
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        GestureDetector(
                          onTap: () {
                            _showChatPopup(context);
                          },
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(
                              'assets/images/chatGptBot.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),

        // floatingActionButton: FloatingDraggableWidget(
        //   floatingWidget: FloatingActionButton(
        //     onPressed: () {
        //       _showChatPopup(context);
        //     },
        //     child: Image.asset('assets/images/robot.png'),
        //   ),
        //   floatingWidgetHeight: 50,
        //   floatingWidgetWidth: 50,
        //   dx: 100,
        //   dy: 200,
        //   deleteWidgetDecoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [Colors.white12, Colors.grey],
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //       stops: [.0, 1],
        //     ),
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(30),
        //       topRight: Radius.circular(30),
        //     ),
        //   ),
        //   deleteWidget: Container(
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       border: Border.all(width: 2, color: Colors.black87),
        //     ),
        //     child: const Icon(Icons.close, color: Colors.black87),
        //   ),
        //   onDeleteWidget: () {
        //     debugPrint('Widget deleted');
        //   },
        //   mainScreenWidget: Scaffold(
        //     body: Column(
        //       children: [
        //         SizedBox(
        //           height: 100,
        //         ),
        //         Row(
        //           children: [
        //             SizedBox(
        //               width: 300,
        //             ),
        //             Container(
        //               width: 50,
        //               height: 50,
        //               child: FloatingActionButton(
        //                 onPressed: () {
        //                   _showChatPopupConversation(context);
        //                 },
        //                 child: Image.asset('assets/images/robot.png'),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //     appBar: AppBar(
        //       title: const Text('Floating Animated Widget'),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
