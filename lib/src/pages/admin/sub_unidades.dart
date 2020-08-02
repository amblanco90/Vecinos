import 'package:edificion247/src/models/sub-unidad.dart';
import 'package:edificion247/src/providers/propitarioProvider.dart';
import 'package:edificion247/src/providers/subunidadProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SubUnidadesPages extends StatefulWidget {

  @override
  _SubUnidadesPagesState createState() => _SubUnidadesPagesState();
}
final _controllerId=TextEditingController();
  final _controllerFechaCreacion=TextEditingController();
  final _controllerCedulaPropietario=TextEditingController();
  final _controllerNombre=TextEditingController();
  final _controllerApellido=TextEditingController();
  final _controllerCelular=TextEditingController();
  final _controllerCorreo=TextEditingController();
  final _controllerNomenclatura=TextEditingController();
  final _controllerTelefono=TextEditingController();
  String _tipoUnidad="Apartamento";
  String _tipoEstado="Libre";
  bool _campostipoA=false;
  bool _campostipoB=false;
   bool camposCedula=true;
   bool _guardarEstado=false;
   final now = new DateTime.now();
   String currentTime = DateFormat('yyyy-MM-dd').format(now);
  final _propietarioConyugue= new PropitarioProvider();
class _SubUnidadesPagesState extends State<SubUnidadesPages> {
  @override
  Widget build(BuildContext context) {
    _controllerFechaCreacion.text=currentTime;
    return SingleChildScrollView(
      child:Column(
        children: <Widget>[
          Row(children: <Widget>[
          _camposFormularioCedula('CEDULA PROPIETARIO', _controllerCedulaPropietario, TextInputType.number,""),
         Align(alignment: Alignment.centerRight, child:  _botonBuscarPropitario(),)
          ],),
              _camposFormularioA('ID', _controllerId, TextInputType.number,""),
              _camposFormularioFecha('FECHA CREACION', _controllerFechaCreacion, TextInputType.number,""),
             Align(alignment: Alignment.centerLeft, child:  Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 0),child: Text("DATOS BASICOS", style: TextStyle(color: Colors.black,  fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold,fontSize: 15.0,),))),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),),
              _camposFormularioA('NOMBRE', _controllerNombre, TextInputType.text,""),
              _camposFormularioA('APELLIDO', _controllerApellido, TextInputType.text,""),
              _camposFormularioA('CELULAR', _controllerCelular, TextInputType.number,"+57"),
              _camposFormularioA('CORREO', _controllerCorreo, TextInputType.emailAddress,"@"),
               Align(alignment: Alignment.centerLeft, child:  Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 0),child: Text("UBICACION", style: TextStyle(color: Colors.black,  fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold,fontSize: 15.0,),))),
               Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),),
               _camposFormularioB('NOMENCLATURA', _controllerNomenclatura, TextInputType.text,""),
               _camposFormularioB('TELEFONO', _controllerTelefono, TextInputType.number,"+57"),
               Row(children: <Widget>[
                 Column(children: <Widget>[
                   Align(alignment: Alignment.centerLeft, child:  Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 0),child: Text("TIPO DE UNIDAD", style: TextStyle(color: Colors.black,  fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold,fontSize: 15.0,),))),
                 _dropdownButtonTipoUnidad()
                 ],),
                Padding(padding: EdgeInsets.fromLTRB(50, 0, 0, 0),),
                  Column(children: <Widget>[
                   Align(alignment: Alignment.centerLeft, child:  Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 0),child: Text("ESTADO", style: TextStyle(color: Colors.black,  fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold,fontSize: 15.0,),))),
                 _dropdownButtonEstado()
                 ],),
               ],),
               Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0),),
               _botonGuardar()  
               
          ]
          ) ,
          );
  }

 
  _solicitarInformacionPropitario(String cedula){
    _propietarioConyugue.getPropitario(cedula).then((onValue){
      if(onValue.inputApeProp != null){
         _controllerId.text=onValue.inputIdProp.toString();
         _controllerNombre.text=onValue.inputNameProp.toString();
         _controllerApellido.text=onValue.inputApeProp.toString();
         _controllerCelular.text=onValue.inputCel.toString();
         _controllerCorreo.text=onValue.inputEmail.toString();
         setState(() {
           _campostipoA=false;
           _campostipoB=true;
           _guardarEstado=true;
          
         });
      }else{
        _controllerId.text="";
         _controllerNombre.text="";
         _controllerApellido.text="";
         _controllerCelular.text="";
         _controllerCorreo.text="";
         setState(() {
           _campostipoA=true;
           _campostipoB=true;
           _guardarEstado=true;
         });
          _alertSubUninidadMensajes(context,"No hay propietario registrado con esa cedula");
      }
         
    });
  }

