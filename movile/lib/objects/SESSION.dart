import 'package:fraga_movile/models/UsuarioDTO.dart';
import 'package:fraga_movile/security/TokenStorage.dart';

class SESSION {
  static final SESSION instance = SESSION._internal();
  static final storage = TokenStorage();
  SESSION._internal();

  UsuarioDTO? u;

  void login(UsuarioDTO user){
    u?.token = user.token;
    u?.nombre= user.nombre;
    u?.apellidos = user.apellidos;
    u?.email = user.email;
    u?.nacimiento = user.nacimiento;
    u?.rol = user.rol;
  }

  void logout() {
    storage.deleteToken();
    u = null;
  }

  bool get isLogged => u != null && u != "";

}