import 'dart:convert';
DatosPropietario perfilResidenteFromJson(String str) => DatosPropietario.fromJson(json.decode(str));
class DatosPropietario{
  int inputIdProp;
  String inputNameProp;
  String inputApeProp;
  String inputCel;
  String inputEmail;

  DatosPropietario({this.inputApeProp,this.inputCel,this.inputEmail,this.inputIdProp,this.inputNameProp});
  factory DatosPropietario.fromJson(Map<String, dynamic> json)=> DatosPropietario(
    inputIdProp: json['InputIdProp'],
    inputNameProp: json['InputNameProp'],
    inputApeProp: json['InputApeProp'],
    inputCel: json['InputCel'],
    inputEmail: json['InputEmail'],
  );
}