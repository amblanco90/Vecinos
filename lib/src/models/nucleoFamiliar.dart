import 'dart:convert';

NucleoFamiliar nucleoFamiliarFromJson(String str) => NucleoFamiliar.fromJson(json.decode(str));

String nucleoFamiliarToJson(NucleoFamiliar data) => json.encode(data.toJson());

class NucleoFamiliar {
    int idNucleo;
    int idParentesco;
    String parentesco;
    int idPersonaFamiliar;
    String nombreFamiliar;
    int estado;

    NucleoFamiliar({
        this.idNucleo,
        this.idParentesco,
        this.parentesco,
        this.idPersonaFamiliar,
        this.nombreFamiliar,
        this.estado,
    });

    factory NucleoFamiliar.fromJson(Map<String, dynamic> json) => NucleoFamiliar(
        idNucleo: json["id_nucleo"]!=null?json["id_nucleo"]:'',
        idParentesco: json["id_parentesco"]!=null?json["id_parentesco"]:'',
        parentesco: json["parentesco"]!=null?json["parentesco"]:'',
        idPersonaFamiliar: json["id_persona_familiar"]!=null?json["id_persona_familiar"]:'',
        nombreFamiliar: json["nombre_familiar"]!=null?json["nombre_familiar"]:'',
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "id_nucleo": idNucleo,
        "id_parentesco": idParentesco,
        "parentesco": parentesco,
        "id_persona_familiar": idPersonaFamiliar,
        "nombre_familiar": nombreFamiliar,
        "estado": estado,
    };
}
