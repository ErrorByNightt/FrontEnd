import 'package:flutter/material.dart';
import 'package:project_coding_game/Components/utils.dart';
import 'package:project_coding_game/Games/testing-game_room.dart';
import 'package:project_coding_game/provider/room_data_provider.dart';
import 'package:project_coding_game/resources/socket_client.dart';
import 'package:provider/provider.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  // EMITS
  void createRoom(String name) {
    if (name.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'name': name,
      });
    }
  }

  void joinRoom(String name, String roomId) {
    if (name.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit('joinRoom', {
        'name': name,
        'roomId': roomId,
      });
    }
  }

// LISTENERS
  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GameScreen(),
        ),
      );
    });
  }

  void joinRoomSuccessListener(BuildContext context) {
    _socketClient.on('joinRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const GameScreen()));
    });
  }

  void errorOccuredListener(BuildContext context) {
    _socketClient.on('errorOccurred', (data) {
      showSnackBar(context, data);
    });
  }

  //FUNCTIONS
  void updatePlayerState(BuildContext context) {
    _socketClient.on('updatePlayers', (playerData) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1(playerData[0]);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer2(playerData[1]);
    });
  }

  void updateRoomListener(BuildContext context) {
    _socketClient.on('updateRoom', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(data);
    });
  }
}
