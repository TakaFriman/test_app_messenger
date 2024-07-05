import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const MyTextField({super.key, required this.controller, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: const TextStyle(color: Color.fromRGBO(43, 51, 62, 1), fontSize: 16, fontWeight: FontWeight.w500),
        obscureText: obscureText,
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: const Color.fromRGBO(237, 242, 246, 1),
          hintText: hintText,
          hintStyle:
              const TextStyle(color: Color.fromRGBO(157, 183, 203, 1), fontSize: 16, fontWeight: FontWeight.w500),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color.fromRGBO(237, 242, 246, 1)),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color.fromRGBO(145, 147, 149, 1)),
              borderRadius: BorderRadius.circular(12)),
        ));
  }
}
