import 'package:edificion247/src/pages/residente/drawer.dart';
import 'package:flutter/material.dart';

class UnidadesListaPage extends StatelessWidget {
  const UnidadesListaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        
        children: <Widget>[
          Center(
            child: Text('Escoja una unidad', style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0
                  ),),
          ),
          
                 _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0),Icons.business,'Unidad 1', context, DrawerItem()),
                 _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0),Icons.business,'Unidad 2', context, DrawerItem()),
                 _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0),Icons.business,'Unidad 3', context, DrawerItem()),
                 _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0),Icons.business,'Unidad 4', context, DrawerItem()),

                
              
           
         
        ],
      ),
    );
  }
}


Widget _crearBotonRedondeado(Color color, IconData icon, String texto, BuildContext context,  Widget route) {

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
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
    ],
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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route));
            },
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                
                texto,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0
                  ),
                
              
              ),
            ),
          ),
          SizedBox(height: 5.0,),
        ],
      ),
    );

  }
