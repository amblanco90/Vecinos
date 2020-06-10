
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';



import 'package:edificion247/src/http/api-service.dart';
import 'package:edificion247/src/http/datos-visitas.dart';
import 'package:edificion247/src/models/visita.dart';
import 'package:edificion247/src/pages/residente/drawer.dart';
import 'package:edificion247/src/providers/visitaProvider.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class VisitaPages extends StatefulWidget {

  @override
  _VisitaPagesState createState() => _VisitaPagesState();
}
final Color colorApp2= Color.fromRGBO(0, 25, 68, 1);
DateTime now = DateTime.now();
String formattedDate = DateFormat('yMd').format(now);
   String _selectedDate = formattedDate;
class _VisitaPagesState extends State<VisitaPages> {
   final _nombreController=TextEditingController();
    final _identificacionController=TextEditingController();
    final _fechaController=TextEditingController();
    final _observacionvisitaController=TextEditingController();
    final horaController=TextEditingController();
    final _numeroContantoController=TextEditingController();
    String id,nombre,observacion,contacto;
    List<DatosVisita> _listavisita=new List();
    bool _estadolistareserva=true;
    GlobalKey _globalKey = new GlobalKey();

    bool _progresgenerarvisita=false;
    File _image;
    String estado="ADJUNTAR FOTO";
    final _solicitarVisitas = new VisitaProvider();
     Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
   final size=MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Text("GENERAR VISITA",style:TextStyle(fontSize: 24.0, color: Color.fromRGBO(205, 105, 55, 1.0),fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)),
           _camposFormulario('IDENTIFICACION',_identificacionController,TextInputType.number),
           _camposFormulario('NOMBRE VISITANTE',_nombreController,TextInputType.text),
           _camposFormulario('NUMERO DE CONTACTO',_numeroContantoController,TextInputType.number),
           
