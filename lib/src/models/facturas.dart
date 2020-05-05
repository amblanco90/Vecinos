class DatosFacturas{
  int id_factura;
  String fecha_factura;
  int total;
  int saldo;
  List<dynamic>conceptos;
  DatosFacturas({this.id_factura,this.fecha_factura,this.total,this.conceptos,this.saldo});
  factory DatosFacturas.fromJson(Map<String,dynamic> json) =>DatosFacturas(
    id_factura: json['id_factura'],
    fecha_factura: json['fecha_factura'],
    total: json['total'],
    saldo: json['saldo'],
    conceptos: json['conceptos']
  );
}


class DatosConceptos{
  int id_detalle;
  String concepto;
  int valor;
  DatosConceptos({this.concepto,this.id_detalle,this.valor});
  factory DatosConceptos.fromJson(Map<String,dynamic> json)=> DatosConceptos(
    id_detalle: json['id_detalle'],
    concepto: json['concepto'],
    valor: json['valor']
  );
}
class ListaFacturas{
  List<DatosFacturas> items=new List();
  ListaFacturas();
  ListaFacturas.fromJsonList(List<dynamic> jsonlist){
    if(jsonlist == null)return;

    for(var item in jsonlist){
      final factura=new DatosFacturas.fromJson(item);
      items.add(factura);
    }
  }
}

class ListaConceptos{
  List<DatosConceptos> items=new List();
  ListaConceptos();
  ListaConceptos.fromJsonList(List<dynamic> jsonlist){
    if(jsonlist == null)return;

    for(var item in jsonlist){
      final conceptos=new DatosConceptos.fromJson(item);
      items.add(conceptos);
    }
  }
}