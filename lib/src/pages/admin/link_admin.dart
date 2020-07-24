import 'package:edificion247/src/providers/linkProvider.dart';
import 'package:flutter/material.dart';

class LinkPagoAdminPage extends StatefulWidget {

  @override
  _LinkPagoAdminPageState createState() => _LinkPagoAdminPageState();
}

TextEditingController _controllerLink= TextEditingController();
final linkProviver=LinkProvider();
class _LinkPagoAdminPageState extends State<LinkPagoAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         children: <Widget>[
           Center(
             child:Text('LINK PAGO',style: TextStyle(color: Color.fromRGBO(255, 114, 0, 1.0),
          fontFamily: 'CenturyGothic',
          fontWeight: FontWeight.bold,
          fontSize: 25.0),
          textAlign:TextAlign.center,)
          ,
          ),
          SizedBox(height:30.0),
          _camposFormulario(),
          
          SizedBox(height:30.0),
GestureDetector(
       onTap: (){ 
       }, 
       child: Container(
       child: RaisedButton(
                 shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5),),
          onPressed: () {
            
         _guardarLink();
          },
         child:  Text(
            'GUARDAR LINK',
            style:TextStyle(fontSize: 18.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)
          )
          
        )
     ),
   )
       ],),
    );
  }
  Widget _camposFormulario(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 1, 10, 1),
      height: 50,
      child:TextField(
              controller: _controllerLink,
                autofocus: false,
                keyboardType: TextInputType.url,
                style:
                    new TextStyle(fontSize: 20.0, color: Colors.black,fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(233, 233, 233, 1),
                  hintText: 'INGRESE EL LINK',
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(5),
                  ),
  ),

)
    );
  }

  _guardarLink(){
    print('asdf');
    linkProviver.setLink(_controllerLink.text).then((value){
        _alertLinkMensajes(context, value);
    });
  }

   Widget _alertLinkMensajes (BuildContext context,String mensaje){

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