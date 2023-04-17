import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_coding_game/Games/scoreboard.dart';
import 'package:project_coding_game/Games/waiting_lobby.dart';
import 'package:project_coding_game/provider/room_data_provider.dart';
import 'package:project_coding_game/resources/socket_methods.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';

  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayerState(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    return Scaffold(
        body: roomDataProvider.roomData['isJoin']
            ? const WaitingLobby()
            : SafeArea(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [Scoreboard()],
              )));
  }
}
