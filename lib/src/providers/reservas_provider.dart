import 'dart:convert';

import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/visitas_models.dart';
import 'package:http/http.dart' as client;

class ReservasProvider{
 final String baseUrl = "http://18.191.213.12//api";

  Future<List<Reserva>> getAllReservas() async {

   final Map<String, dynamic> authData = {
      "id_subunidad": appData.idSubunidad
    };


 final response = await client.post("$baseUrl/reserva/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    final decodedData = json.decode(response.body);
    
    
    try{
      final entidades = new Reservas.fromJsonList(decodedData);
return entidades.items.reversed.toList();
    }catch(a){
      Future<List<Reserva>>  a;
      print(a);
        return a;
    }

  }

}

