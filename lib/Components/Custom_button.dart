// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size(150, 40)),
          backgroundColor:
              const MaterialStatePropertyAll(Color.fromARGB(255, 40, 37, 37)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(fontSize: 10, letterSpacing: 2),
        ),
      ),
    );
  }
}
