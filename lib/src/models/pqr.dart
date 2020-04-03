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
    int idPqr;
    String descripcion;
    int estado;
    int idTipoPqr;
    String destinatario;
    String fechaCreacion;
    String foto;

    Pqr({
        this.idPqr,
        this.descripcion,
        this.estado,
        this.idTipoPqr,
        this.destinatario,
        this.fechaCreacion,
        this.foto,
    });

    factory Pqr.fromJson(Map<String, dynamic> json) => Pqr(
        idPqr: json["id_pqr"],
        descripcion: json["descripcion"],
        estado: json["estado"],
        idTipoPqr: json["id_tipo_pqr"],
        destinatario: json["destinatario"],
        fechaCreacion: json["fecha_creacion"],
        foto: json["foto"],
    );

    Map<String, dynamic> toJson() => {
        "id_pqr": idPqr,
        "descripcion": descripcion,
        "estado": estado,
        "id_tipo_pqr": idTipoPqr,
        "destinatario": destinatario,
        "fecha_creacion": fechaCreacion,
        "foto": foto,
    };
}
