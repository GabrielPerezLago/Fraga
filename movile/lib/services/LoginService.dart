import 'package:fraga_movile/models/UsuarioModel.dart';
import 'package:fraga_movile/objects/SESSION.dart';
import 'package:fraga_movile/services/ApiService.dart';


class LoginService {
  final session = SESSION.instance;
  Future<UsuarioModel> login(String email, String password) async {
    try {

      print(email +  " :  " +  password);
      final response = await ApiService.login(email, password);
      print(response);
      session.user = response;
      return response;
    } catch (ex) {
      throw Exception('Error login: ${ex}');
    }
  }

}