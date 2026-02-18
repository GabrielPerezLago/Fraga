import 'dart:convert';
import 'dart:ffi';

class ActivityModel {
  String? id;
  String nombre;
  String? descripcion;
  String fecha;
  int plazas;
  String? image;

  ActivityModel({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.fecha,
    required this.plazas,
    required this.image
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(id: json['id'], nombre: json['nombre'], descripcion: json['descripcion'], fecha: json['fecha'], plazas: json['plazas']  , image: json['image']);
  }
}