import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

class OverlayCard extends StatelessWidget {
  const OverlayCard({super.key, required this.imagevalue, required this.title});
  final Uint8List imagevalue;
  final String title;

// final PickedFile imagefile;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.memory(imagevalue).image,
                    fit: BoxFit.fitWidth),
              ),
            ),
            Positioned(
                bottom: 2,
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Inika',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3),
                    ),
                  ),
                ))
          ],
        ));
  }
}
