class DatosFacturas{
  int id_factura;
  String fecha_factura;
  int total;
  int saldo;
  String nombre;
  String nombre_unidad;
  List<dynamic>conceptos;
  String estado;
  DatosFacturas({this.id_factura,this.fecha_factura,this.total,this.conceptos,this.saldo,this.nombre,this.nombre_unidad,this.estado});
  factory DatosFacturas.fromJson(Map<String,dynamic> json) =>DatosFacturas(
    id_factura: json['FacturaId'],
    fecha_factura: json['FechaFactura'],
    total: json['Total'],
    saldo: json['Saldo'],
    conceptos: json["Conceptos"],
    nombre: json['NameResidente'],
    nombre_unidad:json['NameUnidad'],
    estado: json['FacturaEstado']

  );
}


class DatosConceptos{
  int id_detalle;
  String concepto;
  int valor;
  DatosConceptos({this.concepto,this.id_detalle,this.valor});
  factory DatosConceptos.fromJson(Map<String,dynamic> json)=> DatosConceptos(
    id_detalle: json['id_concepto'],
    concepto: json['concepto'],
    valor: json['valor']
  );
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