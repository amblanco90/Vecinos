// To parse this JSON data, do
//
//     final reserva = reservaFromJson(jsonString);

import 'dart:convert';

import 'package:edificion247/src/helpers/appdata.dart';

Reserva reservaFromJson(String str) => Reserva.fromJson(json.decode(str));


class Reservas{

  List<Reserva> items = new List();
  Reservas();
  Reservas.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;

    for(var item in jsonList){
     
      final reserva = new Reserva.fromJson(item);
      
      items.add(reserva);
    }


      
      
  }


}






class Reserva {
    int id_reserva;
    int res_valor; 
    String fecha_hora_inicio;
    String fecha_hora_fin;
    String observaciones; 
    int id_zona_social;
    String nombre_zona;
    String estado;
    String residente;
    String subunidad;
  Reserva({
    this.id_reserva,
    this.res_valor,
    this.fecha_hora_fin,
    this.fecha_hora_inicio,
    this.nombre_zona,
    this.id_zona_social,
    this.observaciones,
    this.estado,
    this.residente,
    this.subunidad
  });

  factory Reserva.fromJson(Map<String, dynamic> json)=> Reserva(
    id_reserva: json['id_reserva'],
    res_valor: json['res_valor'],
    fecha_hora_fin: json['fecha_hora_fin'],
    fecha_hora_inicio: json['fecha_hora_inicio'],
    nombre_zona: json['nombre_zona'],
    id_zona_social: json['id_zona_social'],
    observaciones: json['observaciones'],
    estado: json['estado'],
    residente: json['residente'],
    subunidad: json['subunidad'],
  );
}