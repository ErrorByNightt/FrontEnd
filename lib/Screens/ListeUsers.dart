import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final String id;
  final String mail;
  final String userName;

  User({
    required this.id,
    required this.mail,
    required this.userName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      mail: json['mail'],
      userName: json['userName'],
    );
  }
}

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final _idController = TextEditingController();
  late String _selectedState;
  List<User>? _users;
  List<User>? _filteredUsers;

  Future<List<User>> _getUsers() async {
    final response =
    await http.get(Uri.parse('http://localhost:9095/user/users/getall'));

    if (response.statusCode == 200) {
      List<dynamic> usersJson = jsonDecode(response.body);
      return usersJson.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    super.initState();
    _getUsers().then((users) {
      setState(() {
        _users = users;
        _filteredUsers = users;
      });
    });
  }

  void _activateUser(User user) {
    _idController.text = user.id;
    _selectedState = 'active';
    _updateUserState();
  }

  void _deactivateUser(User user) {
    _idController.text = user.id;
    _selectedState = 'deactivated';
    _updateUserState();
  }

  void _bannedeUser(User user) {
    _idController.text = user.id;
    _selectedState = 'banned';
    _updateUserState();
  }

  void _updateUserState() async {
    final id = _idController.text;
    if (id.isEmpty || _selectedState == null) return;

    final url = Uri.parse('http://localhost:9095/user/state/$id');
    final response =
    await http.put(url, body: {'etat': _selectedState});
    String message = '';

    if (_selectedState == 'active') {
      message = 'activated';
    } else if (_selectedState == 'banned') {
      message = 'banned';
    } else if (_selectedState == 'deactivated') {
      message = 'deactivated';
    }

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('User $message'),
            content: Text('User with ID $id has been $_selectedState.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      print('PUT request failed with status: ${response.statusCode}.');
    }
  }

  void _filterUsers(String query) {
    setState(() {
      _filteredUsers = _users
          ?.where((user) =>
          user.userName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  String _searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff951208), Color(0xff250402)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.red.withOpacity(0.3),
            title: Text(

        'liste users'
            ),
          ),

          body: _users == null
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Center(
            child: Column(

              children: [
                SizedBox(
                  height: 20, // espace de 20 pixels
                ),
                SizedBox(
                  height: 100,
                  width: 400,
                  child: TextField(
                    cursorColor: Color.fromARGB(255, 255, 255, 255),
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(163, 252, 246, 246),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none),
                        hintText: 'Search for a user..',
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
                          width: 8,
                        )),
                    onChanged: (value) {
                      setState(() {
                        _searchTerm = value.toLowerCase();
                      });
                      _filterUsers(_searchTerm);
                    },
                  ),
                ),
                Container(
                  height: 500, // hauteur de la container
                  width: 700, // largeur de la container
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(40),

                  ),

                  child: ListView.builder(
                    itemCount: _users?.length,
                    itemBuilder: (context, index) {
                      final user = _users![index];

                      // On filtre la liste en fonction du terme de recherche
                      if (_searchTerm.isNotEmpty &&
                          !user.userName.toLowerCase().contains(_searchTerm) &&
                          !user.mail.toLowerCase().contains(_searchTerm)) {
                        return Container();
                      }
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: ListTile(
                          title: Text(
                            _users![index].userName,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            _users![index].mail,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Text('Activate'),
                                value: 'activate',
                              ),
                              PopupMenuItem(
                                child: Text('Deactivate'),
                                value: 'deactivate',
                              ),
                              PopupMenuItem(
                                child: Text('Ban'),
                                value: 'ban',
                              ),
                            ],
                            onSelected: (value) {
                              if (value == 'activate') {
                                _activateUser(_users![index]);
                              } else if (value == 'deactivate') {
                                _deactivateUser(_users![index]);
                              } else if (value == 'ban') {
                                _bannedeUser(_users![index]);
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}