import 'package:flutter/material.dart';
import 'package:project_coding_game/models/addBlogModel.dart';

class GridCell extends StatelessWidget {
  //var
  final AddBlogModel addBlogModel;
  const GridCell(this.addBlogModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //1
            Image.asset("Assets/${addBlogModel.coverImage}"),
            //2
            Text(addBlogModel.title)
          ],
        ),
      ),
    );
  }
}
