import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isReadOnly;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isReadOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 227, 235, 241),
            blurRadius: 5,
            spreadRadius: 0,
          )
        ],
      ),
      child: TextField(
        style: TextStyle(color: Colors.white),
        readOnly: isReadOnly,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 36, 36, 35),
          filled: true,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          hintText: hintText,
          hintStyle: TextStyle(color: Color.fromARGB(255, 196, 190, 190)),
        ),
      ),
    );
  }
}