           _camposFormulario3('OBSERVACIONES',_observacionvisitaController,TextInputType.text),
          
           
           Container(
             margin: EdgeInsets.fromLTRB(10, 4, 10, 4),
              child: _calendario()
             
           ),
           GestureDetector(onTap: (){
                 getImageFromGallery();
               },
            child :Container(
             padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
             child:Row(
             children: <Widget>[
               Icon(Icons.attach_file),
               Text('ADJUNTAR FOTO',style: TextStyle(fontSize: 13.0, color: Color.fromRGBO(189, 186, 186, 1),fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold),),
               
               Container(
                            width: 100.0,
                            height: 100.0,
                            color: Colors.grey.shade200,
                            child: _image == null
                                ? Center(
                                    child: Icon(Icons.add),
                                  )
                                : Image.file(_image),
                          ),
               Container(
                 padding: EdgeInsets.fromLTRB(size.width*0.05, 4, 5, 4),
                 child:RaisedButton(
                 
                 shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5),),
          onPressed: () {
            if(_nombreController.text.length>1){
              if(_identificacionController.text.length<6 || _identificacionController.text.length>10){
                _alertVisitaMensajes(context,"Ingrese un numero de cedula valido");
                    return;
              }
              if(_validarnumeros(_identificacionController.text)== false){
                      _alertVisitaMensajes(context, 'solo puede ingresas numeros en identificacion');
                      return;
                    }
                    if(_validarnumeros(_numeroContantoController.text)== false){
                      _alertVisitaMensajes(context, 'solo puede ingresas numeros en numero contacto');
                      return;
                    }
              String base64Image=null;
              try{
                List<int> imageBytes = _image.readAsBytesSync();
               base64Image = base64.encode(imageBytes);
              }catch(a){
                
              }
              _progresgenerarvisita=true;
              DatosVisitas datosVisitas=DatosVisitas(id_visitante: "",id_residente: appData.idUsuario.toString(),cedula_visitante: _identificacionController.text,nombre_visita: _nombreController.text,placa_auto: "agc-654",fecha_visita:_selectedDate,observaciones: _observacionvisitaController.text,username: "prueba",estado: "1",foto: base64Image.toString());
              ApiService _apiService=new ApiService();
              _apiService.createProfile(datosVisitas).then((isSuccess){
                
                  if(isSuccess){
                    _estadolistareserva=true;
                    _progresgenerarvisita=false;
                    showSimpleCustomDialogpqr(context,_identificacionController.text.toString()+"&"+_selectedDate);
                    setState(() {
                      _nombreController.text="";
                      _identificacionController.text="";
                      _fechaController.text="";
                      _observacionvisitaController.text="";
                     _numeroContantoController.text="";
                     _image=null;
                    });
                     }else{
                       _progresgenerarvisita=false;
                       _alertVisitaMensajes(context,"A ocurrido un error intentar del nuevo ");
                      }
              });
            }else{
              _alertVisitaMensajes(context,"No se puede dejar campos vacio");
              }
          },
          child: const Text(
            'GENERAR',
            style: TextStyle(fontSize: 12,color:Color.fromRGBO(205, 105, 55, 1.0) )
          ),
          )
               )
             ]
           )
           ),),
          Visibility(
            visible: _progresgenerarvisita,
            child: Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Center(
                      child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.orange),
                  )),
                ),
           ),
           _tablaVisita(context),
           Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 4.0,width: size.width * 0.9 , decoration: BoxDecoration( color: Color.fromRGBO(203, 197, 197, 1), borderRadius: BorderRadius.circular(5.0)),),
        ),
           
  Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 4.0,width: size.width * 0.9 , decoration: BoxDecoration( color: Color.fromRGBO(203, 197, 197, 1), borderRadius: BorderRadius.circular(5.0)),),
        ),
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
                  
          ],
        )
      ],
  ),
    );
  }

 Widget _alertVisitaMensajes (BuildContext context,String mensaje){

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
_tablaVisita(BuildContext context){
    if (_estadolistareserva==true){
      return  FutureBuilder(future: _solicitarVisitas.getlistavisitas(),
        builder: (BuildContext context,
                AsyncSnapshot<List<DatosVisita>> snapshot) {

                    
                        if (snapshot.connectionState == ConnectionState.done) { 
                          if(snapshot.data.length !=0){
                              _listavisita=snapshot.data;
                              _estadolistareserva=false;
                            return     ConstrainedBox(
                                constraints: new BoxConstraints(
                                  maxHeight: 180.0,
                                  
                                ),

                                child: Container(
                              
                                  padding:  EdgeInsets.all(10.0),
                                  child: Scrollbar(
                                      
                                      child: new ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          return  _cardMensajes(snapshot.data[index].nombre_visitante.toString(),'ACTIVA',snapshot.data[index].fecha,snapshot.data[index].identificacion.toString(), Colors.red.shade100, context,snapshot.data[index].foto);
                                          
                                },
                                      ),
                                      
                                  ),
                                ),
                              );
                          }else{
                            return Text("No tiene visitas");
                                              }
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
                    
                    }
                    );
    }else{
       return     ConstrainedBox(
  constraints: new BoxConstraints(
    maxHeight: 180.0,
    
  ),

  child: Container(
 
    padding:  EdgeInsets.all(10.0),
    child: Scrollbar(
        
        child: new ListView.builder(
          itemCount: _listavisita.length,
          itemBuilder: (context, index) {
            return  _cardMensajes(_listavisita[index].nombre_visitante.toString(),'ACTIVA',_listavisita[index].fecha,_listavisita[index].identificacion.toString(), Colors.red.shade100, context,_listavisita[index].foto);
            
  },
        ),
        
    ),
  ),
);
    }
    
   
  }



  Widget _camposFormulario(String texto,TextEditingController _controller,TextInputType type){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 4, 10, 4),
      height: 40,
      child:TextField(
              controller: _controller,
                autofocus: false,
                keyboardType: type,
                style:
                    new TextStyle(fontSize: 13.0, color: Colors.black,fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(233, 233, 233, 1),
                  hintText: texto,
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

  Widget _camposFormulario2(String texto,TextEditingController _controller,TextInputType type){
    final size=MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.47,
      height: 30,
      child:TextField(
              controller: _controller,
                autofocus: false,
                keyboardType: type,
                style:
                    new TextStyle(fontSize: 13.0, color: Colors.black,fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(233, 233, 233, 1),
                  hintText: texto,
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

  Widget _camposFormulario3(String texto,TextEditingController _controller,TextInputType type){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 4, 10, 4),
      height: 50,
      child:TextField(
              controller: _controller,
                autofocus: false,
                keyboardType: type,
                style:
                    new TextStyle(fontSize: 13.0, color: Colors.black,fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                  filled: true,
                  //hintStyle: TextStyle(color: Colors.white54, fontFamily: 'CenturyGothic'),
                  fillColor: Color.fromRGBO(233, 233, 233, 1),
                  hintText: texto,
                 // hoverColor: Colors.black,
                 // focusColor: Colors.black,
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

   Widget _cardMensajes(texto,estado , fecha,id,color, BuildContext context,imagen){
    
  return  GestureDetector(  
         child: Card(
           color: color,
           child: Container(
             padding: EdgeInsets.symmetric(horizontal:5.0, vertical: 2.0),
             child: Row(
               children: <Widget>[
                 
                Text(texto, style: TextStyle(color: Colors.grey.shade700, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),),
                SizedBox(width: 15.0,),
                 Text('(LEER)'+fecha, style: TextStyle(color:Color.fromRGBO(255, 153, 29, 1.0),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),), 
                Expanded(
                                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                     Text(estado, style: TextStyle(color: Colors.grey.shade700,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 10.0),),

                    ],
                  ),
                )
              ],
             ),
           ),
         ), onTap: (){
                    showSimpleCustomDialog(context,texto,fecha,id,imagen);  
                  },
                  );

}

Widget _qr(String _codigo){
   final size=MediaQuery.of(context).size;
  return Container(
   
    padding: const EdgeInsets.all(2.0),
    decoration: BoxDecoration( 
      border: Border.all(
        width: 8,
        color: Color.fromRGBO(255, 153, 29, 1.0)
      )
    ), 
    child: QrImage(
    backgroundColor: Colors.white,
  data: _codigo,
  version: QrVersions.auto,
  size: size.width * 0.315,
  gapless: false,
  embeddedImageStyle: QrEmbeddedImageStyle(
    size: Size(80, 80),
  ),
)
  )  ;
}


Widget _campoAlert(String label, String texto){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 4, 10, 4),
      height: 40,
      child:TextFormField(
              initialValue: texto,
                autofocus: false,
                enabled: false,
                style:
                    new TextStyle(fontSize: 13.0, color: Colors.black,fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                  filled: true,
                  labelText: label,
                  fillColor: Color.fromRGBO(233, 233, 233, 1),
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

  void showSimpleCustomDialog(BuildContext context,String nombrelista ,  String fecha,String id,imagenvisita) {
    try{
      imagenvisita=base64.decode(imagenvisita);
    }catch(a){
      imagenvisita=AssetImage("recursos/imagenes/profile.png");
    }
    final size=MediaQuery.of(context).size;
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: RepaintBoundary(
        key:_globalKey ,
        child: Container(
          
        decoration: BoxDecoration(
          border: Border.all(
        width: 8,
        color: Color.fromRGBO(255, 153, 29, 1.0)
      ),
      color: Colors.white
         ),
        width: size.width * 1,
        height: size.width * 1.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text("VISITA",style:
                     TextStyle(fontSize: 24.0, color: Colors.black,fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,)),),
            Padding(padding:EdgeInsets.fromLTRB(0, 0, 0, 10)),
            
            _campoAlert("Nombre", nombrelista),
              _campoAlert("Fecha",fecha),
              _campoAlert("Cedula",id),
              Row(children: <Widget>[
               Container(
                height: 150,
                width: size.width * 0.3,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image:  Image.memory(imagenvisita).image,
                  )
                ),
               ),
                _qr(id+"&"+fecha),
                
              ],),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),)
              ,botonCompartir()
            
          ],
        ),
      )
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
}
void showSimpleCustomDialogpqr(BuildContext context,String code) {

    Dialog simpleDialog = Dialog(
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: RepaintBoundary(
        key:_globalKey ,
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.all(3.0),
        width: 500,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text("VISITA GENERADA CORRECTAMENTE",style:
                     TextStyle(fontSize: 15.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),),
            Padding(padding:EdgeInsets.fromLTRB(0, 0, 0, 10)),
            Icon(
              Icons.check_circle_outline,
              color:Color.fromRGBO(255, 153, 29, 1.0) ,
              size: 50.0,
        
            ),
               Container(
                 width: 300,
                 height: 300,
                 decoration: BoxDecoration(
                    border: Border.all(
                width: 8,
                color: Color.fromRGBO(255, 153, 29, 1.0)
                 ),
                 ),
                 child: QrImage(
  data: code,
  version: QrVersions.auto,
  size: 150,
  gapless: false,
  embeddedImageStyle: QrEmbeddedImageStyle(
    size: Size(80, 80),
    
    
  ),
),
               ),
           
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),)
              ,botonCompartir()
            
          ],
        ),
      ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
}


