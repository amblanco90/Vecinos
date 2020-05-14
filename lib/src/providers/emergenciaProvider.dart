import 'dart:convert';

import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/pedidoTaxi.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:http/http.dart';

 class EmergenciaProvider{

  final String baseUrl = "http://18.191.213.12//api";

  Future generarEmergencia(BuildContext context, String mensaje) async {

  
  final Map<String, dynamic> authData = {"id_residente": appData.idUsuario,"id_subunidad":appData.idSubunidad, "mensaje":mensaje, "username": appData.cedula,"id_perfil":appData.rol=="Residente"?100:300};
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

Future cancelarEmergencia(BuildContext context, String mensaje,id) async {

  
  final Map<String, dynamic> authData = {"id_residente": appData.idUsuario,"id_casillero":id, "mensaje":mensaje, "username": appData.cedula};
  print(authData);
    Client client = Client();
    final response = await client.post(
        "$baseUrl/residente/panico/cancel",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    
   final decodedData = json.decode(response.body);

   print(decodedData);

   return decodedData;



    
        
}

 }