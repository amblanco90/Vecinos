import 'package:edificion247/src/constantes.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/sub-unidad.dart';
import 'package:edificion247/src/models/unidadmodel.dart';
import 'package:http/http.dart' as client;
import 'dart:convert';
class SubUnidadProvider{
   final String baseUrl = constantes.apiUrl;
  Future<String> setSubUnidad(DatosSubUnidad datosSubUnidad) async {
 
    final response = await client.post("$baseUrl/admin/subunidad/save",
        body: subUnidadToJsonLogin(datosSubUnidad),
        headers: {"Content-Type": "application/json"});
   print(response.body);
  if (response.statusCode == 200) {
    final datos = json.decode(response.body);
    if(datos["resp"]!="error"){
      return datos["msj"];
    }else{
      return datos["msj"];
    }
  } else {
    return "Ocurrio un error";
  }

  }

   
Future <Unidad> getUnidad() async {
    final Map<String, dynamic> authData = {"id_residente": appData.idUsuario , "id_subunidad": appData.idSubunidad};
    print(authData);
    final response = await client.post(
        "$baseUrl/unidad/get/basico",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);
    final entidades = new Unidad.fromJson(decodedData);

    return entidades;
  }


}