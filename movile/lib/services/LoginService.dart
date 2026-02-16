

import 'package:flutter/cupertino.dart';
import 'package:fraga_movile/models/UsuarioDTO.dart';
import 'package:fraga_movile/models/UsuarioModel.dart';
import 'package:fraga_movile/objects/SESSION.dart';
import 'package:fraga_movile/security/TokenStorage.dart';
import 'package:fraga_movile/services/ApiService.dart';
import 'package:fraga_movile/views/error_view.dart';


class LoginService {
  final session = SESSION.instance;
  final tokenManager = TokenStorage();
  Future<UsuarioDTO> login(String email, String password) async {
    try {

      print(email +  " :  " +  password);
      final response = await ApiService.login(email, password);
      print(response);
      session.u = response;
      tokenManager.deleteToken();
      if(session.u?.token != null) tokenManager.saveToken(session.u?.token);
      session.u?.token = "";
      return response;
    } catch (ex) {
      print("Error : " + ex.toString());
      throw Exception('Error login: ${ex}');
    }
  }

  Future<UsuarioDTO> register(String nombre, String email, String password, String nacimiento) async {
    try {
      print(nombre + ":" + email + ":" + ":" + nacimiento.toString() + ":" + password);
      final response = await ApiService.register(nombre, email, password, nacimiento);
      session.u = response;
      tokenManager.deleteToken();
      if(session.u?.token != null) tokenManager.saveToken(session.u?.token);
      session.u?.token = "";
      return response;
    } catch (ex) {
      throw Exception('Error login: ${ex}');
    }
  }


}