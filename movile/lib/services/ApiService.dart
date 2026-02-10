import 'dart:convert';

import 'package:fraga_movile/models/UsuarioModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String URL = 'http://192.168.56.1:8080';

  static Future<UsuarioModel> login(String email, String password) async {
    final url = Uri.parse('$URL/login')
        .replace(queryParameters: {
        'email': email,
        'password': password
    });

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return UsuarioModel.fromJson(data);
    } else {
      throw Exception('Inicio de Sesion Fallido');
    }

  }

}