import 'package:flutter/material.dart';

class DefaulAppInput extends StatelessWidget {
  final String defaultText;
  final bool obscureText;
  final double padding;
  final TextEditingController controller;

  const DefaulAppInput({
    super.key,
    required this.defaultText,
    this.obscureText = false,
    this.padding = 0.0,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          hintText: defaultText,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
