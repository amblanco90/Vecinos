import 'package:edificion247/src/bloc/provider_unidad.dart';
import 'package:edificion247/src/bloc/unidad_bloc.dart';
import 'package:edificion247/src/pages/residente/drawer.dart';
import 'package:edificion247/src/pages/residente/misvisitas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MiUnidad extends StatefulWidget {
  @override
  _MiUnidadState createState() => _MiUnidadState();
}

class _MiUnidadState extends State<MiUnidad> {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
          child: Center(
        child: Column(
          
          children: <Widget>[
            SizedBox(height: 20.0,),
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(255, 114, 0, 1.0), style: BorderStyle.solid, width: 4.0, ),
                borderRadius: BorderRadius.circular(8.0)
              ),
            ),
            SizedBox(height: 5.0,),
            Text('URB. ADELITA DE CHAR', textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(255, 114, 0, 1.0),fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 18.0 ),),
            Padding(
             padding: EdgeInsets.only(top: 2.0),
             child: Container(height: 4.0,width: 280.0, decoration: BoxDecoration( color: Colors.grey, borderRadius: BorderRadius.circular(2.0)),),
           ),
           
           Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              children: <Widget>[
                 containerUnidad('RESIDENCIAL'),
                 SizedBox(height: 5.0,),
                 containerUnidad('CALLE 123 # 456 - 456'),
                 SizedBox(height: 5.0,),
                 containerUnidad('BARRANQUILLA'),
                 SizedBox(height: 5.0,),
                 containerUnidad('3000000 - 30101010'),

              ]
            ),

           ),

           Container(height: 6.0,width: 280.0, decoration: BoxDecoration( color: Color.fromRGBO(255, 114, 0, 1.0), borderRadius: BorderRadius.circular(5.0)),),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               containerIcono(Icons.people, 'JUNTA DIRECTIVA'),
               SizedBox(width: 10.0,),
               containerIcono(Icons.security, 'VIGILANCIA'),
               SizedBox(width: 10.0,),
               containerIcono(Icons.person,'ADMINISTRADOR'),
             ],),
             SizedBox(height:20.0),
             botonPrincipal(),
             SizedBox(height:10.0),

           

          ],
        ),
      ),
    );

  
    
}


 containerUnidad(texto){

   return Container(
     margin: EdgeInsets.symmetric(horizontal: 10.0 ),
     padding: EdgeInsets.symmetric(vertical: 10.0),
     child: Center(child: Text(texto, style: TextStyle(color: Colors.grey.shade900, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 17.0),),),
     decoration: BoxDecoration( color: Color.fromRGBO(252, 71, 0, 0.2), borderRadius: BorderRadius.circular(5.0)),
   );

 }

 containerIcono(IconData iconData, leyenda){

   return Column(
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
   );

 }

  botonPrincipal(){

   
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


}