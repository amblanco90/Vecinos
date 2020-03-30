import 'package:edificion247/src/pages/residente/chat.dart';
import 'package:edificion247/src/pages/residente/misvisitas.dart';
import 'package:flutter/material.dart';

class JuntaDirectivaPages extends StatelessWidget {
  const JuntaDirectivaPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final size=MediaQuery.of(context).size;
    return Center(
          child: Container(
          child:RaisedButton(
    child: Container(
      width: size.width*0.8,
      height: 40.0,
      child: Center(child: Text('Iniciar chat',style: TextStyle(fontSize: 18.0),textAlign: TextAlign.center,),),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0)
    ),
    elevation: 0.0,
    color: colorApp2,
    textColor: Colors.white,
    onPressed:(){
     /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPages()),
              );*/
    }
  ),
        ),
        );
  }
}