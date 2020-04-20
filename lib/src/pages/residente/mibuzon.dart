

import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/pedidoTaxi.dart';
import 'package:edificion247/src/pages/admin/drawer_admin.dart';
import 'package:edificion247/src/pages/residente/drawer.dart';
import 'package:edificion247/src/pages/residente/misvisitas.dart';
import 'package:edificion247/src/providers/casilleroProvider.dart';
import 'package:edificion247/src/providers/pedidoTaxi.dart';
import 'package:edificion247/src/search/search_delegate_factura.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:edificion247/src/widgets/noticiasAlert.dart';
import 'package:flutter/material.dart';

class MiBuzonPages extends StatefulWidget {

  @override
  _MiBuzonPagesState createState() => _MiBuzonPagesState();
}

class _MiBuzonPagesState extends State<MiBuzonPages> {
  final notificacionesProvider = CasilleroProvider();

  @override
  Widget build(BuildContext context) {
    return ListView(

      children: <Widget>[
        SizedBox(height: 10.0,),
        cabecera(),
       ConstrainedBox(
  constraints: new BoxConstraints(
    maxHeight: 250.0,
    
  ),

  child: Container(
 
    padding:  EdgeInsets.all(10.0),
    child: Scrollbar(
        
       child: FutureBuilder(
                    future: notificacionesProvider.getAllNotificaciones(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<PedidoTaxi>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done)
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return cardMensajes(
                                snapshot.data[index].descripcion,
                                snapshot.data[index].fechaCreacion,
                                '',
                                snapshot.data[index].idCasillero.isEven
                                    ? Colors.red.shade100
                                    : Colors.grey.shade300,
                                snapshot.data[index].estado,
                                context,
                                snapshot.data[index].idCasillero);
                               
                          },
                        );
                      else
                        return Center(
                            child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.orange),
                        ));
                    },
                  ),
    ),
  ),
),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 4.0,width: 280.0, decoration: BoxDecoration( color: Colors.grey.shade500, borderRadius: BorderRadius.circular(5.0)),),
        ),
        SizedBox(height: 5.0,),

        Text('CONTACTAR', style: TextStyle(color: Colors.orange.shade800,fontWeight: FontWeight.bold,fontSize: 18.0, fontFamily: 'CenturyGothic'),textAlign: TextAlign.center,),

        SizedBox(height: 5.0,),
      
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 7.0,width: 200.0 , decoration: BoxDecoration( color: Color.fromRGBO(255, 114, 0, 1.0), borderRadius: BorderRadius.circular(5.0)),),
        ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               _containerIcono('recursos/imagenes/personas.png', 'JUNTA DIRECTIVA'),
               SizedBox(width: 10.0,),
               _containerIcono('recursos/imagenes/junta.png', 'VIGILANCIA'),
               SizedBox(width: 10.0,),
               _containerIcono('recursos/imagenes/admin.png','ADMINISTRADOR'),
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


  
 Widget cardMensajes(
      texto, fecha, hora, color, estado, BuildContext context, id) {
  
    return GestureDetector(
        
        child: Card(
          color: color,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
            child: Row(
              children: <Widget>[
                Text(
                  texto,
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        child: Text(
                          '(LEER)' ,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 114, 0, 1.0),
                              fontFamily: 'CenturyGothic',
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0),
                        ),
                        onTap: () {

                          noticiaAlert(context, texto,
                                    'DETALLES', fecha);
                         

                         
                        },
                      ),
                      SizedBox(width: 30),
                      Text(
                        fecha,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0),
                      ),
                      Text(
                        hora,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

 
 _containerIcono( iconData, leyenda){

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
                  child: Image.asset(iconData),
                  padding: EdgeInsets.all(5.0),
                 
                ),
                SizedBox(height:5.0),
                Text(leyenda, style: TextStyle(fontFamily: 'CenturyGothic', fontSize:12.0, fontWeight: FontWeight.bold),),
     ],
   ),
   );

 }

  _botonPrincipal(context){

   return Container(
     margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0 ) ,
     child: FlatButton(
         
         color: Colors.grey.shade300,
         onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => appData.rol=='Residente'? DrawerItem(): DrawerAdminItem() ));
         },
         
         child: Center(child: Text('PRINCIPAL', style: TextStyle(color: Color.fromRGBO(255, 114, 0, 1.0), fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 20.0),),),
     ),
   );

 }








