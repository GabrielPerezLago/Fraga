class UsuarioDTO {
  String? token;
  String? id;
  String nombre;
  String? apellidos;
  String email;
  String? nacimiento;
  String rol;

  UsuarioDTO({
    required this.token,
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.email,
    required this.nacimiento,
    required this.rol
  });

  factory UsuarioDTO.fromJson(Map<String, dynamic> json) {
    return UsuarioDTO(token: json['token'], id: json['id'],nombre: json['nombre'], apellidos: json['apellidos'], email: json['email'], nacimiento: json['nacimiento'], rol: json['rol']);
  }
}