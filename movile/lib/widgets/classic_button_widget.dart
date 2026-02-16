import 'package:flutter/material.dart';

class ClassicButton extends StatelessWidget {
  final String text;
  final VoidCallback onclick;
  final Color textColor;

  const ClassicButton({
    super.key,
    this.text = 'Bonton' ,
    required this.onclick,
    this.textColor = Colors.white,
  });
  
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onclick,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
        ),
        child: Text(text, style: TextStyle(fontSize: 30, fontFamily: 'Regular'),));
  }
}