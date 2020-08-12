import 'dart:convert';
import 'dart:typed_data';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/perfilResidente.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:shared_preferences/shared_preferences.dart';


class PerfilProvider{

  final _url = 'http://18.191.213.12//api';
  
  Future<PerfilResidente> getPerfilResidente() async {

    final Map<String, dynamic> authData = {"cedula": appData.cedula};
    final prefs = await SharedPreferences.getInstance();
    final response = await client.post(
        "$_url/residente/get",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});

    
    final decodedData = json.decode(response.body);
    final respueta = new PerfilResidente.fromJson(decodedData);
   
    prefs.setString('nombre', respueta.inputName);
    appData.nombre = respueta.inputName;

    prefs.setString('apellido', respueta.inputApe);
    appData.apellido = respueta.inputApe;
    if(respueta.inputFoto!=''){
      appData.fotoPerfil = base64.decode(respueta.inputFoto);
      String foto = new String.fromCharCodes(appData.fotoPerfil);
      prefs.setString('foto', foto);
    } 
    return respueta;

  }

  Future editarPerfilResidente(nombre, apellido, dir, tel, correo) async {

    final  Map<String, dynamic> authData = {
        "InputId": appData.idUsuario,
        "InputCed": appData.cedula,
        "InputName": nombre,
        "InputApe": apellido,
        "InputDir": dir,
        "InputTel": tel,
        "InputEmail": correo,
        "Estado": appData.estado,
        "InputFoto": appData.encodedFotoPerfil,
    };

    

    

    final response = await client.post(
        "$_url/residente/perfil/editar",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});

    
    appData.fotoPerfil = base64.decode(appData.encodedFotoPerfil);
    appData.nombre = nombre;
    appData.apellido = apellido;
    
    final decodedData = json.decode(response.body);
    print(decodedData);
    print(appData.idUsuario);

    
    

  }



}