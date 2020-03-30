import 'dart:convert';
class DatosVisitas{
  String id_visitante,cedula_visitante,id_residente,nombre_visita,placa_auto,fecha_visita,observaciones,username,estado,foto;
  DatosVisitas({this.id_visitante,this.cedula_visitante,this.id_residente,this.nombre_visita,this.placa_auto,this.fecha_visita,this.observaciones,this.username,this.estado,this.foto});

factory DatosVisitas.fromJson(Map<String, dynamic> map) {
    return DatosVisitas(
        id_visitante: map["id_visitante"], cedula_visitante: map["cedula_visitante"], id_residente: map["id_residente"], nombre_visita: map["nombre_visita"],placa_auto: map["placa_auto"],fecha_visita: map["fecha_visita"],observaciones: map["observaciones"],username: map["username"],estado: map["estado"],foto: map["foto"]);
  }

  Map<String, dynamic> toJson() {
    return {"id_visitante": id_visitante, "cedula_visitante": cedula_visitante, "id_residente": id_residente, "nombre_visita": nombre_visita, "placa_auto": placa_auto, "fecha_visita": fecha_visita, "observaciones": observaciones,"username": username,"estado": estado,"foto":foto};
  }
}

String profileToJson( DatosVisitas data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}