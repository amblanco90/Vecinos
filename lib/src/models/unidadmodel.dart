import 'dart:convert';

Unidad unidadFromJson(String str) => Unidad.fromJson(json.decode(str));

String unidadToJson(Unidad data) => json.encode(data.toJson());

class Unidad {
    int id;
    String nombre;
    String direccion;
    String fijo;
    String movil;
    int estado;

    Unidad({
        this.id,
        this.nombre,
        this.direccion,
        this.fijo,
        this.movil,
        this.estado,
    });

    factory Unidad.fromJson(Map<String, dynamic> json) => Unidad(
        id: json["id"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        fijo: json["fijo"],
        movil: json["movil"],
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "direccion": direccion,
        "fijo": fijo,
        "movil": movil,
        "estado": estado,
    };
}
