import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/http/api-service.dart';
import 'package:edificion247/src/http/datos-familia.dart';
import 'package:edificion247/src/models/hijo.dart';
import 'package:edificion247/src/providers/otrosProvider.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class OtrosPage extends StatefulWidget {
  @override
  _OtrosPageState createState() => _OtrosPageState();
}

class _OtrosPageState extends State<OtrosPage> {
   final _controllerNombre=TextEditingController();
    final _controllerIdentificacion=TextEditingController();
    final _controllerNumeroContacto=TextEditingController();
    final _controllerCorreo=TextEditingController();
    List<dynamic> _listarOtros=new List();
    final _providerOtros=new OtrosProvider();
    int _idNucleo;
    int _idfam;
    bool camposCedula=true;
    bool _enablecampos=false;
    bool _estadobuttonguardar=true;

     String _resultradio ="CC";
  String _radioValue = "CC";
  void _handleRadioValueChange(String value) {
    setState(() {
      _radioValue = value;
  
      switch (_radioValue) {
        case "CC":
          _resultradio = "CC";
          break;
        case "TI":
          _resultradio = "TI";
          break;
        case "CR":
          _resultradio = "CR";
          break;
          case "PASAPORTE":
          _resultradio = "PASAPORTE";
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
   //_actualizarListaHijos();
    final size=MediaQuery.of(context).size;
    return  SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            children:<Widget>[
              _barraArribaConyugue(),
               Center(
               child: Container(
                 width: 350.0,
                margin: EdgeInsets.fromLTRB(10, 4, 10, 4),
                height: 50,
                          child:   Row( children: <Widget>[
                    _camposFormularioCedula('IDENTIFICACION DEL FAMILIAR', _controllerIdentificacion, TextInputType.number,""),
                  Align(alignment: Alignment.centerRight, child:  _botonBuscarFamiliar(),)
                    ],),
               ),
             ),
             _opcionesDocumentos(),
              _camposFormulario('NOMBRE COMPLETO', _controllerNombre, TextInputType.text),
              _camposFormulario('NUMERO DE CONTACTO', _controllerNumeroContacto, TextInputType.number),
              _camposFormulario('CORREO ELECTRONICO', _controllerCorreo, TextInputType.emailAddress),
                _botonGuardar(),
                       Text('*Recuerde que estos miembros tendran \n acceso a la aplicacion por medio  del \n documento de identificacion bajo el rol \n del "Nucleo Familiar" en la unidad \n Residente Registrada',style:TextStyle(fontSize: 15.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                        Divider(height: 20,color: Colors.white,),

                              _tablaHijos(context),
           
           Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 4.0,width: size.width * 0.9 , decoration: BoxDecoration( color: Color.fromRGBO(203, 197, 197, 1), borderRadius: BorderRadius.circular(5.0)),),
        ),
                      // _botonPrincipal()   
              
            ]
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
 _guardareditar(String _idnucleo,String _idfamilia){
    if(_controllerNombre.text.isEmpty || _controllerCorreo.text.isEmpty || _controllerIdentificacion.text.isEmpty || _controllerNumeroContacto.text.isEmpty){
              _alertHijoMensajes(context, "No se puede dejar campos vacio");
              return;
            }else{
                if(_controllerIdentificacion.text.length <6 || _controllerIdentificacion.text.length >10){
                  _alertHijoMensajes(context, "Campo identificacion no puede tener mas de 10 y menos 6 digitos");
                return;
              }else{
                    if(_validarnumeros(_controllerIdentificacion.text)== false){
                      _alertHijoMensajes(context, 'solo puede ingresas numeros en identificacion');
                      return;
                    }
                    if(_validarnumeros(_controllerNumeroContacto.text)== false){
                      _alertHijoMensajes(context, 'solo puede ingresas numeros en numero contacto');
                      return;
                    }
                    if(_validateEmail(_controllerCorreo.text) ==  false){
                      _alertHijoMensajes(context, "correo no valido");
                  return;
                }else{
                  if(_controllerNumeroContacto.text.length <7 || _controllerNumeroContacto.text.length>10){
                    _alertHijoMensajes(context, "Campo numero de contacto no puede tener mas de 10 y menos 7 digitos");
                    return;
                  }else{
                    ApiService apiService=new ApiService();
                     apiService.guardarFamiliar(_idnucleo,"3",appData.idUsuario,_idfamilia,_controllerIdentificacion.text.toString(),_controllerNombre.text.toString(),_controllerCorreo.text.toString(),_controllerNumeroContacto.text.toString(),"lle 1 # 45- 25",_resultradio).then((isSuccess){
                      if(isSuccess==""){
                        _alertHijoMensajes(context,isSuccess);
                      }else{
                        _idNucleo=null;
                        _controllerNombre.text="";
                        _controllerIdentificacion.text="";
                        _controllerNumeroContacto.text="";
                        _controllerCorreo.text="";
                        _estadobuttonguardar=true;
                        camposCedula=true;
                        _enablecampos=false;
                        _alertHijoMensajes(context, isSuccess);
                        setState(() {
                        });
                         }
            });
                  }
                }
              }
            }
 }
 _actualizarListaHijos(){
   ApiService api=new ApiService();
                    api.solicitarlistaOtros(appData.cedula.toString()).then((onValue){
                      if(onValue!=null){
                        print(onValue);
                      setState(() {
                        _listarOtros=onValue;
                      });
                      } 
                });
 }
   _tablaHijos(BuildContext context){
    return   ConstrainedBox(
  constraints: new BoxConstraints(
    maxHeight: 180.0,
    
  ),

  child: FutureBuilder(future: _providerOtros.getlistaotros(),
        builder: (BuildContext context,
                AsyncSnapshot<List<Hijo>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) { 
                      return 
        
        
    Container(
 
    padding:  EdgeInsets.all(10.0),
    child: Scrollbar(
        
        child: new ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
             return  _cardMensajes(snapshot.data[index].documento.toString(),snapshot.data[index].nombre_familiar.toString(),snapshot.data[index].id_nucleo.toString(),snapshot.data[index].correo.toString(),snapshot.data[index].movil.toString(), Colors.red.shade100, context,snapshot.data[index].id_nucleo,snapshot.data[index].id_persona_familiar,snapshot.data[index].tipo_documento);
            
  }
  )
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
                }
        ),
);
   
  }

   Widget _cardMensajes(texto, nombre_otro,id,correo,telefono,color,  BuildContext context,nucleo,idfamiliar,tipo_documento){
   

  return  GestureDetector(  
         child: Card(
           color: color,
           child: Container(
             padding: EdgeInsets.symmetric(horizontal:5.0, vertical: 2.0),
             child: Row(
               children: <Widget>[
                 
                Text(texto, style: TextStyle(color: Colors.grey.shade700, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),),
                SizedBox(width: 15.0,),
                 Text(nombre_otro, style: TextStyle(color:Color.fromRGBO(255, 153, 29, 1.0),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),), 
                Expanded(
                                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

              
                    ],
                  ),
                )
              ],
             ),
           ),
         ), onTap: (){
           setState(() {
             _estadobuttonguardar=false;
             _enablecampos=true;
             camposCedula=false;
           });
             _controllerNombre.text=nombre_otro;
             _controllerIdentificacion.text=texto;
                    _controllerCorreo.text=correo;
                    _controllerNumeroContacto.text=telefono;
                  _idNucleo=nucleo;
                  _idfam=idfamiliar;
                  _radioValue=tipo_documento;
                  _handleRadioValueChange(_radioValue);
                  },
                  );

}
  Widget _crearBotonRedondeado(Color color, IconData icon, BuildContext context,int posicion ) {
 final size=MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          width: size.width * 0.28,
          height: 90.0,
          margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
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
          child: IconButton(
          icon:Icon(icon, size: 65.0,),
          color: Colors.grey.shade700 ,
          onPressed: (){
           // _selecionadoItem2(posicion, texto);
          },
          ),
        ),

      ],
    );

  }

  Widget _barraArribaConyugue(){
    final size=MediaQuery.of(context).size;
   return  Container(
      child:Column(children: <Widget>[
     
     GestureDetector(
       child: Align( child:Container( child: Text('ELIMINAR',style:TextStyle(fontSize: 18.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)),),alignment: Alignment.topRight,),
       onTap: (){
          ApiService apiService=new ApiService();
          if(_idNucleo != null){
            apiService.borrarFamiliar(_idNucleo).then((onValue){
               setState(() {
              _controllerNombre.text="";
              _controllerIdentificacion.text="";
              _controllerCorreo.text="";
              _controllerNumeroContacto.text="";
              _estadobuttonguardar=true;
              _alertHijoMensajes(context, "Eliminado correstamente");
            });
            });
          }else{
            _alertHijoMensajes(context, "Debe selecionar primero un hijo de la lista");
           
          }
       },),
      Row(children: <Widget>[
        Align(child:  _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0),Icons.add_circle_outline, context,7) ,alignment: Alignment.topLeft,),
        Column(children: <Widget>[
         Container(width: size.width * 0.68,child: Align(child:Text('OTROS',style: TextStyle(fontFamily: 'CenturyGothic',fontSize: 18.0,fontWeight: FontWeight.bold ),),alignment: Alignment.centerLeft,),),
           Container(height: 8.0,width: size.width * 0.68, decoration: BoxDecoration( color: Color.fromRGBO(255, 114, 0, 1.0), borderRadius: BorderRadius.circular(1.0)),),
        ],)
       
      ],)
      ],)
    );
  }

  Widget _camposFormulario(String texto,TextEditingController controller,TextInputType type){
    return Container(
      width: 350.0,
      margin: EdgeInsets.fromLTRB(10, 4, 10, 4),
      height: 50,
      child:TextField(
              controller: controller,
                autofocus: false,
                keyboardType: type,
                enabled: _enablecampos,
                style:
                    new TextStyle(fontSize: 13.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                  filled: true,
                  hintStyle: TextStyle(color: Color.fromRGBO(255, 153, 29, 1.0), fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold),
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

  _opcionesDocumentos(){
    return Visibility(
      visible: (camposCedula) ? false: true ,
      child: Container(
      margin: EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
      height: 40,
     child: Row(
      children: <Widget>[
      new Radio(
        autofocus: true,
        activeColor: Color.fromRGBO(255, 153, 29, 1.0),
        value: "CC",
        groupValue: _radioValue,
        onChanged: _handleRadioValueChange,
      ),
      Text("CC",style: TextStyle(fontSize: 12,fontFamily: 'CenturyGothic',color: Colors.black),),
      new Radio(
        activeColor: Color.fromRGBO(255, 153, 29, 1.0),
        value: "TI",
        groupValue: _radioValue,
        onChanged: _handleRadioValueChange,
      ),
      Text("TI",style: TextStyle(fontSize: 12,fontFamily: 'CenturyGothic',color: Colors.black),),
      new Radio(
        value: "CR",
        activeColor: Color.fromRGBO(255, 153, 29, 1.0),
        groupValue: _radioValue,
        onChanged: _handleRadioValueChange,
      ),
      Text("CR",style: TextStyle(fontSize: 12,fontFamily: 'CenturyGothic',color: Colors.black),),
      new Radio(
        value: "PASAPORTE",
        activeColor: Color.fromRGBO(255, 153, 29, 1.0),
        groupValue: _radioValue,
        onChanged: _handleRadioValueChange,
      ),
      Text("PASAPORTE",style: TextStyle(fontSize: 12,fontFamily: 'CenturyGothic',color: Colors.black),),
    ]
    ), 
    ),
    );
  }
Widget _camposFormularioCedula(String texto,TextEditingController controller,TextInputType type,String prefix,){
    return Container(
      width: 190.0,
      height: 50,
      child:TextField(
              controller: controller,
                autofocus: false,
                keyboardType: type,
                enabled: camposCedula,
                style:
                    new TextStyle(fontSize: 11.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                  filled: true,
                  hintStyle: TextStyle(color: Color.fromRGBO(255, 153, 29, 1.0), fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold),
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

  Widget _botonBuscarFamiliar(){
   return GestureDetector(
       onTap: (){ 
       }, 
       child: Container(
         width: 100,
         height: 60.0,
       margin: EdgeInsets.symmetric(horizontal: 10.0 ),
       padding: EdgeInsets.symmetric(vertical: 7.0),
       child: RaisedButton(
         color: Color.fromRGBO(255, 153, 29, 1.0),
                 shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5),),
          onPressed: () {
          if (!_controllerIdentificacion.text.isEmpty){
              if(_controllerIdentificacion.text.length <6 || _controllerIdentificacion.text.length >10){
                  _alertHijoMensajes(context, "Campo identificacion no puede tener mas de 10 y menos 6 digitos");
              }else{

                 if(_validarnumeros(_controllerIdentificacion.text)== false){
                      _alertHijoMensajes(context, 'solo puede ingresas numeros en identificacion');
                      return;
                    }
                _providerOtros.getOtros(_controllerIdentificacion.text).then((datos) {
                  _idNucleo=null;
                if (datos.estado_solicitud){
                    _controllerCorreo.text=datos.correo;
                    _controllerNombre.text=datos.nombre_familiar;
                    _controllerNumeroContacto.text=datos.movil;
                    camposCedula=false;
                    _enablecampos=true;
                    setState(() {
                      
                    });
                }else{
                  if(datos.mensaje_solicitud=="Persona ya está guardada como Familiar"){
                    _alertHijoMensajes(context, datos.mensaje_solicitud);
                  }else{
                    camposCedula=false;
                  _enablecampos=true;
                  _alertHijoMensajes(context, "Puede guadar el familair nuevo");
                  setState(() {
                    
                  });
                  }
                }
            });
         
              }
          }else{
                _alertHijoMensajes(context, "No se puede degar campo vacio");
          }
          },
          child: const Text(
            'BUSCAR',
            style:TextStyle(fontSize: 15.0, color: Colors.black,fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)
          ),
          )
     ),
   );

 }

   _botonPrincipal(){

   return GestureDetector(
       onTap: (){ 
         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DrawerItem() ));
       }, 
       child: Container(
       margin: EdgeInsets.symmetric(horizontal: 80.0 ),
       padding: EdgeInsets.symmetric(vertical: 7.0),
       child: RaisedButton(
                 shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5),),
          onPressed: () {},
          child: const Text(
            'PRINCIPAL',
            style:TextStyle(fontSize: 24.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)
          ),
          )
     ),
   );

 }
 
_botonGuardar(){

    if(camposCedula){
     return Container(
       height: 80,
       child: Text('Primero ingrese el numero de identificacion y presionar el boton buscar',textAlign: TextAlign.center,),
     );
   }else{
     return GestureDetector(
       onTap: (){ 
         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DrawerItem() ));
       }, 
       child: Container(
       margin: EdgeInsets.symmetric(horizontal: 80.0 ),
       padding: EdgeInsets.symmetric(vertical: 7.0),
       child: RaisedButton(
         color: Color.fromRGBO(255, 153, 29, 1.0),
                 shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5),),
          onPressed: () {
            if(_estadobuttonguardar){
                _guardareditar("","");
            }else{
               _guardareditar(_idNucleo.toString(),_idfam.toString());
            }
                  
          },
          child:  Text(
            _estadobuttonguardar ?  "GUARDAR" : "ACTUALIZAR INFORMACION",
            textAlign: TextAlign.center,
            style:TextStyle(fontSize: _estadobuttonguardar ? 18.0 :14.0, color: Colors.black,fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)
          ),
          )
     ),
   );
   }

 }
bool _validarnumeros(String value){
    final n = num.tryParse(value);
  if(n == null) {
    return false;
  }
  return true;
 }
 bool _validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}


}