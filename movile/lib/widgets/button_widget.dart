import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;

  const AppButton({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
          minimumSize: Size(100, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          elevation: 20
        ),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold),)
    );
  }
}