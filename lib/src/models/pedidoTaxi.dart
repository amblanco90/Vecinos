
import 'dart:convert';

PedidoTaxi pedidoTaxiFromJson(String str) => PedidoTaxi.fromJson(json.decode(str));

String pedidoTaxiToJson(PedidoTaxi data) => json.encode(data.toJson());


class PedidosTaxis {
  List<PedidoTaxi> items = new List();

  PedidosTaxis();
  
  PedidosTaxis.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {

      if(item["id_tipo_casillero"]==1){
        print('taxi');

      }else{

        final reserva = new PedidoTaxi.fromJson(item);
        items.add(reserva);

      }
     
      
    }
  }
  PedidosTaxis.fromJsonListNotificaciones(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {

        final reserva = new PedidoTaxi.fromJson(item);
        items.add(reserva);

      
     
      
    }
  }



}

class PedidoTaxi {
    int idCasillero;
    dynamic titulo;
    String descripcion;
    int idTipoCasillero;
    int estado;
    String fechaCreacion;

    PedidoTaxi({
        this.idCasillero,
        this.titulo,
        this.descripcion,
        this.idTipoCasillero,
        this.estado,
        this.fechaCreacion,
    });

    factory PedidoTaxi.fromJson(Map<String, dynamic> json) => PedidoTaxi(
        idCasillero: json["id_casillero"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        idTipoCasillero: json["id_tipo_casillero"],
        estado: json["estado"],
        fechaCreacion: json["fecha_creacion"],
    );

    Map<String, dynamic> toJson() => {
        "id_casillero": idCasillero,
        "titulo": titulo,
        "descripcion": descripcion,
        "id_tipo_casillero": idTipoCasillero,
        "estado": estado,
        "fecha_creacion": fechaCreacion,
    };
}
