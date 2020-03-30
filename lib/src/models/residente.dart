import 'dart:convert';

Residente residenteFromJson(String str) => Residente.fromJson(json.decode(str));

String residenteToJson(Residente data) => json.encode(data.toJson());

class Residentes {
  List<Residente> items = new List();

  Residentes();
  Residentes.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final reserva = new Residente.fromJson(item);
      items.add(reserva);
    }
  }
}



class Residente {
    int id;
    int cedula;
    String nombres;
    String apellidos;
    String direccion;
    String telefono;
    String correo;
    int estado;

    Residente({
        this.id,
        this.cedula,
        this.nombres,
        this.apellidos,
        this.direccion,
        this.telefono,
        this.correo,
        this.estado,
    });

    factory Residente.fromJson(Map<String, dynamic> json) => Residente(
        id: json["id"],
        cedula: json["cedula"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        correo: json["correo"],
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cedula": cedula,
        "nombres": nombres,
        "apellidos": apellidos,
        "direccion": direccion,
        "telefono": telefono,
        "correo": correo,
        "estado": estado,
    };
}