Widget _alertSubUninidadMensajes (BuildContext context,String mensaje){

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
 
 Widget _camposFormularioCedula(String texto,TextEditingController controller,TextInputType type,String prefix,){
    return Column(children: <Widget>[
      Text(texto, style:  TextStyle(color: Color.fromRGBO(255, 153, 29, 1.0),  fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold,fontSize: 18.0),),
       Container(
      width:  200,
      margin: EdgeInsets.fromLTRB(10, 4, 10, 4),
      height: 50,
      child:TextField(
              controller: controller,
                autofocus: false,
                keyboardType: type,
                style:
                    new TextStyle(fontSize: 14.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                  filled: true,
                  enabled: camposCedula,
                  prefixText: prefix,
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
      
    )
      ],);
  }

  Widget _camposFormularioFecha(String texto,TextEditingController controller,TextInputType type,String prefix){
    return Column(children: <Widget>[
      Text(texto, style:  TextStyle(color: Color.fromRGBO(255, 153, 29, 1.0),  fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold,fontSize: 18.0),),
       Container(
      width:  double.infinity,
      margin: EdgeInsets.fromLTRB(10, 4, 10, 4),
      height: 50,
      child:TextField(
              controller: controller,
                autofocus: false,
                keyboardType: type,
                style:
                    new TextStyle(fontSize: 14.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                  filled: true,
                  enabled: false,
                  prefixText: prefix,
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
    )
      ],);
  }
   Widget _camposFormularioA(String texto,TextEditingController controller,TextInputType type,String prefix){
    return Column(children: <Widget>[
      Text(texto, style:  TextStyle(color: Color.fromRGBO(255, 153, 29, 1.0),  fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold,fontSize: 18.0),),
       Container(
      width:  double.infinity,
      margin: EdgeInsets.fromLTRB(10, 4, 10, 4),
      height: 50,
      child:TextField(
              controller: controller,
                autofocus: false,
                keyboardType: type,
                style:
                    new TextStyle(fontSize: 14.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                  filled: true,
                  enabled: _campostipoA,
                  prefixText: prefix,
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
    )
      ],);
  }

  Widget _camposFormularioB(String texto,TextEditingController controller,TextInputType type,String prefix){
    return Column(children: <Widget>[
      Text(texto, style:  TextStyle(color: Color.fromRGBO(255, 153, 29, 1.0),  fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold,fontSize: 18.0),),
       Container(
      width:  double.infinity,
      margin: EdgeInsets.fromLTRB(10, 4, 10, 4),
      height: 50,
      child:TextField(
              controller: controller,
                autofocus: false,
                keyboardType: type,
                style:
                    new TextStyle(fontSize: 14.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                  filled: true,
                  enabled: _campostipoB,
                  prefixText: prefix,
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
      
    )
      ],);
  }

  Widget _botonGuardar(){

   return GestureDetector(
       onTap: (){ 
       }, 
       child: Container(
         width: double.infinity,
         height: 60.0,
       margin: EdgeInsets.symmetric(horizontal: 10.0 ),
       padding: EdgeInsets.symmetric(vertical: 7.0),
       child: RaisedButton(
         color: Color.fromRGBO(255, 153, 29, 1.0),
                 shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5),),
          onPressed: () {
            if(_guardarEstado){
              _guardarSubUnidad();
            }else{
              _alertSubUninidadMensajes(context, "Ingrese un numero de cedula y precione buscar");
            }

          },
          child: const Text(
            'GUARDAR',
            style:TextStyle(fontSize: 18.0, color: Colors.black,fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)
          ),
          )
     ),
   );

 }

 _guardarSubUnidad(){
   if( _controllerNomenclatura.text != ""  && _controllerTelefono.text  != "" && _controllerFechaCreacion.text !="" && _controllerApellido.text !="" && _controllerCedulaPropietario.text !="" && _controllerCelular.text!= "" && _controllerCorreo.text != ""){
     if(_validateEmail(_controllerCorreo.text)== true){
        final _subunidadProvider=new SubUnidadProvider();
        int _posiciontipounidad=1;
        int _posiciontipoestado=1;
        if(_tipoUnidad == "Apartamento"){
          _posiciontipounidad=2;
        }else if(_tipoUnidad == "Casa"){
          _posiciontipounidad=1;
        }else{
          _posiciontipounidad=3;
        }
        if(_tipoEstado == "Libre"){
          _posiciontipoestado=1;
        }else if(_tipoUnidad == "Ocupado"){
          _posiciontipoestado=2;
        }
        print(_posiciontipounidad.toString());
        DatosSubUnidad datosSubUnidad= new DatosSubUnidad(inputId: "",inputNomen: _controllerNomenclatura.text,tipoUnidad: _posiciontipounidad.toString(),inputEstado: _posiciontipoestado.toString(),inputIdProp: _controllerId.text,inputNameProp: _controllerNombre.text,inputApeProp: _controllerApellido.text,inputCel: _controllerCelular.text,inputEmail: _controllerCorreo.text,inputTel: _controllerTelefono.text);
        _subunidadProvider.setSubUnidad(datosSubUnidad).then((onValue){
           if(onValue == true){
               _controllerCedulaPropietario.text ="";
            _controllerId.text="";
         _controllerNombre.text="";
         _controllerApellido.text="";
         _controllerCelular.text="";
         _controllerCorreo.text="";
         _controllerNomenclatura.text="";
         _controllerTelefono.text="";
         _campostipoA=false;
         _campostipoB=false;
         _guardarEstado=false;
         _alertSubUninidadMensajes(context, "Registro exitoso");
           }else{
              _alertSubUninidadMensajes(context, "A ocurrido al tratar de guardar intenetar del nuevo");
           }
        });
     }else{
       _alertSubUninidadMensajes(context, "El correo ingresado no es valido");
     }
   }else{
     _alertSubUninidadMensajes(context, "No se puede dejar campos vacios");
   }

 }

 Widget _botonBuscarPropitario(){
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
            _solicitarInformacionPropitario(_controllerCedulaPropietario.text);
          },
          child: const Text(
            'BUSCAR',
            style:TextStyle(fontSize: 15.0, color: Colors.black,fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)
          ),
          )
     ),
   );

 }

  Widget _dropdownButtonTipoUnidad(){
   return DropdownButton<String>(
    value: _tipoUnidad,
    iconSize: 24,
    elevation: 16,
    style: TextStyle(
      color: Colors.black,
      fontSize: 15
    ),
    underline: Container(
      height: 2,
      color: Colors.deepPurpleAccent,
    ),
    onChanged: (String newValue) {
      setState(() {
        _tipoUnidad = newValue;
      });
    },
    items: <String>['Apartamento', 'Casa',]
      .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
      .toList(),
  );
}
Widget _dropdownButtonEstado(){
   return DropdownButton<String>(
    value: _tipoEstado,
    iconSize: 24,
    elevation: 16,
    style: TextStyle(
      color: Colors.black,
      fontSize: 15
    ),
    underline: Container(
      height: 2,
      color: Colors.deepPurpleAccent,
    ),
    onChanged: (String newValue) {
      setState(() {
        _tipoEstado = newValue;
      });
    },
    items: <String>['Libre', 'Ocupado']
      .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
      .toList(),
  );
}

 bool _validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}
}