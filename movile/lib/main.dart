import 'package:flutter/material.dart';
import 'package:fraga_movile/core/teme.dart';
import 'package:fraga_movile/objects/SESSION.dart';
import 'package:fraga_movile/security/TokenStorage.dart';
import 'package:fraga_movile/services/ApiService.dart';
import 'package:fraga_movile/views/login_view.dart';
import 'package:fraga_movile/views/primary_screen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final tokenStorage = TokenStorage();
  final token = await tokenStorage.getToken();
  print(token);


  if (token != "" && token != null) await ApiService.loginByToken(token);

  runApp(const FragaApp());
}

class FragaApp extends StatelessWidget {
  const FragaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: SESSION.instance.isLogged ? const PrimaryScreen() : const LoginView(),
    );
  }
}