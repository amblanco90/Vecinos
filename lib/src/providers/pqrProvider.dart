import 'dart:convert';
import 'dart:io';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/pqr.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:http/http.dart';

class PqrProvider {
  final String baseUrl = "http://18.191.213.12//api";

  Future<void> generarPqr(
      BuildContext context, String descripcion, File image) async {
    convertImage(image) {
      List<int> imageBytes = image.readAsBytesSync();
      String base64Image = base64.encode(imageBytes);
      print(base64Image);
      return base64Image;
    }

    final Map<String, dynamic> authData = {

      "id_residente": appData.idUsuario,
      "id_subunidad": appData.idSubunidad,
      "descripcion": descripcion,
      "dirigido_a": appData.dirigido_a,
      "id_tipo_pqr":appData.tipo_pqr,
      "username": appData.cedula,
      "foto": image != null ? convertImage(image) : '',
    };

    print(authData);

    Client client = Client();
    final response = await client.post("$baseUrl/residente/pqr/save",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});

    print(response.body);
  }

  Future<List<Pqr>> getAllPqrs() async {
    final Map<String, dynamic> authData = {
      "id_residente": appData.idUsuario,
      "id_subunidad": appData.idSubunidad
    };
    final response = await client.post("$baseUrl/residente/pqr/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);
    
      final entidades = new Pqrs.fromJsonList(
           decodedData);
      
      return entidades.items.reversed.toList();
     
  }
}
