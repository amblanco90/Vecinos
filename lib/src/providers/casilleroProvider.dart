import 'dart:convert';

import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/hiloNotificacion.dart';
import 'package:edificion247/src/models/pedidoTaxi.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:http/http.dart';
import 'package:progress_dialog/progress_dialog.dart';

class CasilleroProvider{

   final String baseUrl = "http://18.191.213.12//api";

Future<List<PedidoTaxi>> getAllCasillero() async {
    final Map<String, dynamic> authData = {"id_subunidad": appData.idSubunidad, 
    "id_residente":appData.idUsuario ,"id_perfil":appData.rol=='Residente'?100:300};
    final response = await client.post(
        "$baseUrl/subunidad/casillero/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);

    if(decodedData[0]["resp"]!=null){

      return null;



    }else{

      final entidades = new PedidosTaxis.fromJsonList(decodedData);
      return entidades.items;

    }


  

    
   

    
  }



Future<List<PedidoTaxi>> getAllEmergencias() async {
    final Map<String, dynamic> authData = {"id_subunidad": appData.idSubunidad, "id_residente":appData.idUsuario,
     "username": appData.cedula,"id_perfil":appData.rol=="Residente"?100:300};
    final response = await client.post(
        "$baseUrl/residente/panico/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);

    if(decodedData[0]["resp"]!=null){

      return null;



    }else{

      final entidades = new PedidosTaxis.fromJsonList(decodedData);
      return entidades.items;

    }


  

    
   

    
  }

  

Future<Map<String, dynamic>> respuestaNotificacion(descripcion,idresidente,id,foto,username,context) async {

    ProgressDialog pr;

  pr = new ProgressDialog(context);
  pr.style(
      message: 'Guardando...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
      ),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w600));

  convertImage(image) {
      List<int> imageBytes = image.readAsBytesSync();
      String base64Image = base64.encode(imageBytes);
      print(base64Image);
      return base64Image;
    }
  final Map<String, dynamic> authData = {
 
  "id_casillero":id,
  "descripcion": descripcion, 
  "emisor":appData.nombre+" "+ appData.apellido,
  "rol_emisor":appData.rol,
  "foto":null,
  "username": appData.cedula 

};

print(authData);
  pr.show();

    Client client = Client();
    final response = await client.post(
        "$baseUrl/residente/notificacion/reply",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});

    final decodedData = json.decode(response.body);
    print(response.body);
    if(decodedData["resp"]=="ok"){
      pr.hide();
      return {"respuesta":"Respuesta guardada correctamente"};
    }else{
      pr.hide();
      return {"respuesta":"Error al guardar, compruebe haber llenado los campos correctamente"};
    }
    
    
        
}



Future<List<PedidoTaxi>> getAllNotificaciones() async {
    final Map<String, dynamic> authData = {"id_subunidad": appData.idSubunidad, "id_residente":appData.idUsuario,"id_perfil":appData.rol=='Residente'?100:300};
     print(authData);
    final response = await client.post(
        "$baseUrl/subunidad/casillero/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);

    if(decodedData[0]["resp"]!=null){

      return null;



    }else{

      final entidades = new PedidosTaxis.fromJsonListNotificaciones(decodedData);
      return entidades.items;

    }


}


Future<List<HiloNotificacion>> getAllHiloNotificaciones(id) async {
    final Map<String, dynamic> authData = {"id_casillero": id, "id_residente":appData.idUsuario};
     print(authData);
    final response = await client.post(
        "$baseUrl/residente/notificacion/hilo/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);
    
    if(decodedData[0]["resp"]!=null){

      return null;



    }else{

      final entidades = new ListHiloNotificacion.fromJsonList(decodedData);
      return entidades.items;

    }


}


Future<List<PedidoTaxi>> getAllNotificacionesEnviadas() async {
    final Map<String, dynamic> authData = {"id_subunidad": appData.idSubunidad, "id_residente":appData.idUsuario,"id_perfil":appData.rol=='Residente'?100:300};
     print(authData);
    final response = await client.post(
        "$baseUrl/subunidad/casillero/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
    final decodedData = json.decode(response.body);

    if(decodedData[0]["resp"]!=null){

      return null;



    }else{

      final entidades = new PedidosTaxis.fromJsonListNotificacionesEnviadas(decodedData);
      return entidades.items;

    }


}



}