import 'dart:convert';
class DatosFamilia{
String id_parentesco,id_residente,cedula_familiar,nombre_familiar,apellidos_familiar,correo_familiar,movil_familiar,direccion_familiar,username,id_nucleo,id_familiar;
  DatosFamilia({this.id_parentesco,this.id_residente,this.cedula_familiar,this.nombre_familiar,this.apellidos_familiar,this.correo_familiar,this.movil_familiar,this.direccion_familiar,this.username,this.id_nucleo,this.id_familiar});

factory DatosFamilia.fromJson(Map<String, dynamic> map) {
    return DatosFamilia(id_parentesco: map["id_parentesco"], id_residente: map["id_residente"], cedula_familiar: map["cedula_familiar"],nombre_familiar: map["nombre_familiar"],apellidos_familiar: map["apellidos_familiar"],correo_familiar: map["correo_familiar"],movil_familiar: map["movil_familiar"],direccion_familiar: map["direccion_familiar"],username: map["username"],id_nucleo: map["id_nucleo"]);
  }
   Map<String, dynamic> toJson() {
    return {"id_parentesco": id_parentesco, "id_residente": id_residente, "id_residente": id_residente, "cedula_familiar": cedula_familiar, "nombre_familiar": nombre_familiar, "apellidos_familiar": apellidos_familiar,"correo_familiar": correo_familiar,"movil_familiar": movil_familiar,"direccion_familiar": direccion_familiar,"username": username,"id_nucleo":id_nucleo};
  }
}
String familiaToJson( DatosFamilia data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}