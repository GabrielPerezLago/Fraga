import 'dart:convert';
import 'dart:ffi';

import 'package:fraga_movile/utils/AppUtils.dart';

class ActivityModel {
  String? id;
  String nombre;
  String? descripcion;
  String fecha;
  int plazas;
  bool reaalizada;
  String? image;
  bool? noAsist;

  ActivityModel({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.fecha,
    required this.reaalizada,
    required this.plazas,
    required this.image,
    this.noAsist
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(id: json['id'], nombre: json['nombre'], descripcion: json['descripcion'], fecha: AppUtils().parseFecha(json['fecha']), reaalizada: json['realizada'], plazas: json['plazas']  , image: json['image']);
  }
}