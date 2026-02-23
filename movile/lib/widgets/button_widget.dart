import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final Color color;
  const AppButton({
    super.key,
    required this.text,
    required this.onClick,
    this.color = Colors.brown
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          minimumSize: Size(150, 65),
          padding:  EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          elevation: 20
        ),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Regular', fontSize: 20),)
    );
  }
}