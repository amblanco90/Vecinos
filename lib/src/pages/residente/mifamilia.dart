import 'package:edificion247/src/pages/residente/conyuque.dart';
import 'package:edificion247/src/pages/residente/drawer.dart';
import 'package:edificion247/src/pages/residente/hijos.dart';
import 'package:edificion247/src/pages/residente/otros.dart';
import 'package:flutter/material.dart';

class MiFamiliaPage extends StatefulWidget {
  MiFamiliaPage({Key key}) : super(key: key);

  @override
  _MiFamiliaPageState createState() => _MiFamiliaPageState();
}

class _MiFamiliaPageState extends State<MiFamiliaPage> {
 
  @override
  Widget build(BuildContext context) {
     final size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            children:<Widget>[
              Divider(height: 30,color: Colors.white,),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 5, 5, 5),
                  child:Column(
                    children:<Widget>[
                      Text("ADMINISTRA LOS MIEMBROS ",style:TextStyle(fontSize: 23.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)),
                      Text("DE TU NUCLEO FAMILIAR",style:TextStyle(fontSize: 23.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)),
                    ]
                  )
                ),
                 Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 4.0,width: size.width * 0.9 , decoration: BoxDecoration( color: Color.fromRGBO(167, 164, 164, 1), borderRadius: BorderRadius.circular(5.0)),),
        ),
        Divider(height: 50,color: Colors.white,),
         SizedBox(height: 10.0,),
                     Container(height: 8.0,width: 265.0, decoration: BoxDecoration( color: Color.fromRGBO(255, 114, 0, 1.0), borderRadius: BorderRadius.circular(5.0)),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _containerIcono(Icons. favorite,'CONYUGE',15, ConyuguePage()),
                          SizedBox(width: 10.0,),
                          _containerIcono(Icons.people, 'HIJOS',16,HijoPage()),
                          SizedBox(width: 10.0,),
                          _containerIcono(Icons.add_circle_outline,'OTROS',17,OtrosPage()),
                        ],),
                       
                       Container(height: 8.0,width: 265.0, decoration: BoxDecoration( color: Color.fromRGBO(255, 114, 0, 1.0), borderRadius: BorderRadius.circular(5.0)),),
                        Divider(height: 10,color: Colors.white,),
                       Text('*Recuerde que estos miembros tendran \n acceso a la aplicacion por medio  del \n documento de identificacion bajo el rol \n del "Nucleo Familiar" en la unidad \n Residente Registrada',style:TextStyle(fontSize: 15.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)),
                        Divider(height: 40,color: Colors.white,),

                       GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DrawerItem()));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
                            padding: EdgeInsets.symmetric(vertical: 7.0),
                            child: Center(
                              child: Text(
                                'PRINCIPAL',
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 153, 29, 1.0),
                                    fontFamily: 'CenturyGothic',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(5.0)),
                          ))
                  
                       //_botonPrincipal()   
            ]
          )
        ],
      ),
    );
  }
 _botonPrincipal(){

   return GestureDetector(
       onTap: (){ 
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DrawerItem() ));
       }, 
       child: Container(
       margin: EdgeInsets.symmetric(horizontal: 80.0 ),
       padding: EdgeInsets.symmetric(vertical: 7.0),
       child: RaisedButton(
                 shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5),),
          onPressed: () {
            setState(() {
             // _selecionadoItem2(11, "Home");
            });
          },
          child: const Text(
            'PRINCIPAL',
            style:TextStyle(fontSize: 24.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)
          ),
          )
     ),
   );

 }
   _containerIcono(IconData iconData, leyenda,int posicion,vista) {
    return GestureDetector(
      onTap: (){
      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => vista),
  );
      },
      child: Column(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: 85.0,
          height: 85.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(255, 114, 0, 1.0),
              style: BorderStyle.solid,
              width: 4.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(
            iconData,
            size: 70.0,
            color: Colors.grey.shade800,
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          leyenda,
          style: TextStyle(
              fontFamily: 'CenturyGothic',
              fontSize: 15.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
      ],
    ),
    );
  }
}