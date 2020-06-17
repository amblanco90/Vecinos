
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flushbar/flushbar.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PushNotificationProvider {

   final String baseUrl = "http://18.191.213.12//api";

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;

  Future<Map<String, dynamic>> postToken(token) async {
  final Map<String, dynamic> authData = {"id_residente": appData.idUsuario, "token": token};

    Client client = Client();
    final response = await client.post(
        "$baseUrl/residente/token/save",
        body: json.encode(authData),
        headers: {"Content-Type": "application/json"});
    print(response.body);
        
}

  initNotifications(funcion(),context){

    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token){
       
       postToken(token);
       print(token);

    });

    void _colorfullAlert(texto,f) {
    Flushbar(
                 flushbarPosition: FlushbarPosition.TOP,
                 dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                  message:  texto,
                  duration:  Duration(seconds: 7),
                  backgroundColor: Colors.orange,
                  mainButton: FlatButton(onPressed: f, child: Text('VER',style: TextStyle(fontFamily:'CenturyGothic',color: Colors.white),),)              
                )..show(context);
  }


    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {

        String argumento = 'ugu';
        if(Platform.isAndroid){

          argumento = message['notification']['body'];

          _colorfullAlert(argumento,funcion);
         

        }else{

          argumento = message['notification']['body'];

          _colorfullAlert(argumento,funcion);
         

        }

        _mensajesStreamController.sink.add(argumento); 
        print("onMessage: $message");
        
       
      },
      
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
       
        
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        funcion();
        
      },
    );

  }

  dispose(){
    _mensajesStreamController?.close(); 
  }






  
}

