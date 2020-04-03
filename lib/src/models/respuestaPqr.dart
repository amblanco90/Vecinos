// To parse this JSON data, do
//
//     final respuestaPqr = respuestaPqrFromJson(jsonString);

import 'dart:convert';

List<RespuestaPqr> respuestaPqrFromJson(String str) => List<RespuestaPqr>.from(json.decode(str).map((x) => RespuestaPqr.fromJson(x)));

String respuestaPqrToJson(List<RespuestaPqr> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RespuestasPqr {
  List<RespuestaPqr> items = new List();

  RespuestasPqr();
  RespuestasPqr.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final reserva = new RespuestaPqr.fromJson(item);
      items.add(reserva);
    }
  }
}


class RespuestaPqr {
    String residente;
    dynamic administrador;
    String mensaje;
    int estado;
    String fechaCreacion;
    String foto;
    int idTipoPqr;
    String destinatario;

    RespuestaPqr({
        this.residente,
        this.administrador,
        this.mensaje,
        this.estado,
        this.fechaCreacion,
        this.foto,
        this.idTipoPqr,
        this.destinatario,
    });

    factory RespuestaPqr.fromJson(Map<String, dynamic> json) => RespuestaPqr(
        residente: json["residente"],
        administrador: json["administrador"],
        mensaje: json["mensaje"],
        estado: json["estado"],
        fechaCreacion: json["fecha_creacion"],
        foto: json["foto"],
        idTipoPqr: json["id_tipo_pqr"],
        destinatario: json["destinatario"],
    );

    Map<String, dynamic> toJson() => {
        "residente": residente,
        "administrador": administrador,
        "mensaje": mensaje,
        "estado": estado,
        "fecha_creacion": fechaCreacion,
        "foto": foto,
        "id_tipo_pqr": idTipoPqr,
        "destinatario": destinatario,
    };
}
