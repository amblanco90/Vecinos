import 'dart:convert';
class DatosSubUnidad{
  String inputId;
  String inputNomen;
  String tipoUnidad;
  String inputEstado;
  String inputIdProp;
  String inputNameProp;
  String inputApeProp;
  String inputCel;
  String inputEmail;
  String inputTel;

  DatosSubUnidad({this.inputId,
                  this.inputNomen,
                  this.tipoUnidad,
                  this.inputEstado,
                  this.inputIdProp,
                  this.inputNameProp,
                  this.inputApeProp,
                  this.inputCel,
                  this.inputEmail,
                  this.inputTel});

                  factory DatosSubUnidad.fromJson(Map<String, dynamic> json)=> DatosSubUnidad(
    inputId: json['InputId'],
    inputNomen: json['InputNomen'],
    tipoUnidad: json['TipoUnidad'],
    inputEstado: json['InputEstado'],
    inputIdProp: json['InputIdProp'],
    inputNameProp: json['InputNameProp'],
    inputApeProp: json['InputApeProp'],
    inputCel: json['InputCel'],
     inputEmail: json['InputEmail'],
     inputTel: json['InputTel'],
  );

Map<String, dynamic> toJson() {
    return {"InputId": inputId, "InputNomen": inputNomen,
    "TipoUnidad":tipoUnidad,"InputEstado":inputEstado,
    "InputIdProp":inputIdProp,"InputNameProp":inputNameProp,
    "InputApeProp":inputApeProp,"InputCel":inputCel,
    "InputEmail":inputEmail,"InputTel":inputTel};
  }

}

String subUnidadToJsonLogin( DatosSubUnidad data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}