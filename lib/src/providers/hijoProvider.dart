import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/hijo.dart';
import 'dart:convert';
import 'package:http/http.dart' as client;

class HijoProvider{
   final String baseUrl = "http://18.191.213.12//api";


  Future<List<Hijo>> getlistahijo() async {
    final Map<String, dynamic> authData = {
      "cedula": appData.cedula
    };
    final response = await client.post("$baseUrl/nucleo_familiar/list/hijos",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
        print(response.body);
    try{
      final decodedData = json.decode(response.body);
final entidades = new ListaHijo.fromJsonList(decodedData);

    return entidades.items.reversed.toList();
  
    }catch(e){
      return [];
    }
  }
}