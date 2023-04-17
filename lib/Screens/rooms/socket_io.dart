import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  late String _roomId;
  late String _name;
  late IO.Socket _socket;
  bool _isSelected = false;

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  void initState() {
    super.initState();
    _socket = IO.io('http://localhost:5000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    _socket.onConnect((_) => print('Connected to server'));
    _socket.onDisconnect((_) => print('Disconnected from server'));
    _socket.on('roomCreated', _onRoomCreated);
    _socket.on('roomNotFound', _onRoomNotFound);
    _socket.on('roomFull', _onRoomFull);
    _socket.on('playerJoined', _onPlayerJoined);
    _socket.on('playerLeft', _onPlayerLeft);
  }

  void _createRoom() {
    _socket.connect();
    _socket.emit('createRoom', _name); // create a new room with max 4 players
  }

  void _joinRoom() {
    _socket.connect();
    _socket.emit('joinRoom', _roomId);
  }

  void _onRoomCreated(dynamic data) {
    setState(() {
      _roomId = data;
    });
  }

  void _onRoomNotFound(dynamic _) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Room not found.'),
    ));
  }

  void _onRoomFull(dynamic _) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Room is full.'),
    ));
  }

  void _onPlayerJoined(dynamic data) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('${data['playerName']} joined the room.'),
    ));
  }

  void _onPlayerLeft(dynamic data) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Player left the room.'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Name',
              ),
              onChanged: (value) => setState(() => _name = value),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createRoom,
              child: Text('Create Room'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Room ID',
              ),
              onChanged: (value) => setState(() => _roomId = value),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _joinRoom,
              child: Text('Join Room'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder propertiesBuilder) {
    super.debugFillProperties(propertiesBuilder);
    propertiesBuilder.add(FlagProperty('isSelected',
        value: _isSelected, ifTrue: 'selected', ifFalse: 'not selected'));
  }
}
