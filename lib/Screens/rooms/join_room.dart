import 'package:flutter/material.dart';
import 'package:project_coding_game/Components/Custom_button.dart';
import 'package:project_coding_game/Components/Custom_textfield.dart';
import 'package:project_coding_game/Components/text.dart';
import 'package:project_coding_game/resources/socket_methods.dart';
import 'package:project_coding_game/responsive/responsive.dart';

class JoinRoom extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoom({super.key});

  @override
  State<JoinRoom> createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  final TextEditingController _gameIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayerState(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _gameIdController.dispose();
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
                    text: 'Join Room',
                    fontSize: 70),
                SizedBox(height: size.height * 0.08),
                CustomTextField(
                    controller: _nameController, hintText: 'Enter your name'),
                SizedBox(height: size.height * 0.08),
                CustomTextField(
                    controller: _gameIdController, hintText: 'Enter Game ID'),
                SizedBox(height: size.height * 0.08),
                CustomButton(
                    onTap: () => _socketMethods.joinRoom(
                        _nameController.text, _gameIdController.text),
                    text: 'Join')
              ]),
        ),
      ),
    );
  }
}
