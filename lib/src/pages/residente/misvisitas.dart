
import 'dart:io';
import 'dart:convert';
import 'package:edificion247/src/bloc/provider_visitas.dart';
import 'package:edificion247/src/bloc/visita_bloc.dart';
import 'package:edificion247/src/http/api-service.dart';
import 'package:edificion247/src/http/datos-visitas.dart';
import 'package:edificion247/src/models/visita.dart';
import 'package:edificion247/src/pages/residente/drawer.dart';
import 'package:edificion247/src/providers/visitaProvider.dart';
import 'package:edificion247/src/widgets/date_picker_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:toast/toast.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:flutter/material.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';


class VisitaPages extends StatefulWidget {

  @override
  _VisitaPagesState createState() => _VisitaPagesState();
}
final Color colorApp2= Color.fromRGBO(0, 25, 68, 1);
   String _selectedDate = '03/15/2020';
class _VisitaPagesState extends State<VisitaPages> {
   final _nombreController=TextEditingController();
    final _identificacionController=TextEditingController();
    final _fechaController=TextEditingController();
    final _observacionvisitaController=TextEditingController();
    final horaController=TextEditingController();
    final _numeroContantoController=TextEditingController();
    String id,nombre,observacion,contacto;
    List<dynamic> _listavisita=new List();
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
    // _actualizarListaVisitas();
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
             child:Row(
             children: <Widget>[
              // camposFormulario2('FECHA',fechaController,TextInputType.datetime),
              _calendario(),
              // camposFormulario2('HORA',horaController,TextInputType.datetime),
               
             ]
           )
           ),
           Container(
             padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
             child:Row(
             children: <Widget>[
               Icon(Icons.attach_file),
               GestureDetector(onTap: (){
                 getImageFromGallery();
               }, child: Text('ADJUNTAR FOTO',style: TextStyle(fontSize: 13.0, color: Color.fromRGBO(189, 186, 186, 1),fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold),),),
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
              if(_identificacionController.text.length<6){
                _alertHijoMensajes(context,"Su numero de identificacion debe ser mayor a 5 digitos y menor a 10");
                    return;
              }
              /*if(_selectedDate == 'Fecha de visita'){
                 Toast.show("Selecione una fecha", context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
                   return;
              }*/
              String base64Image=null;
              try{
                List<int> imageBytes = _image.readAsBytesSync();
               base64Image = base64.encode(imageBytes);
              }catch(a){
                
              }
              DatosVisitas datosVisitas=DatosVisitas(id_visitante: "",id_residente: appData.idUsuario.toString(),cedula_visitante: _identificacionController.text,nombre_visita: _nombreController.text,placa_auto: "agc-654",fecha_visita:_selectedDate,observaciones: _observacionvisitaController.text,username: "prueba",estado: "1",foto: base64Image.toString());
              ApiService _apiService=new ApiService();
              _apiService.createProfile(datosVisitas).then((isSuccess){
                  if(isSuccess){
                    setState(() {
                      _nombreController.text="";
                      _identificacionController.text="";
                      _fechaController.text="";
                      _observacionvisitaController.text="";
                     _numeroContantoController.text="";
                     _image=null;
                    });
                    _alertHijoMensajes(context,"Registro de visita exitoso");
                     }else{
                       _alertHijoMensajes(context,"A ocurrido un error al guardar visita");
                      }
              });
            }else{
              _alertHijoMensajes(context,"No se puede dejar campos vacio");
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

 Widget _alertHijoMensajes (BuildContext context,String mensaje){

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
    return  FutureBuilder(future: _solicitarVisitas.getlistavisitas(),
        builder: (BuildContext context,
                AsyncSnapshot<List<DatosVisita>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) { 
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
            return  _cardMensajes(snapshot.data[index].nombre_visitante.toString(),'ACTIVA',snapshot.data[index].nombre,snapshot.data[index].id.toString(), Colors.red.shade100, context,snapshot.data[index].foto);
            
  },
        ),
        
    ),
  ),
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
                    }})
    
   ;
   
  }

 _actualizarListaVisitas(){
   ApiService api=new ApiService();
                    api.listarVsitas(appData.idUsuario.toString()).then((onValue){
                      if(onValue!=null){
                        print(onValue);
                      setState(() {
                        _listavisita=onValue;
                      });
                      } 
                });
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
  
  return Container(
    padding: const EdgeInsets.all(2.0),
    decoration: BoxDecoration( 
      border: Border.all(
        width: 8,
        color: Color.fromRGBO(255, 153, 29, 1.0)
      )
    ), //       <--- BoxDecoration here
    child: QrImage(
  data: _codigo,
  version: QrVersions.auto,
  size: 150,
  gapless: false,
  embeddedImageStyle: QrEmbeddedImageStyle(
    size: Size(80, 80),
  ),
)
  )  ;
}
Widget _campoAlert(String texto){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(6, 4, 10, 4),
      height: 25,
      child:TextField(
                autofocus: false,
                keyboardType: TextInputType.text,
                style:
                    new TextStyle(fontSize: 13.0, color: Colors.black,fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                  filled: true,
                  enabled: false,
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
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
        width: 8,
        color: Color.fromRGBO(255, 153, 29, 1.0)
      )
         ),
        width: 500,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text("VISITA",style:
                     TextStyle(fontSize: 24.0, color: Colors.black,fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,)),),
            Padding(padding:EdgeInsets.fromLTRB(0, 0, 0, 10)),
            
            _campoAlert(nombrelista),
              _campoAlert(fecha),
              _campoAlert(id),
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
                margin:EdgeInsets.all(10),),
                _qr(id+"/"+fecha)
                 //_qr(),
              ],),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),)
              ,botonCompartir()
            
          ],
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

 botonCompartir() {
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
            onPressed: () {
             
            },
            child: const Text('COMPARTIR CODIGO',
                style: TextStyle(
                    fontSize: 24.0,
                    color: Color.fromRGBO(255, 153, 29, 1.0),
                    fontFamily: 'CenturyGothic',
                    fontWeight: FontWeight.bold)),
          )),
    );
  }
 Future<void> _selectDate(BuildContext context) async {

      
    final b = showDatePicker(
      
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2500),
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






}