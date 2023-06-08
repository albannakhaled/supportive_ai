import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon icon;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
    final String? Function(dynamic value)? validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.blueGrey,
      decoration: InputDecoration(
          prefixIcon: icon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          fillColor: Colors.grey.shade300,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.purple, width: 1.2),
          ),
          prefixIconColor: Colors.grey),
    );
  }
}
