
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flushbar/flushbar.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:soundpool/soundpool.dart';

class PushNotificationProvider {

  Soundpool _soundpool = Soundpool();
  int _alarmSoundStreamId;
  int _cheeringStreamId = 1;

  Future<int> _soundId;
  Future<int> _cheeringId;


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
    
    _soundId = _loadSound();
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
        _playSound();
        String argumento = 'ugu';
        if(Platform.isAndroid){

          argumento = message['notification']['body'];

          _colorfullAlert(argumento,funcion);
         

        }else{

          argumento = message['notification']['body'];

          _colorfullAlert(argumento,funcion);
         

        }

        _stopSound();

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

  Future<int> _loadSound() async {
    var asset = await rootBundle.load("sounds/Alert-notification.mp3");
      return await _soundpool.load(asset);
  }


   Future<void> _playSound() async {
    var _alarmSound = await _soundId;
    _alarmSoundStreamId = await _soundpool.play(_alarmSound);
  }

  Future<void> _pauseSound() async {
    if (_alarmSoundStreamId != null){
      await _soundpool.pause(_alarmSoundStreamId);
    }
  }

  Future<void> _stopSound() async {
    if (_cheeringStreamId != null){
      await _soundpool.stop(_cheeringStreamId);
    }






  
}

}

