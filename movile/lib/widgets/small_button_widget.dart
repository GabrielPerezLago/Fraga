import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final Color color;

  const SmallButton({
    super.key,
    required this.text,
    required this.onClick,
    this.color = Colors.black87
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
            padding: EdgeInsets.all(20),
          minimumSize: Size(70,50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            elevation: 20
        ),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Regular', fontSize: 10),
        )
    );
  }
}