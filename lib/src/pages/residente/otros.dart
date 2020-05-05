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
    final _solicitarListaOtros=new OtrosProvider();
    int _idNucleo;
    int _idfam;
    bool _estadobuttonguardar=true;
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
              _camposFormulario('NOMBRE COMPLETO', _controllerNombre, TextInputType.text),
              _camposFormulario('IDENTIFICACION', _controllerIdentificacion, TextInputType.number),
              _camposFormulario('NUMERO DE CONTACTO', _controllerNumeroContacto, TextInputType.number),
              _camposFormulario('CORREO ELECTRONICO', _controllerCorreo, TextInputType.emailAddress),
                _botonGuardar(),
                       Text('*Recuerde que estos miembros tendran \n acceso a la aplicacion por medio  del \n documento de identificacion bajo el rol \n del "Nucleo Familiar" en la unidad \n Residente Registrada',style:TextStyle(fontSize: 15.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)),
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
                    DatosFamilia datosFamilia=new DatosFamilia(id_nucleo:"216",id_parentesco:"3",id_residente:"153",cedula_familiar:"12639357",nombre_familiar:"afdsds",apellidos_familiar:"",correo_familiar:"aad@gmail.com",movil_familiar:"7436463",direccion_familiar:"asdas",username:"rperez");
                    //DatosFamilia datosFamilia=DatosFamilia(id_parentesco: '3',id_residente:appData.idUsuario.toString(),cedula_familiar: _controllerIdentificacion.text,nombre_familiar: _controllerNombre.text,apellidos_familiar: '',correo_familiar:_controllerCorreo.text,movil_familiar: _controllerNumeroContacto.text,direccion_familiar: 'calle 1 # 45-25',username: 'rperz',id_nucleo: _idNucleo.toString(),id_familiar:_idfam.toString());
                    ApiService apiService=new ApiService();
                    apiService.guardarFamiliar(_idnucleo,"3",appData.idUsuario,_idfamilia,_controllerIdentificacion.text.toString(),_controllerNombre.text.toString(),_controllerCorreo.text.toString(),_controllerNumeroContacto.text.toString(),"lle 1 # 45- 25").then((isSuccess){
                      if(isSuccess){
                        _idNucleo=null;
                          _alertHijoMensajes(context, "registro exito");
                        _controllerNombre.text="";
                        _controllerIdentificacion.text="";
                        _controllerNumeroContacto.text="";
                        _controllerCorreo.text="";
                        _estadobuttonguardar=true;
                        setState(() {
                          
                        });
                      }else{
                        _alertHijoMensajes(context, "A ocurrido un error al tratar de guardar un familiar");
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

  child: FutureBuilder(future: _solicitarListaOtros.getlistaotros(),
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
             return  _cardMensajes(snapshot.data[index].documento.toString(),snapshot.data[index].nombre_familiar.toString(),snapshot.data[index].id_nucleo.toString(),snapshot.data[index].correo.toString(),snapshot.data[index].movil.toString(), Colors.red.shade100, context,snapshot.data[index].id_nucleo,snapshot.data[index].id_persona_familiar);
            
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

   Widget _cardMensajes(texto, nombre_otro,id,correo,telefono,color,  BuildContext context,nucleo,idfamiliar){
   

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
           });
             _controllerNombre.text=nombre_otro;
             _controllerIdentificacion.text=texto;
                    _controllerCorreo.text=correo;
                    _controllerNumeroContacto.text=telefono;
                  _idNucleo=nucleo;
                  _idfam=idfamiliar;
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
    final size=MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
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
            style:TextStyle(fontSize: _estadobuttonguardar ? 18.0 :16.0, color: Colors.black,fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)
          ),
          )
     ),
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