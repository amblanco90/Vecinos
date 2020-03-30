import 'package:edificion247/src/models/pedidoTaxi.dart';
import 'package:edificion247/src/providers/casilleroProvider.dart';
import 'package:flutter/material.dart';

class MiCasillero extends StatelessWidget {

  final casilleroProvider = CasilleroProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
            future: casilleroProvider.getAllCasillero(),
            builder: (BuildContext context,
                AsyncSnapshot<List<PedidoTaxi>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.data.length>0?ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return crearCardCasillero(
                        snapshot.data[index].fechaCreacion,
                        snapshot.data[index].descripcion,
                        context);
                    
                  },
                ):Container();
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
                ));
              }
            },
          
        
      );
    
  }


  Widget crearCardCasillero(String fecha, String mensaje, BuildContext context){

  return Card(
    elevation: 5.0,
    child: Container(
       decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.orange,width: 3,),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
        ],
          ),
      
      child: Column(
        
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(child: Text(fecha, style: TextStyle(color: Colors.grey,))),
                Expanded(
                  child: Icon(Icons.beenhere, color: Colors.grey.shade700,),
                ),
                
              ],
            ),
          ),

           Container(
            padding: EdgeInsets.all(10.0),

            child: Text(
              'DESCRIPCION', style: TextStyle(color: Colors.grey,fontFamily: 'CenturyGothic'),
            ),

          ),

          Container(
            padding: EdgeInsets.all(10.0),

            child: Text(
              mensaje, style: TextStyle(fontFamily: 'CenturyGothic'),
            ),

          )
        ],
      ),
    ),
  );
  }
}