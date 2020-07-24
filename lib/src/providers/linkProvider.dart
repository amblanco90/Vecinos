import 'package:edificion247/src/helpers/appdata.dart';
import 'package:http/http.dart' as client;
import 'dart:convert';

class LinkProvider{
  final String baseUrl = "http://18.191.213.12//api";


  Future<String> setLink(String link) async {
    final Map<String, dynamic> authData = {
      "username": appData.cedula,
       "link_pago":link
    };
    final response = await client.post("$baseUrl/admin/factura/linkpago/save",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    final datos = json.decode(response.body);

   if(response.statusCode==200){
      try{
        if(datos['resp']=="ok"){
          return datos['msj'];
        }else{
          return datos['msj'];
        }
    }catch(a){
      return datos['Ocurrio un error'];
    }
    }else{
      return datos['Ocurrio un error'];
    }
  }
}