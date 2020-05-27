import 'dart:convert';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/visita.dart';
import 'package:http/http.dart' as client;
class VisitaProvider{
   final String baseUrl = "http://18.191.213.12//api";


  Future<List<DatosVisita>> getlistavisitas() async {
    final Map<String, dynamic> authData = {
      "id_residente": appData.idUsuario
    };
    print(appData.idUsuario);
    final response = await client.post("$baseUrl/visita/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    final decodedData = json.decode(response.body);
    print(response.body.toString());

    try{
      final entidades = new ListaVisitante.fromJsonList(decodedData);
return entidades.items.reversed.toList();
    }catch(a){
      Future<List<DatosVisita>>  a;
        return a;
    }
  
  }
}
