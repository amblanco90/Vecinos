
import 'package:edificion247/src/http/datos-login.dart';
import 'package:edificion247/src/http/datos-visitas.dart';
import 'package:edificion247/src/models/pedidoTaxi.dart';
import 'package:edificion247/src/pages/login/afterLogin.dart';
import 'package:edificion247/src/providers/perfilProvider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:progress_dialog/progress_dialog.dart';

import '../helpers/appdata.dart';
import '../helpers/appdata.dart';
import 'datos-familia.dart';
import 'datos-reserva.dart';

class ApiService {

  final perfilProvider = PerfilProvider();


  final String baseUrl = "http://18.191.213.12//api";
  Client client = Client();
Future<dynamic> borrarReserva(int id) async {
  final response = await client.post(
    "$baseUrl/reserva/delete",
    headers: {"content-type": "application/json"},
    body: json.encode({"id_reserva":id}),
  );
  if (response.statusCode == 200) {
    final datos = json.decode(response.body);
    try{
      if(datos['resp']){
      return null;
      }
    }catch(Exception){
      return datos;
    }
    
   
  } else {
    print('4');
    return null;
  }
}
Future<dynamic> borrarFamiliar(int id) async {
  final response = await client.post(
    "$baseUrl/nucleo_familiar/delete",
    headers: {"content-type": "application/json"},
    body: json.encode({"id_nucleo":id}),
  );
  if (response.statusCode == 200) {
    final datos = json.decode(response.body);
    try{
      if(datos['resp']){
      return null;
      }
    }catch(Exception){
      return datos;
    }
    
   
  } else {
    print('4');
    return null;
  }
}

Future<dynamic> solicitarlistaOtros(String id) async {
  final response = await client.post(
    "$baseUrl/nucleo_familiar/list/otros",
    headers: {"content-type": "application/json"},
    body: json.encode({"cedula":id}),
  );
  if (response.statusCode == 200) {
    final datos = json.decode(response.body);
    print(datos);
    try{
      if(datos['resp']){
      return null;
      }
    }catch(Exception){
      return datos;
    }
    
   
  } else {
    print('4');
    return null;
  }
}

Future<dynamic> solicitarlistaHijos(String id) async {
  final response = await client.post(
    "$baseUrl/nucleo_familiar/list/hijos",
    headers: {"content-type": "application/json"},
    body: json.encode({"cedula":id}),
  );
  if (response.statusCode == 200) {
    final datos = json.decode(response.body);
    print(datos);
    try{
      if(datos['resp']){
      return null;
      }
    }catch(Exception){
      return datos;
    }
    
   
  } else {
    print('4');
    return null;
  }
}


Future<dynamic> solicitarConyuge(String id) async {
  final response = await client.post(
    "$baseUrl/nucleo_familiar/get/conyuge",
    headers: {"content-type": "application/json"},
    body: json.encode({"cedula":id}),
  );
  if (response.statusCode == 200) {
    final datos = json.decode(response.body);
    print(datos);
    try{
      if(datos['resp']){
      return null;
      }
    }catch(Exception){
      return datos;
    }
    
   
  } else {
    print('4');
    return null;
  }
}

Future<List<dynamic>> listarVsitas(String id) async {
  final response = await client.post(
    "$baseUrl/visita/list",
    headers: {"content-type": "application/json"},
    body: json.encode({"id_residente":id}),
  );
  if (response.statusCode == 200) {
    final datos = json.decode(response.body);
    try{
         if(datos['resp'] == "error"){
      return null;
    }
    }catch(Exeption){
      return datos;
    }
   
  } else {
    return null;
  }
}

