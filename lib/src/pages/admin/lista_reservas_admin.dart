import 'package:edificion247/src/models/visitas_models.dart';
import 'package:edificion247/src/providers/reservas_provider.dart';
import 'package:flutter/material.dart';

class ListaReservaAdminPage extends StatefulWidget {

  @override
  _ListaReservaAdminPageState createState() => _ListaReservaAdminPageState();
}
final reservaProvider=new ReservasProvider();
class _ListaReservaAdminPageState extends State<ListaReservaAdminPage> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      child:Column( 
        children: <Widget>[
          Container(
            height:size.height * 0.1 ,
            child:Center(child: Text('LISTA RESERVA',style: TextStyle(color: Color.fromRGBO(255, 114, 0, 1.0),
          fontFamily: 'CenturyGothic',
          fontWeight: FontWeight.bold,
          fontSize: 20.0),
          textAlign:TextAlign.center,),),
          //Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 30),),
            ),
          _listaResva(context,size),
      ],)
    );

   
  }


  _listaResva(context,size){
    return FutureBuilder(future: reservaProvider.getreservatodasAdmin(),
    builder: (BuildContext context,
     AsyncSnapshot<List<Reserva>> snapshot){
       if (snapshot.connectionState == ConnectionState.done){ 
          return ConstrainedBox(
            constraints:new BoxConstraints(
              maxHeight: size.height * 0.7,
              ),
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  return _cardview(snapshot.data[index],index%2==0
                                          ? Colors.red.shade100
                                          : Colors.grey.shade300,context);
                },
                )
            );
            
       }else{
          return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.orange),
                  )),
                );
       }
     });
  }

  _cardview(Reserva datos,color,context){
    return  GestureDetector(
        onTap: () {
          _verInformacionReserva(datos, context);
        },
        child: Card(
          color: color,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
            child: Row(
              children: <Widget>[
                Container(
                    child: Text(
                      datos.nombre_zona.length<= 10 ? datos.nombre_zona: datos.nombre_zona.replaceRange(10, datos.nombre_zona.length, '...'),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontFamily: 'CenturyGothic',
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0),
                    )),
                SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        datos.residente.length<= 17 ? datos.residente: datos.residente.replaceRange(17, datos.residente.length, '...'),
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0),
                      ),
                      SizedBox(
                  width: 30.0,
                ),
                      Text(
                        datos.estado,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0),
                      ),
                      SizedBox(
                  width: 20.0,
                ),
                  Expanded(child:  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                       Text(
                          '(LEER)' ,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 114, 0, 1.0),
                              fontFamily: 'CenturyGothic',
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0),
                        ),
                    ],
                  ),)
                
              ],
            ),
          ),
        ));
  }

  _verInformacionReserva(Reserva datos,context){
    showDialog(
        context: context,
        builder: (context2) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.orangeAccent.shade400,
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.pop(context2),
                        child: Icon(Icons.close),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(' INFORMACION RESERVA ',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ConstrainedBox(
                    constraints: new BoxConstraints(
                      maxHeight: 280.0,
                    ),
                    child: Container(
                      color: Colors.grey.shade200,
                      padding: EdgeInsets.all(10.0),
                      child: Scrollbar(
                        child: new ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Container(
                              width: 200.0,
                              height: 270.0,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('ZONA SOCIAL: ',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey.shade700,
                                          fontFamily: 'CenturyGothic',
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(datos.nombre_zona,
                                        maxLines: null,
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey.shade700,
                                          fontFamily: 'CenturyGothic',
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(height: 10.0),
                                    Row(
                                      children: <Widget>[
                                        Text('DESDE: ',
                                            maxLines: null,
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.grey.shade700,
                                              fontFamily: 'CenturyGothic',
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(datos.fecha_hora_inicio,
                                            maxLines: null,
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.grey.shade700,
                                              fontFamily: 'CenturyGothic',
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 10.0),
                                    Row(
                                      children: <Widget>[
                                        Text('HASTA: ',
                                            maxLines: null,
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.grey.shade700,
                                              fontFamily: 'CenturyGothic',
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(datos.fecha_hora_fin,
                                            maxLines: null,
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.grey.shade700,
                                              fontFamily: 'CenturyGothic',
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 10.0),
                                    Text('RESIDENTE: ',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey.shade700,
                                          fontFamily: 'CenturyGothic',
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(datos.residente,
                                        maxLines: null,
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey.shade700,
                                          fontFamily: 'CenturyGothic',
                                          fontWeight: FontWeight.bold,
                                        )),
                                        SizedBox(height: 10.0),
                                        Row(
                                      children: <Widget>[
                                        Text('SUBUNIDAD: ',
                                            maxLines: null,
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.grey.shade700,
                                              fontFamily: 'CenturyGothic',
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(datos.subunidad,
                                            maxLines: null,
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.grey.shade700,
                                              fontFamily: 'CenturyGothic',
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                        SizedBox(height: 10.0),
                                    Text('ESTADO: ',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey.shade700,
                                          fontFamily: 'CenturyGothic',
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(datos.estado,
                                        maxLines: null,
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey.shade700,
                                          fontFamily: 'CenturyGothic',
                                          fontWeight: FontWeight.bold,
                                        )),
                                        SizedBox(height: 10.0),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                          
                                           RaisedButton(
                                          onPressed: datos.estado == "Aprobado"|| datos.estado == "Por aprobar" || datos.estado == "*Cancelado*"? null:(){_cancelarReserva(datos.id_reserva.toString(),context,context2);} ,
                                          child:  Text( 'CANCELAR' , style: TextStyle(fontSize: 20)),
                                          
                                        ),
                                         RaisedButton(
                                          onPressed: datos.estado == "Aprobado"|| datos.estado == "*Cancelado*"? null:(){_aprobarReserva(datos.id_reserva.toString(),context,context2);},
                                          child: const Text('APROBAR ', style: TextStyle(fontSize: 20)),
                                        ),
                                        ],)
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ]),
              ),
            ),
          );
        });
  }

  _aprobarReserva(String id_reserva,BuildContext context,BuildContext context2){
    
    reservaProvider.setAprobarReserva(id_reserva).then(((value){
    Navigator.pop(context2);
      _alertReservaMensajes(context, value);
      setState(() {
      
    });
    }));
  }
   _cancelarReserva(String id_reserva,BuildContext context,BuildContext context2){
    reservaProvider.setCancelarReserva(id_reserva).then(((value){
      
     Navigator.pop(context2);
      _alertReservaMensajes(context, value);
      
      setState(() {
      
    });
    }));
  }

   Widget _alertReservaMensajes (BuildContext context,String mensaje){

   showDialog(

     context: context,
     barrierDismissible: false,
     builder: (context){
       return AlertDialog(
         
         content: Column(
           mainAxisSize: MainAxisSize.min,
           children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 40.0,
                child: Image.asset('recursos/imagenes/logo.png'),
              ),
              SizedBox(height: 15.0,),
              Text(mensaje),
           ],
         ),

         actions: <Widget>[
           FlatButton(
             child: Text('Aceptar', style: TextStyle(color: Color.fromRGBO(205, 105, 55, 1.0)),),
             onPressed: () => Navigator.of(context).pop(),
           ),
         ],
        

       );
     }


   );

 }
}