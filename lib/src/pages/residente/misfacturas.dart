
import 'package:edificion247/src/models/facturas.dart';
import 'package:edificion247/src/providers/facturasProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MisFacturas extends StatelessWidget {
  @override
  final facturaprovider=FacturaProvider();
  Widget build(BuildContext context) {
    
  return _listaFacturas(context);
     
  }
  _listaFacturas(context){
    return FutureBuilder(future:facturaprovider.getlistafactura() ,
    builder: (BuildContext context,
    AsyncSnapshot<DatosFacturas> snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        if(snapshot.data.id_factura != null){
             return _cardMensajesFacturas(snapshot.data,context);
        }else{
          return Center(child: Text('En estos momentos no tiene facturas disponibles',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),);
        }
         
      }else{
        return Padding(
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
Widget _cardMensajesFacturas(DatosFacturas datos,context){
    
    final size=MediaQuery.of(context).size;
  return   SingleChildScrollView(
    child:Container(
             padding: EdgeInsets.symmetric(horizontal:5.0, vertical: 2.0),
             margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 0.0),
             child: Column(
               children: <Widget>[
                Center(child: Text("INFORMACION FACTURA", style: TextStyle(color: Color.fromRGBO(255, 153, 29, 1.0), fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 25.0),textAlign: TextAlign.center,),),
                SizedBox(height: 50.0,),
                Text("ID FACTURA", style: TextStyle(color: Color.fromRGBO(255, 153, 29, 1.0), fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 25.0),textAlign: TextAlign.center,),
                SizedBox(height: 10.0,),
                Text(datos.id_factura.toString(), style: TextStyle(color: Colors.black, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 13.0),),
                SizedBox(height: 20.0,),
                Text("FECHA FACTURA", style: TextStyle(color: Color.fromRGBO(255, 153, 29, 1.0), fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 25.0),textAlign: TextAlign.center,),
                Text(datos.fecha_factura, style: TextStyle(color:Colors.black,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),), 
                SizedBox(height: 20.0,),
                Text("NOMBRE RESIDENTE ", style: TextStyle(color: Color.fromRGBO(255, 153, 29, 1.0), fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 25.0),textAlign: TextAlign.center,),
                Text(datos.nombre, style: TextStyle(color:Colors.black,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),), 
                SizedBox(height: 20.0,),
                Text("NOMBRE UNIDAD ", style: TextStyle(color: Color.fromRGBO(255, 153, 29, 1.0), fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 25.0),textAlign: TextAlign.center,),
                Text(datos.nombre_unidad, style: TextStyle(color:Colors.black,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),), 
                SizedBox(height: 20.0,),
                Text("SALDO", style: TextStyle(color: Color.fromRGBO(255, 153, 29, 1.0), fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 25.0),textAlign: TextAlign.center,),
                Text(datos.saldo.toString(), style: TextStyle(color:Colors.black,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),),
                SizedBox(height: 20.0,),
                Text("TOTAL ", style: TextStyle(color: Color.fromRGBO(255, 153, 29, 1.0), fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 25.0),textAlign: TextAlign.center,),
                Text(datos.total.toString(), style: TextStyle(color:Colors.black,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),),  
               SizedBox(height: 50.0,),
Container(
       margin: EdgeInsets.symmetric(horizontal: 80.0 ),
       padding: EdgeInsets.symmetric(vertical: 7.0),
       child: RaisedButton(
         color:  Color.fromRGBO(255, 153, 29, 1.0) ,
                 shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5),),
          onPressed: () {
            showSimpleCustomDialog(context,datos.conceptos);
          },
          child:  Text(
            "VER MAS",
           textAlign: TextAlign.center,  style:TextStyle(fontSize:  18.0 , color: Colors.black,fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold,)
          ),
          )
     ),

              
        
              ],
             ),
           ) ,
    );
           

}
Widget _alertFacturas (BuildContext context,conceptos){
  final entidades=new ListaConceptos.fromJsonList(conceptos);
    entidades.items.reversed.toList();
   showDialog(

     context: context,
     barrierDismissible: false,
     builder: (context){
       return AlertDialog(
         
         content:ConstrainedBox(
           constraints:  BoxConstraints(
             maxHeight: 30.0
             ),
             child: Container(
               padding: EdgeInsets.all(10.0),
               child: Scrollbar( 
                 child: ListView.builder(
                itemCount: entidades.items.length,
                itemBuilder: (context,index){
                  return Text(entidades.items[index].concepto);
                }
                ),
               ),
              ),
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

void showSimpleCustomDialog(BuildContext context, conceptos ) {
  final entidades=new ListaConceptos.fromJsonList(conceptos);
    entidades.items.reversed.toList();
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
       
        width: 500,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text("Conceptos",style:
                     TextStyle(fontSize: 24.0, color:Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,)),),
           ConstrainedBox(
           constraints:  BoxConstraints(
             maxHeight: 280.0
             ),
             child: Container(
               padding: EdgeInsets.all(10.0),
               child: Scrollbar( 
                 child: ListView.builder(
                itemCount: entidades.items.length,
                itemBuilder: (context,index){
                  return _containerConcepto(entidades.items[index].concepto, entidades.items[index].valor.toString());
                }
                ),
               ),
              ),
          ),
            
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
}

Widget _containerConcepto(concepto,valor){
  return Container( 
    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      border: Border.all(
        width: 2,
        
        color: Color.fromRGBO(255, 153, 29, 1.0)
      )
    ),
    child:Column(
      children: <Widget>[
        Text(concepto,style: TextStyle(fontSize: 17.0),),
        Text("VALOR: "+valor,style: TextStyle(fontSize: 17.0),)
      ],
      )
  );
}
  Widget _tarjeta(BuildContext context) {
    final tarjeta = SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Numero factura:'),
                    subtitle: Text('3456576'),
                  ),
                  ListTile(
                    leading: Text(''),
                    title: Text('Fecha:'),
                    subtitle: Text('12/02/2020'),
                  ),
                  ListTile(
                    leading: Text(''),
                    title: Text('Valor:'),
                    subtitle: Text('10.000'),
                  ),
                  ListTile(
                    leading: Text(''),
                    title: Text('Estado:'),
                    subtitle: Text('Cancelada'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: () {},
    );
  }
}
