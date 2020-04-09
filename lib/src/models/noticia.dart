import 'dart:convert';

Noticia noticiasFromJson(String str) => Noticia.fromJson(json.decode(str));

String noticiasToJson(Noticia data) => json.encode(data.toJson());

class Noticias {
  List<Noticia> items = new List();

  Noticias();
  Noticias.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final reserva = new Noticia.fromJson(item);
      items.add(reserva);
    }
  }
}
class Noticia {
    String descripcion;
    String titulo;
    String fechaCreacion;

    Noticia({
        this.descripcion,
        this.titulo,
        this.fechaCreacion,
    });

    factory Noticia.fromJson(Map<String, dynamic> json) => Noticia(
        descripcion: json["descripcion"],
        titulo: json["titulo"],
        fechaCreacion: json["fecha_creacion"],
    );

    Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "titulo": titulo,
        "fecha_creacion": fechaCreacion,
    };
}
