

import 'package:edificion247/src/pages/residente/drawer.dart';
import 'package:edificion247/src/pages/residente/misvisitas.dart';
import 'package:edificion247/src/search/search_delegate_factura.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:flutter/material.dart';

class MiBuzonPages extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return ListView(

      children: <Widget>[
        SizedBox(height: 10.0,),
        cabecera(),
        mensajes(context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 4.0,width: 280.0, decoration: BoxDecoration( color: Colors.grey.shade500, borderRadius: BorderRadius.circular(5.0)),),
        ),
        SizedBox(height: 5.0,),

        Text('CONTACTAR', style: TextStyle(color: Colors.orange.shade800,fontWeight: FontWeight.bold,fontSize: 15.0, fontFamily: 'CenturyGothic'),textAlign: TextAlign.center,),

        SizedBox(height: 5.0,),
      
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 7.0,width: 200.0 , decoration: BoxDecoration( color: Color.fromRGBO(255, 114, 0, 1.0), borderRadius: BorderRadius.circular(5.0)),),
        ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
              // _containerIcono(Icons.people, 'JUNTA DIRECTIVA'),
               SizedBox(width: 10.0,),
               //_containerIcono(Icons.security, 'VIGILANCIA'),
               SizedBox(width: 10.0,),
               //_containerIcono(Icons.person,'ADMINISTRADOR'),
             ],),
             SizedBox(height:20.0),
             _botonPrincipal(context),
             SizedBox(height:10.0),
      ],

    );

    

  }


  

  }


  cabecera(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(children: <Widget>[
              Icon(Icons.mail_outline, color: Colors.transparent ),
              SizedBox(width: 5.0,),
              Text('INBOX', style: TextStyle(color: Colors.transparent,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 17.0),),
            ],)
          ],),
        Column(children: <Widget>[
            Row(children: <Widget>[
              Icon(Icons.mail_outline, color: Color.fromRGBO(255, 114, 0, 1.0), ),
              SizedBox(width: 5.0,),
              Text('INBOX', style: TextStyle(color: Color.fromRGBO(255, 114, 0, 1.0),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 17.0),),
            ],)
        ],),
        Column(
          children: <Widget>[
            
              Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('ENVIADOS', style: TextStyle(color: Color.fromRGBO(255, 114, 0, 1.0),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 14.0,),textAlign: TextAlign.end,),
        ),
          ],
        )
      ],
    );

   

  }


  mensajes(BuildContext context){
    return   ConstrainedBox(
  constraints: new BoxConstraints(
    maxHeight: 250.0,
    
  ),

  child: Container(
 
    padding:  EdgeInsets.all(10.0),
    child: Scrollbar(
        
        child: new ListView(
        shrinkWrap: true,
        children: <Widget>[
         
         cardMensajes('EVENTO JUNTA DIRECTIVA','28/02/2020','2:00 PM', Colors.red.shade100, context),
         cardMensajes('EVENTO JUNTA DIRECTIVA','28/02/2020','2:00 PM', Colors.grey.shade300, context),
         cardMensajes('EVENTO JUNTA DIRECTIVA','28/02/2020','2:00 PM', Colors.red.shade100, context ),
         cardMensajes('EVENTO JUNTA DIRECTIVA','28/02/2020','2:00 PM', Colors.grey.shade300, context),
         cardMensajes('EVENTO JUNTA DIRECTIVA','28/02/2020','2:00 PM', Colors.red.shade100, context ),
         cardMensajes('EVENTO JUNTA DIRECTIVA','28/02/2020','2:00 PM', Colors.grey.shade300, context),
         cardMensajes('EVENTO JUNTA DIRECTIVA','28/02/2020','2:00 PM', Colors.red.shade100 , context),
         cardMensajes('EVENTO JUNTA DIRECTIVA','28/02/2020','2:00 PM', Colors.grey.shade300, context),
         cardMensajes('EVENTO JUNTA DIRECTIVA','28/02/2020','2:00 PM', Colors.red.shade100, context ),
         cardMensajes('EVENTO JUNTA DIRECTIVA','28/02/2020','2:00 PM', Colors.grey.shade300, context),
         cardMensajes('EVENTO JUNTA DIRECTIVA','28/02/2020','2:00 PM', Colors.red.shade100, context )

        
        ],

      ),
    ),
  ),
);
   
  }
  

Widget cardMensajes(texto, fecha, hora, color, BuildContext context){

  return    GestureDetector(
     onTap: (){
        MensajeRecibido(context);
     },
      child: Card(
             color: color,
             child: Container(
               padding: EdgeInsets.symmetric(horizontal:5.0, vertical: 2.0),
               child: Row(
                 children: <Widget>[
                   
                  Text(texto, style: TextStyle(color: Colors.grey.shade700, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 10.0),),
                  SizedBox(width: 15.0,),
                  GestureDetector(
                    child: Text('(LEER)', style: TextStyle(color: Color.fromRGBO(255, 114, 0, 1.0),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 10.0),),
                    onTap: (){
                     
                    },
                    ),
                  Expanded(
                                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[

                        Text(fecha, style: TextStyle(color: Colors.grey.shade700,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 10.0),),
                        Text(hora, style: TextStyle(color: Colors.grey.shade700,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 10.0),),

                      ],
                    ),
                  )
                ],
               ),
             ),
           ),
  );

}


 _containerIcono(IconData iconData, leyenda){

   return GestureDetector(child: Column(
     children: <Widget>[
       SizedBox(height: 10.0,),
       Container(
                  width: 75.0,
                  height: 75.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(255, 114, 0, 1.0), style: BorderStyle.solid, width: 4.0, ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(iconData, size: 65.0, color: Colors.grey.shade800,),
                 
                ),
                SizedBox(width:5.0),
                Text(leyenda, style: TextStyle(fontFamily: 'CenturyGothic', fontSize:12.0, fontWeight: FontWeight.bold),),
     ],
   ),
   );

 }

  _botonPrincipal(context){

   return Container(
     margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0 ) ,
     child: FlatButton(
         
         color: Colors.grey.shade300,
         onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DrawerItem() ));
         },
         
         child: Center(child: Text('PRINCIPAL', style: TextStyle(color: Color.fromRGBO(255, 114, 0, 1.0), fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 20.0),),),
     ),
   );

 }








