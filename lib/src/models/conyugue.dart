import 'package:edificion247/src/models/perfilResidente.dart';
import 'dart:convert';
Conyuge perfilResidenteFromJson(String str) => Conyuge.fromJson(json.decode(str));



class Conyuge{

  int  id_nucleo;
  int  id_parentesco;
  String parentesco;
  int  id_persona_familiar;
  String nombre_familiar;
  int  estado;
  String correo;
  String movil;
  int documento;

  Conyuge({
    this.id_nucleo,
    this.id_parentesco,
    this.parentesco,
    this.id_persona_familiar,
    this.nombre_familiar,
    this.estado,
    this.correo,
    this.movil,
    this.documento
  });
  factory Conyuge.fromJson(Map<String, dynamic> json)=> Conyuge(
    id_nucleo: json['id_nucleo'],
    id_parentesco: json['id_parentesco'],
    parentesco: json['parentesco'],
    id_persona_familiar: json['id_persona_familiar'],
    nombre_familiar: json['nombre_familiar'],
    estado: json['estado'],
    correo: json['correo'],
    movil: json['movil'],
     documento: json['documento'],
  );


}