import 'package:flutter/material.dart';
import 'package:project_coding_game/NetworkHandler.dart';
import 'package:project_coding_game/models/addBlogModel.dart';

class BlogCard extends StatelessWidget {
  const BlogCard(
      {super.key, required this.addBlogModel, required this.networkHandler});

  final AddBlogModel addBlogModel;
  final NetworkHandler networkHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: networkHandler.getImage(addBlogModel.id),
                    fit: BoxFit.fill),
              ),
            ),
            Positioned(
              bottom: 2,
              child: Container(
                padding: const EdgeInsets.all(7),
                height: 60,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  addBlogModel.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
