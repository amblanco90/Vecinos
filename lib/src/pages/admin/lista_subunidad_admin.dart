import 'package:edificion247/src/models/listasubunidad.dart';
import 'package:edificion247/src/models/sub-unidad.dart';
import 'package:edificion247/src/providers/listasubunidadProvider.dart';
import 'package:edificion247/src/providers/subunidadProvider.dart';
import 'package:flutter/material.dart';

class ListaSubUnidadesPage extends StatefulWidget {

  @override
  _ListaSubUnidadesPageState createState() => _ListaSubUnidadesPageState();
}

class _ListaSubUnidadesPageState extends State<ListaSubUnidadesPage> {
  final _listarVisita=new ListaSubUnidadProvider();
  final _controllerNombrenclatura=TextEditingController();
  final _controllerPropietario=TextEditingController();
  final _controllerResidente=TextEditingController();
  final _controllerEstadoCuenta=TextEditingController();
  final _controllerTotal=TextEditingController();
  dynamic  _datoslistaSubUnidad;
 String _tipoUnidad="Apartamento";
  String _tipoEstado="Activo";
  bool _estadolistasubunidad=true;
  bool _estadoButton=false;
  String _idactualizar;
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      children: <Widget>[
        _listaSubunidad(),
        _formularioActualizar(),
      ],
    ),
    )
    
   ;
   
  }

  _listaSubunidad(){
    if (_estadolistasubunidad){
       return FutureBuilder(future: _listarVisita.getlistasubunidades(),
        builder: (BuildContext context,
                AsyncSnapshot<List<DatosListaSubunidades>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) { 
                      _estadolistasubunidad=false;
                      _datoslistaSubUnidad=snapshot;
                      return     ConstrainedBox(
  constraints: new BoxConstraints(
    maxHeight: 180.0,
    
  ),

  child: 
      Container(
 
    padding:  EdgeInsets.all(10.0),
    child: Scrollbar(
        
        child: new ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return  _cardMensajesListaSubunidad(snapshot.data[index].propietario.toString(),snapshot.data[index].residente.toString(),snapshot.data[index].tipoUnidad,snapshot.data[index].estadoCuenta,snapshot.data[index].nomenclatura,snapshot.data[index].estadoUnidad,snapshot.data[index].id.toString(),snapshot.data[index].total.toString());
            
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
                    }
                    }
                    );
    }else{
      return     ConstrainedBox(
  constraints: new BoxConstraints(
    maxHeight: 180.0,
    
  ),

  child: 
      Container(
 
    padding:  EdgeInsets.all(10.0),
    child: Scrollbar(
        
        child: new ListView.builder(
          itemCount: _datoslistaSubUnidad.data.length,
          itemBuilder: (context, index) {
            return  _cardMensajesListaSubunidad(_datoslistaSubUnidad.data[index].propietario.toString(),_datoslistaSubUnidad.data[index].residente.toString(),_datoslistaSubUnidad.data[index].tipoUnidad,_datoslistaSubUnidad.data[index].estadoCuenta,_datoslistaSubUnidad.data[index].nomenclatura,_datoslistaSubUnidad.data[index].estadoUnidad,_datoslistaSubUnidad.data[index].id.toString(),_datoslistaSubUnidad.data[index].total.toString());
            
  },
        ),
        
    ),
  ),
  
  
);
    }
  }

  Widget _formularioActualizar(){
    return Container(
      child: Column(
        children: <Widget>[
          _camposFormulario("NOMBRE PROPIETARIO",_controllerPropietario, TextInputType.text, ""),
          _camposFormulario("NOMENCLATURA",_controllerNombrenclatura, TextInputType.text, ""),
          _camposFormulario("RESIDENTE",_controllerResidente, TextInputType.text, ""),
           _camposFormulario("ESTADO CUENTA",_controllerEstadoCuenta, TextInputType.text, ""),
           _camposFormulario("TOTAL",_controllerTotal, TextInputType.text, ""),
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
               _botonActualizar()
        ],
      ),
    
    );
  }
  

Widget _camposFormulario(String texto,TextEditingController controller,TextInputType type,String prefix){
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
               //   enabled: _campostipoA,
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

_actualizar(){
   if( _controllerPropietario.text != "" ||   _controllerNombrenclatura.text != "" ){
  
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
        if(_tipoEstado == "Activo"){
          _posiciontipoestado=1;
        }else if(_tipoUnidad == "Inactivo"){
          _posiciontipoestado=2;
        }
        print(_posiciontipounidad.toString());
        DatosSubUnidad datosSubUnidad= new DatosSubUnidad(inputId: _idactualizar,inputNomen: _controllerNombrenclatura.text,tipoUnidad: _posiciontipounidad.toString(),inputEstado: _posiciontipoestado.toString(),inputNameProp: _controllerPropietario.text);
        _subunidadProvider.setSubUnidad(datosSubUnidad).then((onValue){
           if(onValue == true){
               _controllerPropietario.text ="";
            _controllerNombrenclatura.text="";
         _alerListaSubunidad(context, "Actualizacion exitosa");
           }else{
              _alerListaSubunidad(context, "A ocurrido al tratar de guardar intenetar del nuevo");
           }
        });
     
   }else{
     _alerListaSubunidad(context, "No se puede dejar campos vacios");
   }
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
    items: <String>['Activo', 'Inactivo']
      .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
      .toList(),
  );
}

  Widget _cardMensajesListaSubunidad(String propietario ,String residente,String tipounida,String estadocuenta,String nomenclatura,String estadoUnidad,String id,String total){
    
  return  GestureDetector(  
         child: Card(
           color: Colors.red.shade100,
           child: Container(
             padding: EdgeInsets.symmetric(horizontal:5.0, vertical: 2.0),
             child: Row(
               children: <Widget>[
                 
                Text(propietario, style: TextStyle(color: Colors.grey.shade700, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),),
                SizedBox(width: 15.0,),
                 Text(residente, style: TextStyle(color:Color.fromRGBO(255, 153, 29, 1.0),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),), 
                Expanded(
                                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                     Text(tipounida, style: TextStyle(color: Colors.grey.shade700,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 10.0),),

                    ],
                  ),
                )
              ],
             ),
           ),
         ), onTap: (){
                   _controllerPropietario.text=propietario;
                   _controllerNombrenclatura.text=nomenclatura;
                   _controllerResidente.text=residente;
                   _tipoUnidad=tipounida;
                   _tipoEstado=estadoUnidad;
                   _controllerEstadoCuenta.text=estadocuenta;
                   _controllerTotal.text=total;
                   _estadoButton=true;
                   _idactualizar=id;
                   setState(() {
                     
                   });
                  },
                  );

}

Widget _botonActualizar(){

   return GestureDetector(
       onTap: (){ 
       }, 
       child: Container(
         width: double.infinity,
         height: 60.0,
       margin: EdgeInsets.symmetric(horizontal: 10.0 ),
       padding: EdgeInsets.symmetric(vertical: 7.0),
       child: RaisedButton(
         color:_estadoButton ? Color.fromRGBO(255, 153, 29, 1.0) :Colors.black12 ,
                 shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5),),
          onPressed: () {
            if(_estadoButton){
                _actualizar();
            }else{
            _alerListaSubunidad(context,"Debe selecionar un elemento de la tabla de arriba");
            }

          },
          child:  Text(
            _estadoButton ? 'ACTUALIZAR':'DESHABILITADO',
            style:TextStyle(fontSize: 18.0, color: Colors.black,fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)
          ),
          )
     ),
   );

 }
 Widget _alerListaSubunidad (BuildContext context,String mensaje){

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