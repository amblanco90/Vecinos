import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/hijo.dart';
import 'dart:convert';
import 'package:http/http.dart' as client;

class HijoProvider{
   final String baseUrl = "http://18.191.213.12//api";


  Future<List<Hijo>> getlistahijo() async {
    final Map<String, dynamic> authData = {
      "cedula": appData.cedula
    };
    final response = await client.post("$baseUrl/nucleo_familiar/list/hijos",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
        print(response.body);
    try{
      final decodedData = json.decode(response.body);
final entidades = new ListaHijo.fromJsonList(decodedData);

    return entidades.items.reversed.toList();
  
    }catch(e){
      return [];
    }
  }

  Future<Hijo> getHijo(String cedula) async {
    final Map<String, dynamic> authData = {
      "cedula_familiar": cedula
    };
    final response = await client.post("$baseUrl/familiar/check",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
        print(response.body);

        Hijo datosHijos=Hijo();

        try{
              if (response.statusCode == 200) {
                final datos = json.decode(response.body);
                  if(datos["resp"]=="error"){
                    datosHijos.estado_solicitud=false;
                    datosHijos.mensaje_solicitud=datos["msj"];
                    return datosHijos;
                  }
                  else{
                    final decodedData = json.decode(response.body);
                      final hijodatos = new Hijo.fromJson(decodedData);
                      hijodatos.estado_solicitud=true;
                      hijodatos.nombre_familiar=decodedData['nombre'];
                    return hijodatos;
                    
                  }
              } else {
                datosHijos.estado_solicitud=false;
                datosHijos.mensaje_solicitud="Ocurrio un error";
                return datosHijos;
                
              }
          }catch(e){
                datosHijos.estado_solicitud=false;
                datosHijos.mensaje_solicitud="Ocurrio un error";
                return datosHijos;
            }
    
  }
}