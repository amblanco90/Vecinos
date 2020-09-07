import 'dart:convert';

import 'package:edificion247/src/constantes.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/pedidoTaxi.dart';
import 'package:edificion247/src/models/residente.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:http/http.dart';

class ResidentesProvider{

   final String baseUrl = constantes.apiUrl;

  Future<Map<String, dynamic>> crearResidente(BuildContext context,cedula,nombre,apellido,direccion,telefono,email) async {
  final Map<String, dynamic> authData = {
  "InputId": appData.idNuevoResidente, 
  "InputCed":cedula , 
  "InputName": nombre, 
  "InputApe": apellido, 
  "InputDir": direccion, 
  "InputTel": telefono ,
  "InputEmail": email,
  "Estado": appData.idEstadoNuevoResidente ,
  "UnidadResidente": appData.idSubunidad
};

print(authData);

    Client client = Client();
    final response = await client.post(
        "$baseUrl/admin/residente/save",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});

    final decodedData = json.decode(response.body);
    print(response.body);
    if(decodedData["resp"]=="ok"){
      return {"respuesta":"Residente guardado correctamente"};
    }else{
      return {"respuesta":"Error al guardar, compruebe haber llenado los campos correctamente"};
    }
    
    
        
}

Future<List<Residente>> getAllResidentes() async {
    final Map<String, dynamic> authData = {"id_subunidad": appData.idSubunidad};
    final response = await client.post(
        "$baseUrl/admin/residente/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);
    final entidades = new Residentes.fromJsonList(decodedData);

    return entidades.items.reversed.toList();
  }


}
