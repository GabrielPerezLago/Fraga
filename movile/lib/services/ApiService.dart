import 'dart:convert';

import 'package:fraga_movile/models/UsuarioModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String URL = 'http://10.2.3.86:8080';

  static Future<UsuarioModel> login(String email, String password) async {
    final url = Uri.parse('$URL/usuarios/login')
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
      final data = jsonDecode(response.body);
      return UsuarioModel.fromJson(data);
    } else {
      throw Exception('Inicio de Sesion Fallido');
    }

  }

  static Future<UsuarioModel> register(String nombre, String email, String password, DateTime nacimiento ) async {
    final url = Uri.parse('$URL/usuarios/login')
      .replace(queryParameters: {
        'nombre': nombre,
        'email': email,
        'password': password,
        'nacimiento': nacimiento,
        'rol': 'admin'
    });
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UsuarioModel.fromJson(data);
    } else {
      throw Exception('Inicio de Sesion Fallido');
    }
  }

}