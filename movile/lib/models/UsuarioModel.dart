class UsuarioModel {
  String id;
  String nombre;
  String apellidos;
  String email;
  String password;
  DateTime nacimiento;
  String rol;

  UsuarioModel({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.email,
    required this.password,
    required this.nacimiento,
    required this.rol
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      id: json['id'],
      nombre: json['nombre'],
      apellidos: json['apellidos'],
      email: json['email'],
      password: json['password'],
      nacimiento: json['nacimiento'],
      rol: json['rol'],
    );
  }
}