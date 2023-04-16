import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:project_coding_game/Components/BlogCard.dart';
import 'package:project_coding_game/NetworkHandler.dart';
import 'package:project_coding_game/models/SuperModel.dart';
import 'package:project_coding_game/models/addBlogModel.dart';
import 'package:http/http.dart' as http;

class Blogs extends StatefulWidget {
  late String url;
  Blogs(AddBlogModel blog, {super.key, required this.url});

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  SuperModel superModel = SuperModel(data: []);
  NetworkHandler networkHandler = NetworkHandler();
  List<AddBlogModel> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var response = await networkHandler.get(widget.url);
    superModel = SuperModel.fromJson(response);
    setState(() {
      data = superModel.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return data.length > 0
        ? Column(
            children: data
                .map((item) => Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (contex) => BlogCard(
                                          addBlogModel: item,
                                          networkHandler: networkHandler,
                                        )));
                          },
                          child: BlogCard(
                            addBlogModel: item,
                            networkHandler: networkHandler,
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                      ],
                    ))
                .toList(),
          )
        : Center(
            child: Text("We don't have any Blog Yet"),
          );
  }
}
