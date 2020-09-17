import 'package:edificion247/src/constantes.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/hijo.dart';
import 'dart:convert';
import 'package:http/http.dart' as client;

class OtrosProvider{
   final String baseUrl =constantes.apiUrl;


  Future<List<Hijo>> getlistaotros() async {
    final Map<String, dynamic> authData = {
      "cedula": appData.cedula
    };
    final response = await client.post("$baseUrl/nucleo_familiar/list/otros",
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

  Future<Hijo> getOtros(String cedula) async {
    final Map<String, dynamic> authData = {
      "cedula_familiar": cedula
    };
    final response = await client.post("$baseUrl/familiar/check",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
        print(response.body);

        Hijo datosOtros=Hijo();

        try{
              if (response.statusCode == 200) {
                final datos = json.decode(response.body);
                  if(datos["resp"]=="error"){
                    datosOtros.estado_solicitud=false;
                    datosOtros.mensaje_solicitud=datos["msj"];
                    return datosOtros;
                  }
                  else{
                    final decodedData = json.decode(response.body);
                      final otrosdatos = new Hijo.fromJson(decodedData);
                      otrosdatos.estado_solicitud=true;
                      otrosdatos.nombre_familiar=decodedData['nombre'];
                    return otrosdatos;
                    
                  }
              } else {
                datosOtros.estado_solicitud=false;
                datosOtros.mensaje_solicitud="Ocurrio un error";
                return datosOtros;
                
              }
          }catch(e){
                datosOtros.estado_solicitud=false;
                datosOtros.mensaje_solicitud="Ocurrio un error";
                return datosOtros;
            }
    
  }
}