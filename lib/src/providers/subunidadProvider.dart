import 'package:edificion247/src/models/sub-unidad.dart';
import 'package:http/http.dart' as client;
import 'dart:convert';
class SubUnidadProvider{
   final String baseUrl = "http://18.191.213.12//api";
  Future<bool> setSubUnidad(DatosSubUnidad datosSubUnidad) async {
 
    final response = await client.post("$baseUrl/admin/subunidad/save",
        body: subUnidadToJsonLogin(datosSubUnidad),
        headers: {"Content-Type": "application/json"});
   print(response.body);
  if (response.statusCode == 200) {
    final datos = json.decode(response.body);
    if(datos["resp"]=="ok"){
      return true;
    }else{
      return false;
    }
  } else {
    return false;
  }

  }
}