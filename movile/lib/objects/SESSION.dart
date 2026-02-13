import 'package:fraga_movile/models/UsuarioModel.dart';

class SESSION {
  static final SESSION instance = SESSION._internal();

  SESSION._internal();

  UsuarioModel? user;

  void login(UsuarioModel u){
    user = u;
  }


}