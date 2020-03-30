// To parse this JSON data, do
//
//     final zonaSocial = zonaSocialFromJson(jsonString);

import 'dart:convert';

ZonaSocial zonaSocialFromJson(String str) => ZonaSocial.fromJson(json.decode(str));

String zonaSocialToJson(ZonaSocial data) => json.encode(data.toJson());

class ZonasSociales {
  List<ZonaSocial> items = new List();

  ZonasSociales();
  ZonasSociales.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final reserva = new ZonaSocial.fromJson(item);
      items.add(reserva);
    }
  }
}

class ZonaSocial {
    int inputId;
    String inputStart;
    String inputNomen;
    int inputTipoZona;
    int inputValor;
    int unidadTiempo;
    List<dynamic> disponibilidad;
    int estado;

    ZonaSocial({
        this.inputId,
        this.inputStart,
        this.inputNomen,
        this.inputTipoZona,
        this.inputValor,
        this.unidadTiempo,
        this.disponibilidad,
        this.estado,
    });

    factory ZonaSocial.fromJson(Map<String, dynamic> json) => ZonaSocial(
        inputId: json["InputId"],
        inputStart: json["InputStart"],
        inputNomen: json["InputNomen"],
        inputTipoZona: json["InputTipoZona"],
        inputValor: json["InputValor"],
        unidadTiempo: json["UnidadTiempo"],
        disponibilidad: json["disponibilidad"],
        estado: json["Estado"],
    );

    Map<String, dynamic> toJson() => {
        "InputId": inputId,
        "InputStart": inputStart,
        "InputNomen": inputNomen,
        "InputTipoZona": inputTipoZona,
        "InputValor": inputValor,
        "UnidadTiempo": unidadTiempo,
        "disponibilidad": List<dynamic>.from(disponibilidad.map((x) => x.toJson())),
        "Estado": estado,
    };
}

class Disponibilidad {
    int dia;
    String horaInicio;
    String horaFin;

    Disponibilidad({
        this.dia,
        this.horaInicio,
        this.horaFin,
    });

    factory Disponibilidad.fromJson(Map<String, dynamic> json) => Disponibilidad(
        dia: json["dia"],
        horaInicio: json["hora_inicio"],
        horaFin: json["hora_fin"],
    );

    Map<String, dynamic> toJson() => {
        "dia": dia,
        "hora_inicio": horaInicio,
        "hora_fin": horaFin,
    };
}