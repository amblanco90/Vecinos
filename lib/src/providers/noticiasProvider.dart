import 'dart:convert';
import 'dart:io';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/noticia.dart';
import 'package:edificion247/src/models/pqr.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:http/http.dart';

class NoticiasProvider {
  final String baseUrl = "http://18.191.213.12//api";


  Future<List<Noticia>> getAllNoticias() async {
    final Map<String, dynamic> authData = {
      "id_subunidad": appData.idSubunidad
    };
    final response = await client.post("$baseUrl/unidad/noticias/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);
   

    final entidades = new Noticias.fromJsonList(decodedData);

    return entidades.items.reversed.toList();

  }
  }
