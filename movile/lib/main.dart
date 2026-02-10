import 'package:flutter/material.dart';
import 'package:fraga_movile/core/teme.dart';
import 'package:fraga_movile/views/login_view.dart';

void main() {
  runApp(const FragaApp());
}

class FragaApp extends StatelessWidget {
  const FragaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const LoginView(),
    );
  }
}