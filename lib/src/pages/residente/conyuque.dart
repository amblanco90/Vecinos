
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/http/api-service.dart';
import 'package:edificion247/src/http/datos-familia.dart';
import 'package:edificion247/src/models/conyugue.dart';
import 'package:edificion247/src/providers/conyugeProvider.dart';
import 'package:flutter/material.dart';

class ConyuguePage extends StatefulWidget {
  @override
  _ConyuguePageState createState() => _ConyuguePageState();
  
}
 
   
class _ConyuguePageState extends State<ConyuguePage> {
  final _controllerNombre=TextEditingController();
   final _controllerIdentificacion=TextEditingController();
    final _controllerNumeroContacto=TextEditingController();
    final _controllerCorreo=TextEditingController();
    
    int _idNucleofamilia;
    int _idNucleo;
    int _idfam;
    bool _estadoButtonGuardar=true;
    final  _conyugeProvider=new ConyugeProvider();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:FutureBuilder(
            future: _conyugeProvider.getConyuge(),   
            builder: (BuildContext context,
                AsyncSnapshot<Conyuge> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) { 
                      if(snapshot.data.nombre_familiar != null){
                        _controllerNombre.text=snapshot.data.nombre_familiar;
                      _controllerIdentificacion.text=snapshot.data.documento.toString();
                      _controllerCorreo.text=snapshot.data.correo.toString();
                      _controllerNumeroContacto.text=snapshot.data.movil.toString();
                      _idNucleo=snapshot.data.id_nucleo;
                      _idfam=snapshot.data.id_persona_familiar;
                      _estadoButtonGuardar=false;
                      }
                      return Stack(
        children: <Widget>[
          Column(
            children:<Widget>[
             _barraArribaConyugue(),
              _camposFormulario('NOMBRE COMPLETO', _controllerNombre, TextInputType.text),
              _camposFormulario('IDENTIFICACION', _controllerIdentificacion, TextInputType.number),
              _camposFormulario('NUMERO DE CONTACTO', _controllerNumeroContacto, TextInputType.number),
              _camposFormulario('CORREO ELECTRONICO', _controllerCorreo, TextInputType.emailAddress),
                _botonGuardar(),
                       Text('*Recuerde que estos miembros tendran \n acceso a la aplicacion por medio  del \n documento de identificacion bajo el rol \n del "Nucleo Familiar" en la unidad \n Residente Registrada',style:TextStyle(fontSize: 15.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)),
                        Divider(height: 20,color: Colors.white,),
                      // _botonPrincipal()   
              
            ]
          )
        ],
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
              }),
                        
                
                    
              
   );
  
  }

  Widget _crearBotonRedondeado(Color color, IconData icon,int posicion ) {
    return Column(
      children: <Widget>[
        Container(
          width: 100,
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
              _estadoButtonGuardar=true;
              _alertConyugeMensajes(context, "Eliminado correstamente");
            });
            });
          }else{
            _alertConyugeMensajes(context, "Uste no tiene conyuge guardado para poder borrar");
          }
       },),
      Row(children: <Widget>[
        Align(child:  _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0),Icons.favorite,7) ,alignment: Alignment.topLeft,),
        Column(children: <Widget>[
         Container(width: 250.0,child: Align(child:Text('CONYUGE',style: TextStyle(fontFamily: 'CenturyGothic',fontSize: 18.0,fontWeight: FontWeight.bold ),),alignment: Alignment.centerLeft,),),
           Container(height: 8.0,width: 240.0, decoration: BoxDecoration( color: Color.fromRGBO(255, 114, 0, 1.0), borderRadius: BorderRadius.circular(1.0)),),
        ],)
       
      ],)
      ],)
    );
  }
