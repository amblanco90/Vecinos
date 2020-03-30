import 'package:edificion247/src/models/listasubunidad.dart';
import 'dart:convert';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:http/http.dart' as client;
class ListaSubUnidadProvider{
   final String baseUrl = "http://18.191.213.12//api";


  Future<List<DatosListaSubunidades>> getlistasubunidades() async {
    final Map<String, dynamic> authData = {
      "cedula": appData.cedula
    };
    final response = await client.post("$baseUrl/admin/subunidad/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
   final decodedData = json.decode(response.body);
    print(response.body.toString());

    try{
      final entidades = new ListaSubunidades.fromJsonList(decodedData);
return entidades.items.reversed.toList();
    }catch(a){
      Future<List<DatosListaSubunidades>>  a;
        return a;
    }            
  
  }
}