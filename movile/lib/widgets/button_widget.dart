import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  const AppButton({
    super.key,
    required this.text,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
          minimumSize: Size(100, 55),
          padding:  EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          elevation: 20
        ),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Frijole'),)
    );
  }
}