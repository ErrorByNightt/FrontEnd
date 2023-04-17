import 'dart:convert';

//import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:floating_chat_button/ChatBot.dart';
import 'package:floating_chat_button/soketMessages.dart';
import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:material_buttonx/materialButtonX.dart';
import 'package:uuid/uuid.dart';
import 'constants.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: ChatPage(),
      );
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Row(
          children: [
            Container(
              child: Text("hhhhhhhhh"),
            ),
            Column(
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _showChatPopup(context);
                    },
                    child: Image.asset('assets/images/robot.png'),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingDraggableWidget(
          floatingWidget: FloatingActionButton(
            onPressed: () {
              _showChatPopup(context);
            },
            child: Image.asset('assets/images/robot.png'),
          ),
          floatingWidgetHeight: 50,
          floatingWidgetWidth: 50,
          dx: 100,
          dy: 200,
          deleteWidgetDecoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white12, Colors.grey],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [.0, 1],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          deleteWidget: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: Colors.black87),
            ),
            child: const Icon(Icons.close, color: Colors.black87),
          ),
          onDeleteWidget: () {
            debugPrint('Widget deleted');
          },
          mainScreenWidget: Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 300,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: FloatingActionButton(
                        onPressed: () {
                          _showChatPopupConversation(context);
                        },
                        child: Image.asset('assets/images/robot.png'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            appBar: AppBar(
              title: const Text('Floating Animated Widget'),
            ),
          ),
        ),
      );
}
