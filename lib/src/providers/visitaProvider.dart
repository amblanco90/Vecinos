import 'dart:convert';
import 'package:edificion247/src/constantes.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/visita.dart';
import 'package:http/http.dart' as client;
class VisitaProvider{
   final String baseUrl = constantes.apiUrl;


  Future<List<DatosVisita>> getlistavisitas() async {
    final Map<String, dynamic> authData = {
      "id_residente": appData.idUsuario
    };
     try{
    final response = await client.post("$baseUrl/visita/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
         print(response.body.toString());
    final decodedData = json.decode(response.body);
      final entidades = new ListaVisitante.fromJsonList(decodedData);
return entidades.items.reversed.toList();
    }catch(a){
      
        return [];
    }
  
  }
}
