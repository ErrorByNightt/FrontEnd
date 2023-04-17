import 'package:flutter/material.dart';
import 'package:project_coding_game/Components/Url.dart';
import 'package:project_coding_game/models/BlogModel.dart';

class Cell extends StatelessWidget {
  //var
  final Blogg game;

  const Cell(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      game.title,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
