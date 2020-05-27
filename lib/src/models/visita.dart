class DatosVisita{
  String nombre;
  String nombre_visitante;
  int id;
  int identificacion;
  String foto;
  String fecha;

  DatosVisita({this.id,this.nombre,this.nombre_visitante,this.foto,this.identificacion,this.fecha});

  factory DatosVisita.fromJson(Map<String, dynamic> json)=> DatosVisita(
    id: json['id'],
    nombre: json['nombre'],
    nombre_visitante: json['nombre_visitante'],
    foto: json['foto'],
    identificacion:json['identificacion'],
    fecha:json['fecha'],
  );
}

class ListaVisitante {
  List<DatosVisita> items=new List();
    ListaVisitante();
     ListaVisitante.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final reserva = new DatosVisita.fromJson(item);
      items.add(reserva);
    }
  }
    }