_guardareditar(String _idnucleo,String _idfamilia){
    if(_controllerNombre.text.isEmpty || _controllerCorreo.text.isEmpty || _controllerIdentificacion.text.isEmpty || _controllerNumeroContacto.text.isEmpty){
              _alertConyugeMensajes(context, "No se puede dejar campos vacio");
              return;
            }else{
                if(_controllerIdentificacion.text.length <6 || _controllerIdentificacion.text.length >10){
                  _alertConyugeMensajes(context, "Campo identificacion no puede tener mas de 10 y menos 6 digitos");
                return;
              }else{
                if(_validarnumeros(_controllerIdentificacion.text)== false){
                      _alertConyugeMensajes(context, 'solo puede ingresas numeros en identificacion');
                      return;
                    }
                    if(_validarnumeros(_controllerNumeroContacto.text)== false){
                      _alertConyugeMensajes(context, 'solo puede ingresas numeros en numero contacto');
                      return;
                    }
                    if(_validateEmail(_controllerCorreo.text) ==  false){
                      _alertConyugeMensajes(context, "correo no valido");
                  return;
                }else{
                  if(_controllerNumeroContacto.text.length <7 || _controllerNumeroContacto.text.length>10){
                    _alertConyugeMensajes(context, "Campo numero de contacto no puede tener mas de 10 y menos 7 digitos");
                    return;
                  }else{
                    DatosFamilia datosFamilia=new DatosFamilia(id_nucleo:"216",id_parentesco:"3",id_residente:"153",cedula_familiar:"12639357",nombre_familiar:"afdsds",apellidos_familiar:"",correo_familiar:"aad@gmail.com",movil_familiar:"7436463",direccion_familiar:"asdas",username:appData.cedula.toString());
                    //DatosFamilia datosFamilia=DatosFamilia(id_parentesco: '3',id_residente:appData.idUsuario.toString(),cedula_familiar: _controllerIdentificacion.text,nombre_familiar: _controllerNombre.text,apellidos_familiar: '',correo_familiar:_controllerCorreo.text,movil_familiar: _controllerNumeroContacto.text,direccion_familiar: 'calle 1 # 45-25',username: 'rperz',id_nucleo: _idNucleo.toString(),id_familiar:_idfam.toString());
                    ApiService apiService=new ApiService();
                    apiService.guardarFamiliar(_idnucleo,"1",appData.idUsuario,_idfamilia,_controllerIdentificacion.text.toString(),_controllerNombre.text.toString(),_controllerCorreo.text.toString(),_controllerNumeroContacto.text.toString(),"lle 1 # 45- 25").then((isSuccess){
                      if(isSuccess == ""){
                        _idNucleo=null;
                          _alertConyugeMensajes(context, "registro exito");
                        _controllerNombre.text="";
                        _controllerIdentificacion.text="";
                        _controllerNumeroContacto.text="";
                        _controllerCorreo.text="";
                        setState(() {
                          
                        });
                      }else{
                        _alertConyugeMensajes(context, isSuccess);
                         }
            });
                  }
                }
              }
            }
 }
  Widget _camposFormulario(String texto,TextEditingController controller,TextInputType type){
    return Container(
      width:  350.0,
      margin: EdgeInsets.fromLTRB(10, 4, 10, 4),
      height: 50,
      child:TextField(
              controller: controller,
                autofocus: false,
                keyboardType: type,
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

   return  Container(
       margin: EdgeInsets.symmetric(horizontal: 80.0 ),
       padding: EdgeInsets.symmetric(vertical: 7.0),
       child: RaisedButton(
         color:  Color.fromRGBO(255, 153, 29, 1.0) ,
                 shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5),),
          onPressed: () {
           if(_estadoButtonGuardar){
             _guardareditar("","");
           }else{
            _guardareditar(_idNucleo.toString(),_idfam.toString());
           }
          },
          child:  Text(
           _estadoButtonGuardar ?  "GUARDAR" : "ACTUALIZAR INFORMACION",
           textAlign: TextAlign.center,  style:TextStyle(fontSize: _estadoButtonGuardar ? 18.0 :14.0, color: Colors.black,fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold,)
          ),
          )
     );

 }
Widget _alertConyugeMensajes (BuildContext context,String mensaje){

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