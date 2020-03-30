import 'dart:convert';
class ListaReserva{
  String id_reserva,res_valor,fecha_hora_inicio,fecha_hora_fin,observaciones,id_zona_social,nombre_zona;
  ListaReserva({this.id_reserva,this.res_valor,this.fecha_hora_inicio,this.fecha_hora_fin,this.observaciones,this.id_zona_social,this.nombre_zona});

  factory ListaReserva.fromJson(Map<String, dynamic> map) {
    return ListaReserva(
        id_reserva: map["id_reserva"], res_valor: map["res_valor"],fecha_hora_inicio:map['fecha_hora_inicio'],fecha_hora_fin: map["fecha_hora_fin"],observaciones: map["observaciones"],id_zona_social: map["id_zona_social"],nombre_zona: map["nombre_zona"]);
  }
   Map<String, dynamic> toJson() {
    return {"id_reserva": id_reserva,  "res_valor": res_valor, "fecha_hora_inicio":fecha_hora_inicio,"fecha_hora_fin": fecha_hora_fin, "observaciones": observaciones,"id_zona_social": id_zona_social,"nombre_zona":nombre_zona};
  }
}

String listaReservaToJson( String id) {
  final jsonData = {"id_subunidad":"16"};
  return json.encode(jsonData);
}

