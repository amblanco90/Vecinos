import 'dart:convert';

Cartelera carteleraFromJson(String str) => Cartelera.fromJson(json.decode(str));

String carteleraToJson(Cartelera data) => json.encode(data.toJson());

class ListCartelera {
  List<Cartelera> items = new List();

  ListCartelera();
  ListCartelera.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final reserva = new Cartelera.fromJson(item);
      items.add(reserva);
    }
  }
}

class Cartelera {
    Cartelera({
        this.idCartelera,
        this.titulo,
        this.descripcion,
        this.imagen,
        this.fechaCreacion,
    });

    int idCartelera;
    String titulo;
    String descripcion;
    dynamic imagen;
    String fechaCreacion;

    factory Cartelera.fromJson(Map<String, dynamic> json) => Cartelera(
        idCartelera: json["id_cartelera"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
        fechaCreacion: json["fecha_creacion"],
    );

    Map<String, dynamic> toJson() => {
        "id_cartelera": idCartelera,
        "titulo": titulo,
        "descripcion": descripcion,
        "imagen": imagen,
        "fecha_creacion": fechaCreacion,
    };
}