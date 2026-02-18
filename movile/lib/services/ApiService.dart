import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fraga_movile/models/ActivityModel.dart';
import 'package:fraga_movile/models/UsuarioDTO.dart';
import 'package:fraga_movile/models/UsuarioModel.dart';
import 'package:fraga_movile/objects/SESSION.dart';
import 'package:fraga_movile/services/LoginService.dart';
import 'package:fraga_movile/views/login_view.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String URL = 'http://192.168.68.100:8080';

  static Future<UsuarioDTO> login(String email, String password) async {
    final url = Uri.parse('$URL/usuarios/login')
        .replace(queryParameters: {
        'email': email,
        'password': password
    });
    print(url);

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    )
    .timeout(const Duration(seconds: 5));
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UsuarioDTO.fromJson(data);
    } else if(response.statusCode == 400) {
      throw Exception("400");
    } else {
      throw Exception('Inicio de Sesion Fallido');
    }

  }

  static Future<UsuarioDTO> register(String nombre, String email, String password, String nacimiento ) async {
    final url = Uri.parse('$URL/usuarios/register')
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
    ).timeout(const Duration(seconds: 5));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UsuarioDTO.fromJson(data);
    } else {
      throw Exception('Inicio de Sesion Fallido');
    }
  }

  static Future<void> loginByToken(String? token) async {
    final url = Uri.parse('$URL/usuarios/loginbytoken')
        .replace(queryParameters: {
          'token': token
    });

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      }
    ).timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      var user = UsuarioDTO.fromJson(data);
      SESSION.instance.u = user;
    } else {
      SESSION.instance.u = null;
    }

  }


  //Actividades
  static Future<List<ActivityModel>> getActivities() async {
    final url = Uri.parse('$URL/actividades');
    
    final response = await http.get(
      url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        }
    ).timeout(const Duration(seconds: 7));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((a) => ActivityModel.fromJson(a)).toList();

    } else {
      throw Exception("No se han podido obtener las actividades");
    }
  }

  static Future<List<ActivityModel>> getActivitiesNoReserve() async {
    final url = Uri.parse('$URL/actividades/find-all-user')
        .replace(queryParameters: {
      'id': SESSION.instance.u?.id,
    });

    final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        }
    ).timeout(const Duration(seconds: 7));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((a) => ActivityModel.fromJson(a)).toList();

    } else {
      throw Exception("No se han podido obtener las actividades");
    }
  }

  static Future<List<ActivityModel>> getActivitiesByUser() async {
    final url = Uri.parse('$URL/actividades/find-user')
        .replace(queryParameters: {
          'id': SESSION.instance.u?.id,
    });

    final response = await http.post(
      url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        }
    ).timeout(Duration(seconds: 7));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((a) => ActivityModel.fromJson(a)).toList();
    } else {
      throw Exception("No se an podido obtener las actividades de del usuario ");
    }


  }
}