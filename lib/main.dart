
import 'dart:async';

import 'package:edificion247/src/providers/push_notification_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/pages/login/Login.dart';

void main(){
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

}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
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
    final _screenSize = MediaQuery.of(context).size;
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
