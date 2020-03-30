import 'package:edificion247/src/models/propietario.dart';
import 'package:http/http.dart' as client;
import 'dart:convert';
class PropitarioProvider{
  final String baseUrl = "http://18.191.213.12//api";
  Future<DatosPropietario> getPropitario(String cedula) async {
    final Map<String, dynamic> authData = {
      "cedula": cedula
    };
    final response = await client.post("$baseUrl/admin/subunidad/propietario/get",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    final decodedData = json.decode(response.body);
    final propitario=new DatosPropietario.fromJson(decodedData);
    return propitario;
  }
}