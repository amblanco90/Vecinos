import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/facturas.dart';
import 'dart:convert';
import 'package:http/http.dart' as client;
class FacturaProvider{
   final String baseUrl = "http://18.191.213.12//api";

   Future<List<DatosFacturas>> getlistafactura() async{
     final Map<String, dynamic> authData = {
      "id_subunidad": appData.idSubunidad
    };
    final response = await client.post("$baseUrl/factura/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    List<dynamic>decodedData = json.decode(response.body);
    final entidades=new ListaFacturas.fromJsonList(decodedData);
    return entidades.items.reversed.toList();
   }
}