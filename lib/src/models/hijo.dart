import 'dart:convert';
class ListaHijo {
  List<Hijo> items=new List();
    ListaHijo();
     ListaHijo.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final reserva = new Hijo.fromJson(item);
      items.add(reserva);
    }
  }
    }
  
 

class Hijo{
  int  id_nucleo;
  int  id_parentesco;
  String parentesco;
  int  id_persona_familiar;
  String nombre_familiar;
  int  estado;
  String correo;
  String movil;
  int documento;
  bool estado_solicitud;
  String mensaje_solicitud;

  Hijo({
    this.id_nucleo,
    this.id_parentesco,
    this.parentesco,
    this.id_persona_familiar,
    this.nombre_familiar,
    this.estado,
    this.correo,
    this.movil,
    this.documento,
    this.estado_solicitud
  });
  factory Hijo.fromJson(Map<String, dynamic> json)=> Hijo(
    id_nucleo: json['id_nucleo'],
    id_parentesco: json['id_parentesco'],
    parentesco: json['parentesco'],
    id_persona_familiar: json['id_persona_familiar'],
    nombre_familiar: json['nombre_familiar'],
    estado: json['estado'],
    correo: json['correo'],
    movil: json['movil'],
    documento:json['documento'],
  );

}


