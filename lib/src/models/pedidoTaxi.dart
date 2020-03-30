
import 'dart:convert';

PedidoTaxi pedidoTaxiFromJson(String str) => PedidoTaxi.fromJson(json.decode(str));

String pedidoTaxiToJson(PedidoTaxi data) => json.encode(data.toJson());


class PedidosTaxis {
  List<PedidoTaxi> items = new List();

  PedidosTaxis();
  PedidosTaxis.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final reserva = new PedidoTaxi.fromJson(item);
      items.add(reserva);
    }
  }
}

class PedidoTaxi {
    int idCasillero;
    String descripcion;
    String fechaCreacion;
    int estado;

    PedidoTaxi({
        this.idCasillero,
        this.descripcion,
        this.fechaCreacion,
        this.estado
    });

    factory PedidoTaxi.fromJson(Map<String, dynamic> json) => PedidoTaxi(
        idCasillero: json["id_casillero"],
        descripcion: json["descripcion"],
        fechaCreacion: json["fecha_creacion"],
        estado: json["estado"]
    );

    Map<String, dynamic> toJson() => {
        "id_casillero": idCasillero,
        "descripcion": descripcion,
        "fecha_creacion": fechaCreacion,
        "estado": estado
    };
}
