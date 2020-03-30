import 'dart:convert';

import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/pedidoTaxi.dart';
import 'package:edificion247/src/models/zonaSocial.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:http/http.dart';

class ZonasSocialesProvider{

   final String baseUrl = "http://18.191.213.12//api";



Future<List<ZonaSocial>> getAllZonasSociales() async {
    final Map<String, dynamic> authData = {"id_subunidad": appData.idSubunidad};
    
    final response = await client.post(
        "$baseUrl/admin/zonas/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);
    final entidades = new ZonasSociales.fromJsonList(decodedData);

    return entidades.items.reversed.toList();
  }

  Future crearZonaSocial(inputNomen,inputValor,) async {
    final Map<String, dynamic> authData = {"InputId": appData.idZonaSocial!=null?appData.idZonaSocial:null,"InputNomen":inputNomen,"InputTipoZona":appData.tipo_zona,"InputValor":inputValor,"UnidadTiempo":1,"Estado":appData.estado_zona,
    "InputLunesStart":appData.hora_inicio_lunes!='Inicio'?appData.hora_inicio_lunes:null,"InputLunesEnd":appData.hora_final_lunes!='Fin'?appData.hora_final_lunes:null,"Lunes":appData.hora_inicio_lunes!='Inicio'?1:null,
    "InputMartesStart":appData.hora_inicio_martes!='Inicio'?appData.hora_inicio_martes:null,"InputMartesEnd":appData.hora_final_martes!='Fin'?appData.hora_final_martes:null, "Martes":appData.hora_inicio_martes!='Inicio'?1:null,
    "InputMiercolesStart":appData.hora_inicio_miercoles!='Inicio'?appData.hora_inicio_miercoles:null,"InputMiercolesEnd":appData.hora_final_miercoles!='Fin'?appData.hora_final_miercoles:null,"Miercoles":appData.hora_inicio_miercoles!='Inicio'?1:null,
    "InputJuevesStart":appData.hora_inicio_jueves!='Inicio'?appData.hora_inicio_jueves:null,"InputJuevesEnd":appData.hora_final_jueves!='Fin'?appData.hora_final_jueves:null,"Jueves":appData.hora_inicio_jueves!='Inicio'?1:null,
    "InputViernesStart":appData.hora_inicio_viernes!='Inicio'?appData.hora_inicio_viernes:null,"InputViernesEnd":appData.hora_final_viernes!='Fin'?appData.hora_final_viernes:null,"Viernes":appData.hora_inicio_viernes!='Inicio'?1:null,
    "InputSabadoStart":appData.hora_inicio_sabado!='Inicio'?appData.hora_inicio_sabado:null,"InputSabadoEnd":appData.hora_final_sabado!='Fin'?appData.hora_final_sabado:null,"Sabado":appData.hora_inicio_sabado!='Inicio'?1:null,
    "InputDomingoStart":appData.hora_inicio_domingo!='Inicio'?appData.hora_inicio_domingo:null,"InputDomingoEnd":appData.hora_final_domingo!='Fin'?appData.hora_final_domingo:null,"Domingo":appData.hora_inicio_domingo!='Inicio'?1:null};
    print(authData);
    final response = await client.post(
        "$baseUrl/admin/zonas/save",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
   
    final decodedData = json.decode(response.body);
    print(response.body);
    if(decodedData["resp"]=="ok"){
      return {"respuesta":"Zona social guardada correctamente"};
    }else{
      return {"respuesta":"Error al guardar, compruebe haber llenado los campos correctamente"};
    }

    
  }

  Future editarZonaSocial(zona) async {
    print(zona);
  }




}
