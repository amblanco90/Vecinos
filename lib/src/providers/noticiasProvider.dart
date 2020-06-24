import 'dart:convert';
import 'dart:io';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/cartelera.dart';
import 'package:edificion247/src/models/noticia.dart';
import 'package:edificion247/src/models/pqr.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:http/http.dart';

class NoticiasProvider {
  final String baseUrl = "http://18.191.213.12//api";


  Future<List<Cartelera>> getAllNoticias() async {
    final Map<String, dynamic> authData = {
      "id_subunidad": appData.idSubunidad
    };
    print(appData.idSubunidad.toString());
    final response = await client.post("$baseUrl/unidad/noticias/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);
   

    final entidades = new ListCartelera.fromJsonList(decodedData);

    return entidades.items.reversed.toList();
  }   

  Future<List<Cartelera>> getAllNoticiasAdmin() async {
    final Map<String, dynamic> authData = {
      "username": appData.cedula

    };
    print(appData.idSubunidad.toString());
    final response = await client.post("$baseUrl/admin/cartelera/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);
   

    final entidades = new ListCartelera.fromJsonList(decodedData);

    return entidades.items.reversed.toList();
  }   

  Future<void> generarNoticia(
      BuildContext context, String titulo, String descripcion, String vencimiento, File image) async {
    convertImage(image) {
      List<int> imageBytes = image.readAsBytesSync();
      String base64Image = base64.encode(imageBytes);
      print(base64Image);
      return base64Image;
    }

    final Map<String, dynamic> authData = {

      "username": appData.cedula,
      "InputTitulo": titulo,
      "InputDescripcion": descripcion,
      "InputImagen":  image != null ? convertImage(image) : '',
      "InputVencimiento": vencimiento,
      "InputEstado": 1
     
      
    };

    print(authData);

    Client client = Client();
    final response = await client.post("$baseUrl/admin/cartelera/save",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});

    print(response.body);
  }

  Future<Map<String, dynamic>> eliminarNoticia(BuildContext context, id) async {
  final Map<String, dynamic> authData = {
    "username":appData.cedula,
    "id_cartelera": id};

    Client client = Client();
    final response = await client.post(
        "$baseUrl/admin/cartelera/delete",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);
    if(decodedData["resp"]=="ok"){
      return {"respuesta":"Noticia eliminada correctamente"};
    }else{
      return {"respuesta":"Error eliminar"};
    }
    
        
}

  
  }