 Future<List<dynamic>> listarZona() async {
  final response = await client.post(
    "$baseUrl/zonas/list",
    headers: {"content-type": "application/json"},
  );
  if (response.statusCode == 200) {
    final datos = json.decode(response.body);
    return datos;  
  } else {
    return null;
  }
} 

Future<dynamic> getDisponibilidadZona(String id_zona,String fecha) async {
    final Map<String, dynamic> authData = {"id_zona":id_zona,"fecha":fecha};
    
    final response = await client.post(
        "$baseUrl/zonas/disponibilidad",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
        if (response.statusCode == 200) {
    final datos = json.decode(response.body);
    try{
         if(datos['resp'] == "error"){
      return datos['resp'];
    }
    }catch(Exeption){
      return datos;
    }
   
  } else {
    return null;
  }
    return json.decode(response.body);
  }

Future<List<dynamic>> listarReserva(String id) async {
  final response = await client.post(
    "$baseUrl/reserva/list",
    headers: {"content-type": "application/json"},
    body: json.encode({"id_subunidad":id}),
  );
  print(response.body);
  if (response.statusCode == 200) {
    final datos = json.decode(response.body);
    try{
         if(datos['resp'] == "error"){
      return null;
    }
    }catch(Exeption){
      return datos;
    }
   
  } else {
    return null;
  }
}

Future<String> guardarReserva(DatosReserva data) async {
  final response = await client.post(
    "$baseUrl/reserva/save",
    headers: {"content-type": "application/json"},
    body: reservaToJson(data),
  );
  
  if (response.statusCode == 200) {
    final datos = json.decode(response.body);
    if(datos["resp"]=="ok"){
      return 'ok';
    }else{
      return datos["msj"];
    }
  } else {
    return 'a ocurrido un error';
  }
}

Future<String> guardarFamiliar(id_nucleo,id_parentesco,id_residente,id_familiar,cedula_familiar,nombre_familiar,correo_familiar,movil_familiar,direccion_familiar) async {
  print(nombre_familiar);
  final response = await client.post(
    "$baseUrl/nucleo_familiar/save",
    headers: {"content-type": "application/json"},
    body: json.encode({
  "id_nucleo":id_nucleo,
  "id_parentesco": id_parentesco,
  "id_residente": id_residente,
  "id_familiar":id_familiar,
  "cedula_familiar": cedula_familiar,
  "nombre_familiar": nombre_familiar,
  "apellidos_familiar": "",
  "correo_familiar": correo_familiar,
  "movil_familiar": movil_familiar,
  "direccion_familiar": direccion_familiar,
  "username": appData.cedula
}),
  );
  print(response.body);
  if (response.statusCode == 200) {
    final datos = json.decode(response.body);
    print(response.body);
    if(datos["msj"]=="ok"){
      return "";
    }else{
      return datos["msj"];
    }
  } else {
    return "a ocurrido un error";
  }
}
Future<bool> createProfile(DatosVisitas data) async {
  final response = await client.post(
    "$baseUrl/visita/save",
    headers: {"content-type": "application/json"},
    body: profileToJson(data),
  );
  print(response.body);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
Future<bool> login(DatosLogin datosLogin,ProgressDialog pr, context,usuario,password,estado) async {
  pr.show();
  final response = await client.post(
    "$baseUrl/usuario/login",
    headers: {"content-type": "application/json"},
    body:profileToJsonLogin(datosLogin),
  );
  print(response.body);
  if (response.statusCode == 200) {
    final datos = json.decode(response.body);
    if(datos["resp"]=="ok"){ 
      appData.idUsuario = datos["id"];
      appData.saldo = datos["lista_subunidades"][0]["saldo"];
      appData.tipoUnidad = datos["lista_subunidades"][0]["nombre_tipo_unidad"];
      appData.idSubunidad= datos["lista_subunidades"][0]["id_subunidad"];
      appData.nombreSubUnidad = datos["lista_subunidades"][0]["nombre_subunidad"];
      appData.unidadInicial = datos["lista_subunidades"][0];
      appData.idUnidad=datos["id_unidad"];
      appData.url_pago=datos["url_pago"];
      for (var item in datos["lista_subunidades"]) {
        
        appData.unidades.add(item);
      }
      //print(appData.unidades);

      
      appData.cedula= datos["cedula"];
      if(datos["perfiles"].length==1){

        appData.permisos='Residente';

      }else{
        appData.permisos='Administrador';
      }
      
      final prefs = await SharedPreferences.getInstance();
      if(estado == true){
        prefs.setString('usuario', usuario);
      prefs.setString('password', password);
      }else{
         prefs.remove("usuario");
      prefs.remove('password');
      }
      perfilProvider.getPerfilResidente().then((value){
         pr.dismiss();
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AfterLoginPage() ));
         return true;
      });
     

      
    }else{
      pr.dismiss();
      return false;
     
    }
  } else {
    pr.dismiss();
    return false;
  }
}

}