// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project_coding_game/Games/Entrainement.dart';
import 'package:project_coding_game/Screens/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class FriendRequestPage extends StatefulWidget {
  @override
  State<FriendRequestPage> createState() => _FriendRequestPageState();
}

class _FriendRequestPageState extends State<FriendRequestPage> {
  late FriendRequestData _friendRequests =
      FriendRequestData(friendRequests: [], users: []);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchFriendRequestsAndUsers().then((friendRequests) {
      setState(() {
        _friendRequests = friendRequests;
        print("length : ${_friendRequests.friendRequests.length}");
      });
    });
  }

  Future<FriendRequestData> fetchFriendRequestsAndUsers() async {
    final response = await http
        .get(Uri.parse('http://localhost:9095/friend/friendRequests'));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var friendRequestsJson = jsonData['docs'];
      var usersJson = jsonData['array'];

      List<FriendRequest> friendRequests = [];
      for (var friendRequestJson in friendRequestsJson) {
        FriendRequest friendRequest = FriendRequest.fromJson(friendRequestJson);
        friendRequests.add(friendRequest);
      }

      List<User> users = [];
      for (var userJsonArray in usersJson) {
        for (var userJson in userJsonArray) {
          User user = User.fromJson(userJson);
          users.add(user);
        }
      }

      return FriendRequestData(friendRequests: friendRequests, users: users);
    } else {
      throw Exception('Failed to load friend requests');
    }
  }

  Future<http.Response> AcceptInvitation(String id, String status) async {
    Uri AcceptInvitationURI =
        Uri.parse("http://localhost:9095/friend/friendRequests/$id");
    final data = {"status": status};
    String params = jsonEncode(data);
    http.Response response = await http
        .put(AcceptInvitationURI, body: params, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 200) {
      print(response.body);
      return response;
    } else {
      print(response.statusCode);
      throw Exception('Failed to load friend requests');
    }
  }

  Future<http.Response> AddInvitation(String mail) async {
    Uri AddInvitationURI =
        Uri.parse("http://localhost:9095/friend/friendRequests/");
    final data = {"mail": mail, "senderId" : "6452d612be21748558771a98"};
    String params = jsonEncode(data);
    http.Response response = await http
        .post(AddInvitationURI, body: params, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 200) {
      print(response.body);
      return response;
    } else {
      print(response.statusCode);
      throw Exception('Failed to load friend requests');
    }
  }

  /*final List<Map<String, String>> _friendRequests = [
    {'recipient': 'Alice', 'status': 'pending'},
    {'recipient': 'Bob', 'status': 'pending'},
    {'recipient': 'Charlie', 'status': 'accepted'},
  ];*/
  List<FriendRequest> objects = [];
  late TextEditingController _emailController = TextEditingController();

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
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Friends',
                  style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 55.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  'Send Friend Request',
                  style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 25.0,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 25.0),
              TextFormField(
                controller: _emailController,
                  decoration: InputDecoration(labelText: 'Recipient Mail')),
              SizedBox(height: 20.0),
              ElevatedButton.icon(
                onPressed: () async {
                  print("Email Controller : ${_emailController.text}");
                  final response = await AddInvitation(_emailController.text);
                  showDialog(
                       
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Success'),
                                      content: Container(
                                        width: 400,
                                        height: 150,
                                        child: Center(
                                          child: Text('Invitation sent to\n ' +
                                              _emailController.text,
                                              style: TextStyle(
                                  fontFamily: 'Inika',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1,
                                  fontSize: 20),
                                              ),
                                        ),
                                      ),
                                     
                                    ),
                      );
                },
                label: Text('Send Request'),
                icon: Icon(Icons.add),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.black45),
              ),
              SizedBox(height: 32.0),
              Container(
                margin: EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  'Pending Friend Requests',
                  style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 25.0,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: _friendRequests.friendRequests.length,
                  itemBuilder: (BuildContext context, int index) {
                    final friendRequest = _friendRequests.friendRequests[index];
                    final user = _friendRequests.users[index];
                    return ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        user.userName,
                        style: TextStyle(
                            fontFamily: 'Inika',
                            fontSize: 25.0,
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        friendRequest.status,
                        style: TextStyle(
                            fontFamily: 'Inika',
                            fontSize: 18.0,
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (friendRequest.status == 'pending')
                            IconButton(
                              onPressed: () async {
                                final response = await AcceptInvitation(
                                    friendRequest.id.toString(), 'accepted');
                                fetchFriendRequestsAndUsers()
                                    .then((friendRequests) {
                                  setState(() {
                                    _friendRequests = friendRequests;
                                    print(
                                        "length : ${_friendRequests.friendRequests.length}");
                                  });
                                });
                              },
                              icon: Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            ),
                          IconButton(
                            onPressed: () async {
                              final response = await AcceptInvitation(
                                  friendRequest.id.toString(), 'declined');
                              fetchFriendRequestsAndUsers()
                                  .then((friendRequests) {
                                setState(() {
                                  _friendRequests = friendRequests;
                                  print(
                                      "length : ${_friendRequests.friendRequests.length}");
                                });
                              });
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FriendRequest {
  final String id;
  final String senderId;
  final String receiverId;
  late final String status;

  FriendRequest(
      {required this.id,
      required this.senderId,
      required this.receiverId,
      required this.status});

  factory FriendRequest.fromJson(Map<String, dynamic> json) {
    return FriendRequest(
        id: json['_id'],
        senderId: json['senderId'],
        receiverId: json['receiverId'],
        status: json['status']);
  }
}

class User {
  final String id;
  final String userName;
  final String mail;

  User({
    required this.id,
    required this.userName,
    required this.mail,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'], userName: json['userName'], mail: json['mail']);
  }
}

class FriendRequestData {
  final List<FriendRequest> friendRequests;
  final List<User> users;

  FriendRequestData({required this.friendRequests, required this.users});
}
