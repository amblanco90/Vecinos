import 'dart:convert';

import 'package:edificion247/src/constantes.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/visitas_models.dart';
import 'package:http/http.dart' as client;

class ReservasProvider{
 final String baseUrl = constantes.apiUrl;

  Future<List<Reserva>> getAllReservas() async {

   final Map<String, dynamic> authData = {
      "id_subunidad": appData.idSubunidad
    };


 final response = await client.post("$baseUrl/reserva/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
         print(response.body);
    try{
    final decodedData = json.decode(response.body);
    final entidades = new Reservas.fromJsonList(decodedData);
    return entidades.items.reversed.toList();
    }catch(a){
        return [];
    }

  }

  Future<List<Reserva>> getreservatodas() async {

   final Map<String, dynamic> authData = {
      "username": appData.cedula
    };

 final response = await client.post("$baseUrl/reserva/list/all",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    final decodedData = json.decode(response.body);
    
    
    print(response.body);
    try{
      final entidades = new Reservas.fromJsonList(decodedData);
      return entidades.items.reversed.toList();
    }catch(a){
        return null;
    }

  }

  Future<List<Reserva>> getreservatodasAdmin() async {

   final Map<String, dynamic> authData = {
      "username": appData.cedula
    };


 final response = await client.post("$baseUrl/admin/reserva/list/all",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    final decodedData = json.decode(response.body);
    
    
    try{
      final entidades = new Reservas.fromJsonList(decodedData);
      return entidades.items.reversed.toList();
    }catch(a){
      return null;
    }

  }

   Future<String> setAprobarReserva(String id_reserva) async {

   final Map<String, dynamic> authData = {
      "username": appData.cedula,
      "id_reserva":id_reserva
    };
 final response = await client.post("$baseUrl/admin/reserva/approve",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    final datos = json.decode(response.body);
    if(response.statusCode==200){
      try{
        if(datos['resp']=="ok"){
          return datos['msj'];
        }else{
          return datos['msj'];
        }
    }catch(a){
      return datos['Ocurrio un error'];
    }
    }else{
      return datos['Ocurrio un error'];
    }
    

  }

  Future<String> setCancelarReserva(String id_reserva) async {

   final Map<String, dynamic> authData = {
      "username": appData.cedula,
      "id_reserva":id_reserva
    };
 final response = await client.post("$baseUrl/admin/reserva/deny",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    final datos = json.decode(response.body);
    if(response.statusCode==200){
      try{
        if(datos['resp']=="ok"){
          return datos['msj'];
        }else{
          return datos['msj'];
        }
    }catch(a){
      return datos['Ocurrio un error'];
    }
    }else{
      return datos['Ocurrio un error'];
    }
    

  }

}

