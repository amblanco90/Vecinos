import 'dart:convert';

import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/pedidoTaxi.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:http/http.dart';

 class EmergenciaProvider{

  final String baseUrl = "http://18.191.213.12//api";

  Future generarEmergencia(BuildContext context, String mensaje) async {

  
  final Map<String, dynamic> authData = {"id_residente": appData.idUsuario,"id_subunidad":appData.idSubunidad, "mensaje":mensaje, "username": appData.nombre + " "+appData.apellido};
  print(authData);
    Client client = Client();
    final response = await client.post(
        "$baseUrl/residente/panico/save",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    
   final decodedData = json.decode(response.body);

   print(decodedData);

   return decodedData;



    
        
}

 }