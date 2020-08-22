
import 'dart:async';
import 'dart:typed_data';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/pages/login/afterLogin.dart';
import 'package:edificion247/src/providers/perfilProvider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/pages/login/Login.dart';
import 'dart:convert';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    
    
    home: new MyApp(
      
    ),
    localizationsDelegates: [
   // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
    ],
    supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // Hebrew
        // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
    
  ));
    });
  


  
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp>  {
  final perfilProvider = PerfilProvider();

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, _validarSesionAbierta);
  }

  void navigationPage() {

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }

  @override
  void initState() {

    super.initState();
    
    startTime();
  }



  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
         body: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Expanded(
                            child: Center(
        child: new Image.asset('recursos/imagenes/logo.png'),
      ),
             ),
      
       Column(
         crossAxisAlignment: CrossAxisAlignment.end,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Center(
            child: Image.asset('recursos/imagenes/LogoSF.png'),
      ),
         ],
       ),
           ],
         ),
    
      
    );
  }

  _validarSesionAbierta() async{
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getInt("cedula") != null){
      appData.idUsuario=prefs.getInt('idUsuario') ??0;
      appData.saldo =  prefs.getInt('saldo') ??0;
      appData.tipoUnidad =  prefs.getString('tipoUnidad') ??"";
      appData.idSubunidad =  prefs.getInt('idSubunidad') ??"";
      appData.nombreSubUnidad =  prefs.getString('nombreSubUnidad') ??"";
      Map valueMap = json.decode(prefs.getString('unidadInicial'));
      appData.unidadInicial = valueMap;
      appData.idUnidad =  prefs.getInt('idUnidad') ??0;
      appData.url_pago =  prefs.getString('url_pago') ??"";
      appData.cedula =  prefs.getInt('cedula') ??0;
      appData.permisos =  prefs.getString('permisos') ??"";  
      appData.nombre=prefs.getString("nombre") ?? "";
      appData.apellido=prefs.getString("apellido") ?? "";
      if(prefs.getString("foto") != null){
        var foto = new Uint8List.fromList(prefs.getString("foto").codeUnits);
        appData.fotoPerfil=foto;
      }
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AfterLoginPage() ));
       
    }else{
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
    }
    
  }

/*LinearGradient(
            begin: Alignment.topRight, 
            end: Alignment.bottomRight,
            colors: [
               //Color.fromRGBO(205, 105, 55,1.0),
                Color.fromRGBO(240, 147, 43,1.0),
                Color.fromRGBO(255, 153, 29, 1.0),
               
               Color.fromRGBO(255, 135, 5,1.0),
              
               Color.fromRGBO(242, 84, 12,1.0),
              
              
              
              
               
               */
}
