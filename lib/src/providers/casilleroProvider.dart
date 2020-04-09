import 'dart:convert';

import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/pedidoTaxi.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:http/http.dart';

class CasilleroProvider{

   final String baseUrl = "http://18.191.213.12//api";

Future<List<PedidoTaxi>> getAllCasillero() async {
    final Map<String, dynamic> authData = {"id_subunidad": appData.idSubunidad};
    final response = await client.post(
        "$baseUrl/subunidad/casillero/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);

    if(decodedData["resp"]=='error'){

      return null;



    }else{

      final entidades = new PedidosTaxis.fromJsonList(decodedData);
      return entidades.items;

    }

    
   

    
  }


}
