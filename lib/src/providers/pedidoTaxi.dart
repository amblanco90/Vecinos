import 'dart:convert';

import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/pedidoTaxi.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:http/http.dart';

class PedidoTaxiProvider{

   final String baseUrl = "http://18.191.213.12//api";

  Future<Map<String, dynamic>> pedirTaxi(BuildContext context, String observaciones) async {
  final Map<String, dynamic> authData = {"id_residente": appData.idUsuario, "id_subunidad": appData.idSubunidad, "observaciones": observaciones, "username": appData.cedula, "id_perfil":appData.rol=='Residente'?100:300};

    Client client = Client();
    final response = await client.post(
        "$baseUrl/residente/taxi/pedir",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
        
}

Future<Map<String, dynamic>> eliminarPedidoTaxi(BuildContext context, id) async {
  final Map<String, dynamic> authData = {"id_taxi": id};

    Client client = Client();
    final response = await client.post(
        "$baseUrl/residente/taxi/delete",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);
    if(decodedData["resp"]=="ok"){
      return {"respuesta":"Pedido cancelado correctamente"};
    }else{
      return {"respuesta":"Error eliminar"};
    }
    
        
}

Future<List<PedidoTaxi>> getAllPedidosTaxi() async {
    final Map<String, dynamic> authData = {"id_subunidad": appData.idSubunidad,
                                           "id_residente":appData.idUsuario, "id_perfil":appData.rol=='Residente'?100:300};
    final response = await client.post(
        "$baseUrl/residente/taxi/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);
    final entidades = new PedidosTaxis.fromJsonList(decodedData);

    return entidades.items.reversed.toList().take(15).toList();
  }


}
