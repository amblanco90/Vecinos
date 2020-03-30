import 'dart:convert';
class DatosReserva{
String id_residente,valor,id_subunidad,id_zona_social,observaciones,username,fecha_hora_inicio,fecha_hora_fin,id_reserva;
  DatosReserva({this.id_residente,this.valor,this.id_subunidad,this.id_zona_social,this.observaciones,this.username,this.fecha_hora_inicio,this.fecha_hora_fin,this.id_reserva});

factory DatosReserva.fromJson(Map<String, dynamic> map) {
    return DatosReserva(
        id_residente: map["id_residente"], valor: map["valor"],id_zona_social:map['id_zona_social'], id_subunidad: map["id_subunidad"],observaciones: map["observaciones"],username: map["username"],fecha_hora_inicio: map["fecha_hora_inicio"],fecha_hora_fin: map["fecha_hora_fin"],id_reserva:map['id_reserva']);
  }
   Map<String, dynamic> toJson() {
    return {"id_residente": id_residente,  "valor": valor, "id_subunidad": id_subunidad,"id_zona_social":id_zona_social,"observaciones": observaciones, "username": username,"fecha_hora_inicio": fecha_hora_inicio,"fecha_hora_fin":fecha_hora_fin,'id_reserva':id_reserva};
  }
}
String reservaToJson( DatosReserva data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}