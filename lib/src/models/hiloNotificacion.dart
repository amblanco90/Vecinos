
import 'dart:convert';

HiloNotificacion hiloNotificacionFromJson(String str) => HiloNotificacion.fromJson(json.decode(str));

String hiloNotificacionToJson(HiloNotificacion data) => json.encode(data.toJson());

class ListHiloNotificacion {
  List<HiloNotificacion> items = new List();

  ListHiloNotificacion();
  ListHiloNotificacion.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final reserva = new HiloNotificacion.fromJson(item);
      items.add(reserva);
    }
  }
}

class HiloNotificacion {
    String emisor;
    String rolEmisor;
    String mensaje;
    int estado;
    String fechaCreacion;
    dynamic foto;

    HiloNotificacion({
        this.emisor,
        this.rolEmisor,
        this.mensaje,
        this.estado,
        this.fechaCreacion,
        this.foto,
    });

    factory HiloNotificacion.fromJson(Map<String, dynamic> json) => HiloNotificacion(
        emisor: json["emisor"],
        rolEmisor: json["rol_emisor"],
        mensaje: json["mensaje"],
        estado: json["estado"],
        fechaCreacion: json["fecha_creacion"],
        foto: json["foto"],
    );

    Map<String, dynamic> toJson() => {
        "emisor": emisor,
        "rol_emisor": rolEmisor,
        "mensaje": mensaje,
        "estado": estado,
        "fecha_creacion": fechaCreacion,
        "foto": foto,
    };
}
