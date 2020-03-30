// To parse this JSON data, do
//
//     final perfilResidente = perfilResidenteFromJson(jsonString);

import 'dart:convert';

PerfilResidente perfilResidenteFromJson(String str) => PerfilResidente.fromJson(json.decode(str));

String perfilResidenteToJson(PerfilResidente data) => json.encode(data.toJson());

class PerfilResidente {
    int inputId;
    int inputCed;
    String inputName;
    String inputApe;
    String inputDir;
    String inputTel;
    String inputEmail;
    String inputFoto;
    int estado;

    PerfilResidente({
        this.inputId,
        this.inputCed,
        this.inputName,
        this.inputApe,
        this.inputDir,
        this.inputTel,
        this.inputEmail,
        this.inputFoto,
        this.estado,
    });

    factory PerfilResidente.fromJson(Map<String, dynamic> json) => PerfilResidente(
        inputId: json["InputId"],
        inputCed: json["InputCed"],
        inputName: json["InputName"],
        inputApe: json["InputApe"],
        inputDir: json["InputDir"],
        inputTel: json["InputTel"],
        inputEmail: json["InputEmail"],
        estado: json["Estado"],
        inputFoto: json["InputFoto"]!=null?json["InputFoto"]:'',
    );

    Map<String, dynamic> toJson() => {
        "InputId": inputId,
        "InputCed": inputCed,
        "InputName": inputName,
        "InputApe": inputApe,
        "InputDir": inputDir,
        "InputTel": inputTel,
        "InputEmail": inputEmail,
        "Estado": estado,
        "inputFoto": inputFoto,
    };
}