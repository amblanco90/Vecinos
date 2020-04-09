import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/respuestaPqr.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'dart:convert';
import 'package:http/http.dart';
import 'package:progress_dialog/progress_dialog.dart';
class RespuestaResidenteProvider{
  final String baseUrl = "http://18.191.213.12//api";
Future<List<RespuestaPqr>>  getHilo(id,context) async {

   


    final Map<String, dynamic> authData = {
      "id_pqr": id,
      "id_residente":appData.idUsuario
    };
    final response = await client.post("$baseUrl/residente/pqr/hilo/list",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
   print(response.body);
    final decodedData = json.decode(response.body);
    final entidades = new RespuestasPqr.fromJsonList(decodedData);

    return entidades.items;
  }


Future<Map<String, dynamic>> respuestaResidente(descripcion,idresidente,idPqr,foto,username,context) async {

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
  "descripcion": descripcion, 
  "id_residente":idresidente,
  "id_pqr":idPqr,
  "foto":foto==null?null:convertImage(foto),
  "username":username 

};

print(authData);
  pr.show();

    Client client = Client();
    final response = await client.post(
        "$baseUrl/residente/pqr/reply",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});

    final decodedData = json.decode(response.body);
    print(response.body);
    if(decodedData["resp"]=="ok"){
      return {"respuesta":"Respuesta guardada correctamente"};
    }else{
      return {"respuesta":"Error al guardar, compruebe haber llenado los campos correctamente"};
    }
    
    
        
}


Future<Map<String, dynamic>> respuestaAdmin(descripcion,idresidente,idPqr,foto,username,context) async {

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
  "descripcion": descripcion, 
  "id_administrador":idresidente,
  "id_pqr":idPqr,
  "foto":foto==null?null:convertImage(foto),
  "username":username 

};

print(authData);
  pr.show();

    Client client = Client();
    final response = await client.post(
        "$baseUrl/admin/pqr/reply",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});

    final decodedData = json.decode(response.body);
    print(response.body);
    if(decodedData["resp"]=="ok"){
      return {"respuesta":"Respuesta guardada correctamente"};
    }else{
      return {"respuesta":"Error al guardar, compruebe haber llenado los campos correctamente"};
    }
    
    
        
}


}