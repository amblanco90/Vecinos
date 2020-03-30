import 'dart:convert';

Pqr pqrFromJson(String str) => Pqr.fromJson(json.decode(str));

String pqrToJson(Pqr data) => json.encode(data.toJson());

class Pqrs {
  List<Pqr> items = new List();

  Pqrs();
  Pqrs.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final reserva = new Pqr.fromJson(item);
      items.add(reserva);
    }
  }
}

class Pqr {
    int idResidente;
    int idSubunidad;
    int estado;
    String descripcion;
    String foto;
    String username;
    String fechaCreacion;

    Pqr({
        this.idResidente,
        this.idSubunidad,
        this.descripcion,
        this.estado,
        this.foto,
        this.username,
        this.fechaCreacion
    });

    factory Pqr.fromJson(Map<String, dynamic> json) => Pqr(
        idResidente: json["id_residente"],
        idSubunidad: json["id_subunidad"],
        descripcion: json["descripcion"],
        estado: json["estado"],
        foto: json["foto"]!=null?json["foto"]:'',
        fechaCreacion: json["fecha_creacion"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id_residente": idResidente,
        "id_subunidad": idSubunidad,
        "descripcion": descripcion,
        "foto": foto,
        "estado": estado,
        "username": username,
    };
}
