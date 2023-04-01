// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_coding_game/Components/Custom_button.dart';
import 'package:project_coding_game/Components/Custom_textfield.dart';
import 'package:project_coding_game/Components/text.dart';
import 'package:project_coding_game/resources/socket_methods.dart';
import 'package:project_coding_game/responsive/responsive.dart';

class CreateRoom extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(215, 0, 0, 0),
      body: Responsive(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                    shadows: [Shadow(blurRadius: 40, color: Colors.blue)],
                    text: 'Create Room',
                    fontSize: 70),
                SizedBox(height: size.height * 0.08),
                CustomTextField(
                    controller: _nameController,
                    hintText: 'Enter your nickname'),
                SizedBox(height: size.height * 0.08),
                CustomButton(
                    onTap: () =>
                        _socketMethods.createRoom(_nameController.text),
                    text: 'Create')
              ]),
        ),
      ),
    );
  }
}
