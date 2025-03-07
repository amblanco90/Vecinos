import 'dart:convert';

import 'package:edificion247/src/constantes.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/conyugue.dart';
import 'package:http/http.dart' as client;
class ConyugeProvider{
  final String baseUrl = constantes.apiUrl;


  Future<Conyuge> getConyuge() async {
    final Map<String, dynamic> authData = {
      "cedula": appData.cedula
    };
    final response = await client.post("$baseUrl/nucleo_familiar/get/conyuge",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
        print(response.body);
    final decodedData = json.decode(response.body);
    final conyuge=new Conyuge.fromJson(decodedData);

    return conyuge;
  }
}