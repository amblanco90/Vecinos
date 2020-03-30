import 'package:flutter/material.dart';

class HomeAdminPages extends StatefulWidget {

  @override
  _HomeAdminPagesState createState() => _HomeAdminPagesState();
}

class _HomeAdminPagesState extends State<HomeAdminPages> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _botonesRedondeados(context),
          ],
        ),
      );
  }

  Widget _botonesRedondeados(context) {


   return Table(

      children: [
        TableRow(
          
          children: [

              _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0),Icons.chat,'Mi unidad', context, null),

              _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0), Icons.room_service ,'Soporte 24/7', context, null)

          ]
          
          ),
        TableRow(
                  
                  children: [

                    _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0),Icons.card_giftcard,'Buzon', context, null),
                    _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0), Icons.room_service ,'Mi seguridad', context, null)

                  ]
                  
                  ),

  
      ],

   );

   

 }

Widget _crearBotonRedondeado(Color color, IconData icon, String texto, BuildContext context, Widget route ) {

    return Container(

      height: 140.0,
      margin: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 6), // changes position of shadow
          ),
    ],
        
        /*gradient: LinearGradient(
          colors: [
            //Color.fromRGBO(205, 105, 55,1.0),
            Color.fromRGBO(255, 153, 29, 1.0),
            Color.fromRGBO(255, 135, 5,1.0),
            
          ]
        )*/
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 5.0),
          CircleAvatar(
            backgroundColor: color,
            radius: 25.0,
            child: IconButton(
            icon:Icon(icon),
            color: Colors.white ,
            onPressed: (){
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => route),
              );
            },
            ),
          ),
          
          Text(
            
            texto,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.bold,
              fontSize: 16.0
              ),
            
          
          ),
          SizedBox(height: 5.0,),
        ],
      ),
    );

  }
}