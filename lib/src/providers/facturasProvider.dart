import 'package:edificion247/src/constantes.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/facturas.dart';
import 'dart:convert';
import 'package:http/http.dart' as client;
class FacturaProvider{
   final String baseUrl = constantes.apiUrl;

   Future<DatosFacturas> getlistafactura() async{
     final Map<String, dynamic> authData = {
      "id_subunidad": appData.idSubunidad
    };
    final response = await client.post("$baseUrl/factura/get/actual",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
       if (response.statusCode ==200){
          try{
    final decodedData = json.decode(response.body);
    final entidades=new DatosFacturas.fromJson(decodedData);
    return entidades;  

     }catch(a){
    return null;
    }
       }else{
         return null;
       }
   }
}