Widget _calendario(){
  return  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey),
                    left: BorderSide(width: 1.0, color: Colors.grey),
                    right: BorderSide(width: 1.0, color: Colors.grey),
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                    data: Theme.of(context).copyWith(
                            
                            primaryColor: Colors.orange,
                            splashColor: Colors.orange,
                            accentColor: Colors.orange,
                            buttonColor: Colors.orange,
                            backgroundColor: Colors.orange,
                            buttonTheme: ButtonThemeData(
                          
                          buttonColor: Colors.orange,
                          

                        
                           //color of the text in the button "OK/CANCEL"
                        ),
                            
                          ),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Builder(
                          builder: (context) => InkWell(
                          child: Text(
                              _selectedDate,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            _selectDate(context);
                          },
                        ),
                      ),
                      Builder(
                          builder: (context) =>IconButton(
                          icon: Icon(Icons.calendar_today),
                          tooltip: 'Tap to open date picker',
                          onPressed: () {
                            _selectDate(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
}

 botonCompartir( ) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DrawerItem() ));
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          padding: EdgeInsets.symmetric(vertical: 7.0),
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5),
            ),
            onPressed: ()  {
              _capturePng();
            },
            child:  Text('COMPARTIR CODIGO',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Color.fromRGBO(255, 153, 29, 1.0),
                    fontFamily: 'CenturyGothic',
                    fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          )),
    );
  }
 
   _capturePng() async {
    try{
    RenderRepaintBoundary boundary = _globalKey.currentContext.findRenderObject();
    if (boundary.debugNeedsPaint == true ) {
        Timer(Duration(seconds: 1), () => _capturePng());
      return;
          }
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    Share.file("Codigo qr", "qr.png", pngBytes, "image/png");
    }catch(a){
      _alertVisitaMensajes(context, a.toString());
    }
  }

  
       Future<void> _selectDate(BuildContext context) async {
      
            
          final b = showDatePicker(
            
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 1)),
            lastDate: DateTime(2100),
            locale: Locale('es','ES')
            
       
          );
          
          final DateTime d = await b;
       
          if (d != null)
              if(d.month>=10){
            _selectedDate =d.month.toString()+'/'+ d.day.toString()+ '/' + d.year.toString();
            }else{
              _selectedDate ='0' + d.month.toString()+'/'+ d.day.toString()+ '/' + d.year.toString();
            }
          
          // appData.fecha_inicial_reserva = _selectedDate;
             setState(() {
              _selectedDate;
             });
        }
      
      
      bool _validarnumeros(String value){
          final n = num.tryParse(value);
        if(n == null) {
          return false;
        }
        return true;
       }
      
      
      
      }
      
      