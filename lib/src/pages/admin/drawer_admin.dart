import 'package:edificion247/src/bloc/provider_perfil_admin.dart';
import 'package:edificion247/src/bloc/provider_unidad.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/http/api-service.dart';
import 'package:edificion247/src/http/datos-reserva.dart';
import 'package:edificion247/src/models/cartelera.dart';
import 'package:edificion247/src/models/listasubunidad.dart';
import 'package:edificion247/src/models/perfilResidente.dart';
import 'package:edificion247/src/models/unidadmodel.dart';
import 'package:edificion247/src/models/noticia.dart';
import 'package:edificion247/src/models/pedidoTaxi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edificion247/src/pages/admin/ad_chatAdministrador.dart';
import 'package:edificion247/src/pages/admin/crearNoticias.dart';
import 'package:edificion247/src/pages/admin/buzon_admin.dart';
import 'package:edificion247/src/pages/admin/link_admin.dart';
import 'package:edificion247/src/pages/admin/lista_reservas_admin.dart';
import 'package:edificion247/src/pages/residente/emergenciasPage.dart';
import 'package:edificion247/src/pages/residente/micasillero.dart';
import 'package:edificion247/src/pages/residente/misvisitas.dart';
import 'package:edificion247/src/providers/casilleroProvider.dart';
import 'package:edificion247/src/pages/admin/junta_directiva.dart';
import 'package:edificion247/src/pages/admin/lista_subunidad_admin.dart';
import 'package:edificion247/src/pages/admin/perfil_admin.dart';
import 'package:edificion247/src/pages/admin/pqr_unidades.dart';
import 'package:edificion247/src/pages/admin/residentes.dart';
import 'package:edificion247/src/pages/admin/segurida.dart';
import 'package:edificion247/src/pages/admin/soporte.dart';
import 'package:edificion247/src/pages/admin/sub_unidades.dart';
import 'package:edificion247/src/pages/admin/zona_sociales.dart';
import 'package:edificion247/src/pages/login/Login.dart';
import 'package:edificion247/src/pages/residente/TaxiPage.dart';
import 'package:edificion247/src/pages/residente/mibuzon.dart';
import 'package:edificion247/src/pages/residente/miperfil.dart';
import 'package:edificion247/src/pages/residente/misfacturas.dart';
import 'package:edificion247/src/pages/residente/miunidad.dart';
import 'package:edificion247/src/pages/residente/pqr.dart';
import 'package:edificion247/src/providers/listasubunidadProvider.dart';
import 'package:edificion247/src/providers/noticiasProvider.dart';
import 'package:edificion247/src/providers/perfilProvider.dart';
import 'package:edificion247/src/providers/push_notification_provider.dart';
import 'package:edificion247/src/providers/subunidadProvider.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:edificion247/src/widgets/detalleNotificacion.dart';
import 'package:edificion247/src/widgets/dropdown_widget.dart';
import 'package:edificion247/src/widgets/noticiasAlert.dart';
import 'package:edificion247/src/widgets/verNoticia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix;
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'dart:convert';
import 'dart:io';
import '../residente/misreservas.dart';
import '../residente/pqr.dart';

import 'package:intl/intl.dart';

class DrawerAdminItem extends StatefulWidget {

  @override
  _DrawerAdminItemState createState() => _DrawerAdminItemState();
}

class _DrawerAdminItemState extends State<DrawerAdminItem> {
 final nombre = TextEditingController();
  final apellido = TextEditingController();
  final telefono = TextEditingController();
  final email = TextEditingController();
  final direccion = TextEditingController();
  final perfilProvider = PerfilProvider();
  var color = Colors.transparent;
  ProgressDialog pr;
    String _nombre_appbar='';
    String _nombre_appbar_anterior="";
    int _posicion_appbar=0;
    int _posicion_appbar_anterior=0;
    String cedularecidente=null;

  // variables de reservas 
   String _zonaSelecionadad='PISCINA ADULTOS';
    String _dropdownStrHoraInicio =" ";
   List opcionesInicial=[" "];
   final _controllerObservaciones=TextEditingController();
   List opcionesFinal=[' '];
    String fecha_Selecionada=' ';
   String _dropdownStrHoraFinal =" ";
    bool _estadoDisponibilidadZonas=true;
    String _idreserva = " ";
     int _posicionZona=1;
     String _selectedDate = ' ';
     bool _vistareserva=false;
    List<dynamic> _listaZonas=new List();
    final now = new DateTime.now();
     
 bool _estadolistasubunidad=true;
 dynamic  _datoslistaSubUnidad;
    @override
    void initState() { 
    super.initState();
    final pushProvider = PushNotificationProvider();
    pushProvider.initNotifications(fincion,context);
    }

   int _item=0;
     _itemSelecionado(  ){
      switch(_item){
        case 0: return _homeAdmin(); 
        case 1: return ProviderUnidad(child: MiUnidad(),);
        case 2: return ResidentesP(); 
        case 3: return PqrUnidades();
        case 4: return BuzonAdmin();
        case 5: return MisFacturas();
        case 6: return PqrUnidades();
        case 7: return SubUnidadesPages();
        case 8: return _notificaciones();
        case 9: return ZonasSocialesPages();
        case 12: return JuntaDirectivaPages();
        case 11:return _vistaperfil();
        case 13:return TaxiPage();
        case 14:return _vistasubunidades();
        case 15:return _chatAdmin();
        case 16:return AdminChatAdministradorPages(cedulachatresidente:cedularecidente);
        case 17:return _vistaUnidad();
        case 18:return MyReserva();
        case 19:return PqrPages();
        case 20:return VisitaPages();
        case 21:return MiCasillero();
        case 22:return EmergenciasPage();
        case 23: return _enviados();
        case 24: return ListaReservaAdminPage();
        case 25: return CrearNoticiasPage();
        case 26: return LinkPagoAdminPage();
                

      }
  
    }

    funcion(){
      setState(() {
        
      });
    }

    emergencia(){
      setState(() {

         _item = 22;
                        _nombre_appbar = 'EMERGENCIAS';
                        _posicion_appbar=0;
        
      });
    }

    fincion(){
    
    setState(() {
                         _item = 8;
                        _nombre_appbar = 'NOTIFICACIONES';
                        _posicion_appbar=0;
                      });
  }
    _selecionadoItem(int posicion,String nombre){
        Navigator.of(context).pop();
         setState(() {
           _posicion_appbar_anterior=_item;
           _nombre_appbar_anterior=_nombre_appbar;
            _item=posicion;
            _nombre_appbar=nombre;
            _posicion_appbar=posicion;
         });
        
    
      }
      _selecionadoItem2(int posicion,String nombre){
      setState(() {
           _posicion_appbar_anterior=_item;
           _nombre_appbar_anterior=_nombre_appbar;
            _item=posicion;
            _nombre_appbar=nombre;
            _posicion_appbar=posicion;
         });
    
      }

      _opcionesDrawer(){
        if(_posicion_appbar==0){
          return Column(
          children: <prefix.Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <prefix.Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _item = 13;
                        _nombre_appbar = 'Home';
                        _posicion_appbar=0;
                      });
                    },
                    child: SizedBox(
                      width: 110,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _item = 17;
                            _nombre_appbar = 'MI UNIDAD';
                            _posicion_appbar=0;
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <prefix.Widget>[
                           FittedBox( 
                             child:  Text(
                              'MI UNIDAD',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'CenturyGothic'),
                            ),
                           ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Container(
                                height: 3.0,
                                width: 95.0,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(137, 70, 39, 2.0),
                                    borderRadius: BorderRadius.circular(2.0)),
                              ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              appData.permisos=='Admini'? Container():  GestureDetector(
                    onTap: () {
                      setState(() {
                        _item = 5;
                        _nombre_appbar = 'Home';
                        _posicion_appbar=0;
                      });
                    },
                    child: SizedBox(
                      width: 140.0,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _item = 5;
                            _nombre_appbar = 'Home';
                            _posicion_appbar=0;
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Column(
                          children: <prefix.Widget>[
                            FittedBox(
                              child: Text(
                              'FACTURACION',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'CenturyGothic'),
                            ),
                             ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Container(
                                height: 3.0,
                                width: 110.0,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(137, 70, 39, 2.0),
                                    borderRadius: BorderRadius.circular(2.0)),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _item = 6;
                        _nombre_appbar = 'Home';
                        _posicion_appbar=0;
                      });
                    },
                    child: SizedBox(
                      width: 110.0,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _item = 6;
                            _nombre_appbar = 'Home';
                            _posicion_appbar=0;
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <prefix.Widget>[
                            FittedBox( 
                              child: Text(
                              'PQR',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  fontFamily: 'CenturyGothic'),
                            ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Container(
                                height: 3.0,
                                width: 90.0,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(137, 70, 39, 2.0),
                                    borderRadius: BorderRadius.circular(2.0)),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        );
        }else{
          return Row(
          children: <prefix.Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <prefix.Widget>[
                  Text(
                    _nombre_appbar,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CenturyGothic'),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      height: 3.0,
                      width: 95.0,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(137, 70, 39, 2.0),
                          borderRadius: BorderRadius.circular(2.0)),
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                ]),
          ],
        );
        }
      }
      _selecionadoItemAnterior(int posicion,String _nombre){
         

          if (posicion == null){
            posicion=11;
          }
         setState(() {
           
            _item=posicion;
            _posicion_appbar=posicion;
            _nombre_appbar=_nombre;
         });
    
      }
  @override
  prefix.Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
            _selecionadoItemAnterior(_posicion_appbar_anterior, _nombre_appbar_anterior),
      child:Scaffold(
      appBar: PreferredSize(
              preferredSize: Size.fromHeight(90.0),
              child: AppBar(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:<prefix.Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                        child: FittedBox(
                          child: Text(appData.nombre ,
                            style: TextStyle(fontFamily: 'CenturyGothic'),
                            textAlign: TextAlign.left),
                        ),
                    ),
                   // DropdownWidget(),
                  ],
                ),
                backgroundColor: Color.fromRGBO(255, 114, 0, 1),
                bottom: PreferredSize(
                    child: _opcionesDrawer(),
                    preferredSize: Size.fromHeight(90.0)),
                 actions: <prefix.Widget>[
                  FlatButton(
                    color: Color.fromRGBO(255, 114, 0, 0.9),
                    child: Row(
                      children: <prefix.Widget>[
                        Image.asset('recursos/imagenes/warning.png'),
                      ],
                    ),
                    onPressed: () {
                      EmergenciaAlert(context,emergencia);
                    },
                  )
                ],
                
              ),
            ),
      drawer: drawerItem(),
      body: _itemSelecionado(),
      floatingActionButton: Visibility(
              child: FloatingActionButton(
                backgroundColor:Color.fromRGBO(255, 114, 0, 0.9),
                child: Icon(Icons.add ,),
              onPressed: (){
              _showAddDialogReserva();
              },
              ),
              visible: _item == 18 ? true : false,
            )
     
    ));
  }

  _showAddDialogReserva() async {
    ApiService _apiService=new ApiService();
    showDialog(
  context: context,
  builder: (context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
        title:Center(
         child: FutureBuilder(
           future: _apiService.listarZona(),
           builder: (BuildContext context,AsyncSnapshot <List<dynamic>> snapshot ){
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.data.length != 0){
                  _listaZonas=snapshot.data;
                  return Column(
                    children: [
                      DropdownButtonHideUnderline(
                    child: DropdownButton(
             icon: Icon(Icons.arrow_drop_down, color: Colors.orange),
             value: _zonaSelecionadad,
             onChanged: (String newValue){
                _zonaSelecionadad = newValue;
               setState(() {
               });
             },
               items :snapshot.data.map((snap){
                 return DropdownMenuItem<String>(
                      value: snap['zonaSocial'],
                      child: Text(snap['zonaSocial'], style: TextStyle(color:Colors.grey, fontFamily:'CenturyGothic', fontWeight:FontWeight.bold),) ,
                      );    
               }).toList()
           ),
         ),
         
                    ],
                  );
                }else{
                  return Text('NO HAY ZONAS DISPONIBLES');
                }
              }else{

                if(_listaZonas.length!=0){
                  return Column(
                    children: [
                       DropdownButtonHideUnderline(
                    child: DropdownButton(
             icon: Icon(Icons.arrow_drop_down, color: Colors.orange),
             value: _zonaSelecionadad,
             onChanged: (String newValue){

                _zonaSelecionadad = newValue;
               setState(() {
               });
             },
               items :_listaZonas.map((snapshot){
                 return DropdownMenuItem<String>(
                      
                      value: snapshot['zonaSocial'],
                      child: Text(snapshot['zonaSocial'], style: TextStyle(color:Colors.grey, fontFamily:'CenturyGothic', fontWeight:FontWeight.bold),) ,
                      
                      );
                      
               }).toList()
           ),
         ),
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
                
              }
           } ,
         ),
       ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              
              Row(children: <Widget>[
                Text('Fecha Inicio: ',style: TextStyle(fontFamily: 'CenturyGothic', color:Color.fromRGBO(255, 153, 29, 1.0), fontSize: 18.0,fontWeight: FontWeight.bold )),
                Text(fecha_Selecionada,style: TextStyle(fontFamily: 'CenturyGothic', fontSize: 15.0,fontWeight: FontWeight.bold )),
              ],),
              _calendario( setState),
              Row(children: <Widget>[
               Text('Hora Inicio: ',style: TextStyle(fontFamily: 'CenturyGothic', color:Color.fromRGBO(255, 153, 29, 1.0), fontSize: 18.0,fontWeight: FontWeight.bold )),
                DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down, color: Colors.orange),
             value: _dropdownStrHoraInicio,
             onChanged: (String newValue){
                 _dropdownStrHoraInicio = newValue;
                 _dropdownStrHoraFinal=" ";
                 _colocarHoraDisponibles(setState);
                 setState(() {
                   
                 });
                 
             },
  items: opcionesInicial.map(( value) {
    return new DropdownMenuItem<String>(
      value: value,
      child: new Text(value),
    );
  }).toList(),
)
            ],),

            Row(children: <Widget>[
               Text('Hora Final: ',style: TextStyle(fontFamily: 'CenturyGothic', color:Color.fromRGBO(255, 153, 29, 1.0), fontSize: 18.0,fontWeight: FontWeight.bold )),
                DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down, color: Colors.orange),
             value: _dropdownStrHoraFinal,
             onChanged: (String newValue){
               setState(() {
                 _dropdownStrHoraFinal = newValue;
               });
             },
  items: opcionesFinal.map(( value) {
    return new DropdownMenuItem<String>(
      value: value,
      child: new Text(value),
    );
  }).toList(),
)],),
 Text('OBSERVACIONES',style: TextStyle(fontFamily: 'CenturyGothic', color: Color.fromRGBO(255, 153, 29, 1.0), fontSize: 18.0,fontWeight: FontWeight.bold )),
            _camposFormulario3("", _controllerObservaciones, TextInputType.text),
            Divider(height: 20,),
            _botonGuardar(context,setState)
              
            
            ],
          ),
        ),
      );
      },
    );
  },
);
  }

 
_solicitarDisponibilidadZonas(String id_zona,String fecha,setState){
  if(_estadoDisponibilidadZonas){
      ApiService _apiService=new ApiService();
      _apiService.getDisponibilidadZona(id_zona, fecha).then((value){
        try{
           if(value == "error"){
             opcionesInicial.clear();
             opcionesInicial.add(" ");
             opcionesFinal.clear();
             opcionesFinal.add(" ");
             _dropdownStrHoraInicio=" ";
             _dropdownStrHoraFinal=" ";
             _estadoDisponibilidadZonas=false;
             setState(() {
               
             });
             _alertReservaMensajes(context, "No hay horarios disponibles para esta fecha");
           }else{
            opcionesInicial.clear();
            opcionesInicial.add(" ");
            opcionesFinal.clear();
            opcionesFinal.add(" ");
            _dropdownStrHoraInicio=" ";
             _dropdownStrHoraFinal=" ";
           for(int i=0;i<value.length;i++){
             opcionesInicial.add(value[i]);
          }
          _estadoDisponibilidadZonas=false;
              setState(() {
                
              });
           }
        }catch(e){
          
        }
       
      });
  }
}


Widget _camposFormulario3(String texto,TextEditingController controller,TextInputType type){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 4, 10, 4),
      child:TextField(
              controller: controller,
                autofocus: false,
                keyboardType: type,
                style:
                    new TextStyle(fontSize: 13.0, color: Colors.black,fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                
                  filled: true,
                  fillColor: Color.fromRGBO(233, 233, 233, 1),
                  hintText: texto,

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
_colocarHoraDisponibles(setState){
  
  List  datos = List<String>();

  for(int i=2;i<opcionesInicial.length;i++){
    datos.add(opcionesInicial[i]);
  }
    datos.add(" ");

      opcionesFinal=datos;
      setState(() {
      });
     

}
_botonGuardar(context,setState){

   return GestureDetector(
       onTap: (){ 
         
       }, 
       child: Container(
       child: RaisedButton(
                 shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5),),
          onPressed: () {
              if(_dropdownStrHoraFinal ==" "){
                _alertReservaMensajes(context,"Tiene que elegir una hora final");
                  return;
              }
              for(int e=0;e<_listaZonas.length;e++){
                  dynamic _zona=_listaZonas[e];
                  if(_zona['zonaSocial'] == _zonaSelecionadad){
                      _posicionZona=_zona['id'];
                  }
              }
              DatosReserva datosReserva;
              if(_idreserva  !=" "){
                   datosReserva=DatosReserva(id_subunidad: appData.idSubunidad.toString(),valor: "5000",id_residente: appData.idUsuario.toString(),id_zona_social: _posicionZona.toString(), observaciones: _controllerObservaciones.text,fecha_hora_inicio:fecha_Selecionada+" "+_dropdownStrHoraInicio,fecha_hora_fin:fecha_Selecionada+" "+_dropdownStrHoraFinal,username: appData.cedula.toString(),id_reserva: _idreserva.toString());
              }else{
                 datosReserva=DatosReserva(id_subunidad: appData.idSubunidad.toString(),valor: "5000",id_residente: appData.idUsuario.toString(),id_zona_social: _posicionZona.toString(), observaciones: _controllerObservaciones.text,fecha_hora_inicio:fecha_Selecionada+" "+_dropdownStrHoraInicio,fecha_hora_fin:fecha_Selecionada+" "+_dropdownStrHoraFinal,username: appData.cedula.toString(),id_reserva: " ");
              }
              ApiService apiService=ApiService();
              apiService.guardarReserva(datosReserva).then((isSuccess){
                  if(isSuccess == 'ok'){
                    _alertReservaMensajes(context,"Reserva exitosa");
                    _idreserva=" ";
                    _controllerObservaciones.text=" ";
                    _dropdownStrHoraFinal=" ";
                    _dropdownStrHoraInicio=" ";
                    _selectedDate=" ";
                    fecha_Selecionada=" ";
                    _selecionadoItem( 18, 'RESERVAS');
                   setState(() {
                    });

                   setState(() {
                    });
                   
                  }else{
                    _alertReservaMensajes(context,isSuccess);
                  }
              });
            
          },
          child: const Text(
            'ENVIAR RESERVA',
            style:TextStyle(fontSize: 18.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)
          ),
          )
     ),
   );

 }

  Widget _alertReservaMensajes (BuildContext context,String mensaje){

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

  Widget _calendario( setState){

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
                  borderRadius: BorderRadius.all(Radius.circular(0.8))
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
                            _selectDate(context,setState);
                          },
                        ),
                      ),
                      Builder(
                          builder: (context) =>IconButton(
                          icon: Icon(Icons.calendar_today),
                          tooltip: 'Tap to open date picker',
                          onPressed: () {
                            _selectDate(context,setState);
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

 Future<void> _selectDate(BuildContext context,setState) async {

      
    final b = showDatePicker(
      
      context: context,
     initialDate: DateTime.now(),
  firstDate: DateTime.now().subtract(Duration(days: 1)),
  lastDate: DateTime(2100),
      locale: Locale('es','ES')

 
    );
    
    final DateTime d = await b;
    int mes = int.parse(DateFormat('M').format(now));
    if (d != null)
    if (d.month == mes || d.month == mes+1 || d.month == mes+2){
       
      if(d.month>=10){
      _selectedDate =d.year.toString()+'-'+ d.month.toString()+ '-' + d.day.toString();
      }else{
        fecha_Selecionada =  d.year.toString()+'-0'+ d.month.toString()+ '-'+ d.day.toString();
      }
    }else{
      _alertReservaMensajes(context, 'No se puede elegir a mas de 3 meses');
    }
       appData.fecha_inicial_reserva = fecha_Selecionada;

          fecha_Selecionada=fecha_Selecionada;
          _selectedDate=fecha_Selecionada;
        
        _estadoDisponibilidadZonas=true;
        for(int e=0;e<_listaZonas.length;e++){
                  dynamic _zona=_listaZonas[e];
                  if(_zona['zonaSocial'] == _zonaSelecionadad){
                      _posicionZona=_zona['id'];
                  }
              }
        _solicitarDisponibilidadZonas(_posicionZona.toString(),fecha_Selecionada,setState);
        setState(() {
        });
      
  }
 prefix.Widget listTile(texto, numero){
    final textoDrawer = TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'CenturyGothic');
    return GestureDetector(

          onTap: (){
            _selecionadoItem(numero,texto);
          },
          child: Container(
        height: 20.0,
        child: Text(texto, style:textoDrawer, textAlign: TextAlign.center,),
      ),
    );
  }

prefix.Widget drawerItem(){
   return  Drawer(
          elevation: 5.0,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                //Color.fromRGBO(205, 105, 55,1.0),
                Color.fromRGBO(255, 135, 5, 1.0),
                Color.fromRGBO(255, 114, 0, 1.0),
                Color.fromRGBO(229, 80, 0, 1.0),
              ])),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
         child: ListView(
              children: <prefix.Widget>[
                _cabeceradrawer(funcion),
                
                Container(
                  
                 padding: EdgeInsets.symmetric(horizontal: 20.0),
                 child: Column(
                 children: <prefix.Widget>[
                Divider(color: Colors.black,thickness: 0.7,),
                listTile('PERFIL',11),
                
                Divider(color: Colors.black,thickness: 0.7,),
                listTile('UNIDAD',17),
                
                Divider(color: Colors.black,thickness: 0.7,),    
                listTile('UNIDADES',14),
                
                Divider(color: Colors.black,thickness: 0.7,),    
                listTile('REGISTRAR UNIDADES',7),
                
                Divider(color: Colors.black,thickness: 0.7,),    
              
                listTile('NOTIFICACIONES',8),
                Divider(color: Colors.black,thickness: 0.7,),
                
                listTile('RESERVA', 18),

                Divider(color: Colors.black,thickness: 0.7,),
               listTile('LISTA RESERVAS', 24),

                Divider(color: Colors.black,thickness: 0.7,),
               appData.permisos=='Admini'? Container(): listTile('FACTURA', 5),
               appData.permisos=='Admini'? Container(): Divider(color: Colors.black,thickness: 0.7,),
                 listTile('VISITA', 20),
                 Divider(color: Colors.black,thickness: 0.7,),
                 appData.permisos=='Admini' ? Container():listTile('TAXI', 13),
                 appData.permisos=='Admini' ? Container(): Divider(color: Colors.black,thickness: 0.7,),
                listTile('NOTICIAS', 25),
                Divider(color: Colors.black,thickness: 0.7,),
                 listTile('CHATEAR', 15),
                
                
                
                
                
                Divider(color: Colors.black,thickness: 0.7,),
                listTile('PQR', 6),

                Divider(color: Colors.black,thickness: 0.7,),
                listTile('LINK PAGO', 26),
                
                Divider(color: Colors.black,thickness: 0.7,),
               listTile('EMERGENCIAS', 22),

               
                    Divider(
                      color: Colors.black,
                      thickness: 0.7,
                    ),  
               
        
                   ],
                 ),
               ),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <prefix.Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <prefix.Widget>[
                      FlatButton(
                          child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Image.asset('recursos/imagenes/exit.png')),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onPressed: () {
                            appData.limpiarFoto();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                    maintainState: false));
                          }),
                    ],
                  ),
                  Container(
                    height: 80.0,
                    width: 80.0,
                    child: Image(
                      image: AssetImage('recursos/imagenes/logoApp.png'),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                     EmergenciaAlert(context,emergencia);
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset('recursos/imagenes/warning.png')),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 10.0, top: 5.0, left: 22.0, right: 22.0),
                child: Container(
                  height: 5.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.0)),
                ),
              ),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <prefix.Widget>[
                  Container(
                    height: 40.0,
                    width: 185.0,
                    child: Image(
                      image: AssetImage('recursos/imagenes/LogoEmpresa.png'),
                    ),
                  ),
                  Text(
                    'V.1.0',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),

              ],


            ),
          ),
        );

}
  prefix.Widget _cabeceradrawer(funcion){
  return Container(
       
       padding: EdgeInsets.symmetric(horizontal:10.0),
       child:Column(
       children: <prefix.Widget>[
         Row(
            children: <prefix.Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.transparent,
                child: FlatButton(
                  child: Image.asset('recursos/imagenes/home.png'),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => DrawerAdminItem()));
                  },
                ),
              ),
              Expanded(
                child: Container(),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 40.0,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
         CircleAvatar(
              backgroundColor: Color.fromRGBO(239, 103, 0, 1.0),
              radius: 70.0,
              child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <prefix.Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: appData.fotoPerfil != null
                              ? Image.memory(appData.fotoPerfil).image
                              : AssetImage("recursos/imagenes/profile.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ])),
        SizedBox(
            height: 5.0,
          ),
          Text(appData.nombre ,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CenturyGothic')),
          Text('ADMINISTRADOR', style: TextStyle(color: Colors.white)),
          appData.permisos=='Admini'?Container():DropDownSidebar(data: funcion,),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0, top: 5.0),
            child: Container(
              height: 4.0,
              width: 210.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.0)),
            ),
          )
       ],
     ),
    
    
  );
}

prefix.Widget _botonesRedondeados(context) {
    final noticiasProvider = NoticiasProvider();
    return Column(
      children: <prefix.Widget>[
        Table(
          children: [
            TableRow(children: [
              _crearBotonRedondeado(
                  Color.fromRGBO(255, 153, 29, 1.0),
                  Image.asset('recursos/imagenes/email.png'),
                  'CASILLERO',
                  context,
                  21,
                  EdgeInsets.all(2.0)),
              _crearBotonRedondeado(
                  Color.fromRGBO(255, 153, 29, 1.0),
                  Image.asset('recursos/imagenes/calendar.png'),
                  'RESERVAS',
                  context,
                  18,
                  EdgeInsets.all(8.0)),
              _crearBotonRedondeado(
                  Color.fromRGBO(255, 153, 29, 1.0),
                  Image.asset('recursos/imagenes/qr.png'),
                  'VISITAS',
                  context,
                  20,
                  EdgeInsets.all(2.0)),
            ]),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          width: 280.0,
          height: 5.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color.fromRGBO(255, 114, 0, 1.0)),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          'NOTICIAS',
          style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              fontSize: 25.0,
              fontFamily: 'CenturyGothic'),
        ),
        ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: 35.0,
            maxHeight: 270.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.orange,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            child: Scrollbar(
              child: FutureBuilder(
                future: noticiasProvider.getAllNoticiasAdmin(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Cartelera>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done)
                    return snapshot.data!= null ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: (){

                                    verNoticia(context, snapshot.data[index].titulo, 
                                    snapshot.data[index].descripcion, snapshot.data[index].imagen, 
                                    snapshot.data[index].fechaCreacion, snapshot.data[index].idCartelera
                                    , funcion);

                                  },

                                  child: Card(
                                  color: Colors.grey.shade300,
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <prefix.Widget>[
                                        Text(
                                    snapshot.data[index].fechaCreacion, 
                                    style: TextStyle(
                                        fontFamily: 'CenturyGothic',
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                        Text(snapshot.data[index].titulo,  style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontFamily: 'CenturyGothic',

                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0), ),
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(child:Text("No hay noticias."));
                  else
                    return Center(
                        child: CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.orange),
                    ));
                },
              ),
            ),
          ),
        )
      ],
    );
  }
 prefix.Widget _homeAdmin(){
   return Container(
      child: ListView(children: <prefix.Widget>[
        SizedBox(
          height: 10.0,
        ),
        cardBienvenida(context),
        _botonesRedondeados(context),
      ]),
    );
 }

 
  prefix.Widget cardBienvenida(context) {
    final head = TextStyle(color: Colors.grey.shade700, fontSize: 12.0);

    final head2 = TextStyle(
      color: Colors.grey.shade700,
      fontSize: 13.0,
      fontWeight: FontWeight.bold,
    );

    final titulo = Theme.of(context).textTheme.title;
    final subtitulo = Theme.of(context).textTheme.subhead;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      elevation: 5.0,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.topRight,
                colors: [
              //Color.fromRGBO(205, 105, 55,1.0)

              Color.fromRGBO(224, 97, 0, 1.0),
              Color.fromRGBO(255, 114, 0, 1.0),
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <prefix.Widget>[
            Container(
              child: Column(
                children: <prefix.Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <prefix.Widget>[
                      Text(
                        'SU DEUDA ACTUAL ES :',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'CenturyGothic'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <prefix.Widget>[
                      SizedBox(
                        width: 40.0,
                      ),
                      Icon(
                        Icons.monetization_on,
                        color: Colors.white,
                        size: 55.0,
                      ),
                      Text(appData.saldo!=null?appData.saldo.toString():'0',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 45.0,
                              fontFamily: 'CenturyGothic')),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      width: 400.0,
                      height: 5.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 

 prefix.Widget _crearBotonRedondeado(Color color, Image image, String texto,
      BuildContext context, int posicion, padding) {
    return Column(
      children: <prefix.Widget>[
        Container(
          width: 100.0,
          height: 90.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.orange,
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: GestureDetector(
            child: image,
            onTap: () {
              _selecionadoItem2(posicion, texto);
            },
          ),
        ),
        Center(
          child: Text(texto,
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'CenturyGothic')),
        )
      ],
    );
  }
   _notificaciones(){
    final notificacionesProvider = CasilleroProvider();
    return ListView(

      children: <prefix.Widget>[
        SizedBox(height: 10.0,),
        cabecera(),
       ConstrainedBox(
  constraints: new BoxConstraints(
    maxHeight: 250.0,
    
  ),

  child: Container(
 
    padding:  EdgeInsets.all(10.0),
    child: Scrollbar(
        
       child: FutureBuilder(
                    future: notificacionesProvider.getAllNotificaciones(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<PedidoTaxi>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done)
                        return snapshot.data !=null? ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return cardMensajes(
                                snapshot.data[index].descripcion,
                                snapshot.data[index].fechaCreacion,
                                '',
                                snapshot.data[index].idCasillero.isEven
                                    ? Colors.red.shade100
                                    : Colors.grey.shade300,
                                snapshot.data[index].estado,
                                context,
                                snapshot.data[index].idCasillero);
                               
                          },
                        ): Center(child:Text("Sin notificaciones"));
                      else
                        return Center(
                            child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.orange),
                        ));
                    },
                  ),
    ),
  ),
),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 4.0,width: 280.0, decoration: BoxDecoration( color: Colors.grey.shade500, borderRadius: BorderRadius.circular(5.0)),),
        ),
        SizedBox(height: 5.0,),

        Text('CONTACTAR', style: TextStyle(color: Colors.orange.shade800,fontWeight: FontWeight.bold,fontSize: 18.0, fontFamily: 'CenturyGothic'),textAlign: TextAlign.center,),

        SizedBox(height: 5.0,),
      
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 7.0,width: 200.0 , decoration: BoxDecoration( color: Color.fromRGBO(255, 114, 0, 1.0), borderRadius: BorderRadius.circular(5.0)),),
        ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <prefix.Widget>[
               _containerIconoNotficaciones('recursos/imagenes/personas.png', 'JUNTA DIRECTIVA',00,00),
               SizedBox(width: 10.0,),
               _containerIconoNotficaciones('recursos/imagenes/junta.png', 'VIGILANCIA',00,00),
               SizedBox(width: 10.0,),
               _containerIconoNotficaciones('recursos/imagenes/admin.png','ADMINISTRADOR',19,12),
             ],),
             SizedBox(height:20.0),
             _botonPrincipal(),
             SizedBox(height:10.0),
      ],

    );
  }
   prefix.Widget cardMensajes(
      texto, fecha, hora, color, estado, BuildContext context, id){
      return GestureDetector(
        onTap: (){
          detalleNotificacion(context, texto, null, estado, id, '', '', funcion);
        },
        child: Card(
          color: color,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
            child: Row(
              children: <prefix.Widget>[
                Text(
                  texto,
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <prefix.Widget>[
                      GestureDetector(
                        child: Text(
                          '(LEER)' ,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 114, 0, 1.0),
                              fontFamily: 'CenturyGothic',
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0),
                        ),
                        onTap: () {

                          detalleNotificacion(context, texto, null, estado, id, '', '', funcion);
                         

                         
                        },
                      ),
                      SizedBox(width: 30),
                      Text(
                        fecha,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0),
                      ),
                      Text(
                        hora,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
  cabecera(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <prefix.Widget>[
        Column(
          children: <prefix.Widget>[
            Row(children: <prefix.Widget>[
              Icon(Icons.mail_outline, color: Colors.transparent ),
              SizedBox(width: 5.0,),
              Text('INBOX', style: TextStyle(color: Colors.transparent,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 17.0),),
            ],)
          ],),
        Column(children: <prefix.Widget>[
            Row(children: <prefix.Widget>[
              Icon(Icons.mail_outline, color: Color.fromRGBO(255, 114, 0, 1.0), ),
              SizedBox(width: 5.0,),
              Text('INBOX', style: TextStyle(color: Color.fromRGBO(255, 114, 0, 1.0),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 17.0),),
            ],)
        ],),
        Column(
          children: <prefix.Widget>[
            
              Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Text('ENVIADOS', style: TextStyle(color: Color.fromRGBO(255, 114, 0, 1.0),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 14.0,),textAlign: TextAlign.end,),
            onTap: (){
              _selecionadoItem2(23, "NOTIFICACIONES");
            },
           ),
        ),
          ],
        )
      ],
    );

   

  }
  _containerIconoNotficaciones( iconData, leyenda,int posicion,int drawer){

   return GestureDetector(child: Column(
     children: <prefix.Widget>[
       SizedBox(height: 10.0,),
       Container( 
                  width: 75.0,
                  height: 75.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(255, 114, 0, 1.0), style: BorderStyle.solid, width: 4.0, ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(iconData),
                  padding: EdgeInsets.all(5.0),
                 
                ),
                SizedBox(height:5.0),
                Text(leyenda, style: TextStyle(fontFamily: 'CenturyGothic', fontSize:12.0, fontWeight: FontWeight.bold),),
     ],
   ),
   onTap: (){
     _selecionadoItem2(15, "CHATEAR");
   },
   );

 }

_enviados(){
    final notificacionesProvider = CasilleroProvider();
    return ListView(

      children: <prefix.Widget>[
        SizedBox(height: 10.0,),
         Text('ENVIADOS', style: TextStyle(color: Colors.orange.shade800,fontWeight: FontWeight.bold,fontSize: 18.0, fontFamily: 'CenturyGothic'),textAlign: TextAlign.center,),

        SizedBox(height: 5.0,),
       ConstrainedBox(
  constraints: new BoxConstraints(
    maxHeight: 250.0,
    
  ),

  child: Container(
 
    padding:  EdgeInsets.all(10.0),
    child: Scrollbar(
        
       child: FutureBuilder(
                    future: notificacionesProvider.getAllNotificacionesEnviadas(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<PedidoTaxi>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done)
                        return snapshot.data != null ? ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return cardMensajes(
                                snapshot.data[index].descripcion,
                                snapshot.data[index].fechaCreacion,
                                '',
                                snapshot.data[index].idCasillero.isEven
                                    ? Colors.red.shade100
                                    : Colors.grey.shade300,
                                snapshot.data[index].estado,
                                context,
                                snapshot.data[index].idCasillero);
                               
                          },
                        ): Center(child:Text("No ha respondido ninguna notificación."));
                      else
                        return Center(
                            child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.orange),
                        ));
                    },
                  ),
    ),
  ),
),
      
          
             SizedBox(height:20.0),
             _botonPrincipal(),
             SizedBox(height:10.0),
      ],

    );
 
  }
  

  
 _botonPrincipal() {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      margin: EdgeInsets.symmetric(horizontal: 100.0, vertical: 5.0),
      child: FlatButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => DrawerAdminItem()));
        },
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          padding: EdgeInsets.symmetric(vertical: 7.0),
          child: Center(
            child: Text(
              'PRINCIPAL',
              style: TextStyle(
                  color: Color.fromRGBO(255, 114, 0, 1.0),
                  fontFamily: 'CenturyGothic',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    );
  }

 


  
  _chatAdmin(){
    return SingleChildScrollView(
        child: Stack(
          children: <prefix.Widget>[
            Column(children: <prefix.Widget>[
              Divider(
                height: 30,
                color: Colors.white,
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(25, 5, 5, 5),
                  child:
                    Text("CHAT ADMINISTRADOR",
                        style: TextStyle(
                            fontSize: 23.0,
                            color: Color.fromRGBO(255, 153, 29, 1.0),
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold)),
                
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  height: 10.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color:  Color.fromRGBO(255, 153, 29, 1.0),
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              Divider(
                height: 20,
                color: Colors.white,
              ),
              Container(  
                width: 400,
                height: 400,
  child: StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('useredificio'+appData.idUnidad.toString()).snapshots(),
    builder: (context, snapshot) {

      if (!snapshot.hasData) {
        return Center(
                      child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.orange),
                  ));
      } else {
  
      List<Widget> itemchat =  snapshot.data.documents.map((f) {
        var r = f.data['texto'].replaceRange(0, f.data['texto'].length, '...');
        return _cardMensajes(f.documentID , f.data['nombre'] , (f.data['texto'].length <10)?f.data['texto'] : f.data['texto'].replaceRange(10, f.data['texto'].length, '...'));
}).toList();
        return ListView(
          padding: EdgeInsets.all(10.0),
          children: <prefix.Widget>[
            ...itemchat,
          ],
          );
      }
    },
  ),
),
            ])
          ],
        ),
      );
  }
  prefix.Widget _cardMensajes( _numeroidentificacion,_nombre,_mensaje){
   

  return  GestureDetector(  
         child: Card(
           child: Container(
             height: 50,
             padding: EdgeInsets.symmetric(horizontal:5.0, vertical: 2.0),
             child: Row(
               children: <prefix.Widget>[
                 
                Text(_numeroidentificacion, style: TextStyle(color: Colors.grey.shade700, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),),
                SizedBox(width: 15.0,),
                Text(_nombre, style: TextStyle(color: Colors.grey.shade700, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),),
                SizedBox(width: 15.0,),
                 Text(_mensaje, style: TextStyle(color:Color.fromRGBO(255, 153, 29, 1.0),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 13.0),), 
                Expanded(
                                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <prefix.Widget>[

              
                    ],
                  ),
                )
              ],
             ),
           ),
         ), onTap: (){
           cedularecidente=_numeroidentificacion;
           _selecionadoItem2(16, "CHAT ADMINITRADOR");
         });

}
prefix.Widget pqrGeneradaAlert(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <prefix.Widget>[
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 40.0,
                child: Image.asset('recursos/imagenes/logo.png'),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text('Registro generado con exito'),
            ],
          ),
          actions: <prefix.Widget>[
            FlatButton(
              child: Text(
                'Aceptar',
                style: TextStyle(color: Color.fromRGBO(205, 105, 55, 1.0)),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      });
}
_vistaUnidad() {
    final unidadProvider  = SubUnidadProvider();
    return FutureBuilder(
      future: unidadProvider.getUnidad(),
      builder: (BuildContext context, AsyncSnapshot<Unidad> snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: <prefix.Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(255, 114, 0, 1.0),
                          style: BorderStyle.solid,
                          width: 4.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    snapshot.data.nombre,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 114, 0, 1.0),
                        fontFamily: 'CenturyGothic',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Container(
                      height: 4.0,
                      width: 280.0,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(2.0)),
                    ),
                  ),
           appData.permisos=='AdminiSTRADOR'? Container():       Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Column(children: <prefix.Widget>[
                       _containerUnidad(appData.nombreSubUnidad),
                      SizedBox(
                        height: 5.0,
                      ),
                      _containerUnidad(appData.tipoUnidad),
                      SizedBox(
                        height: 5.0,
                      ),
                      _containerUnidad(snapshot.data.direccion),
                      SizedBox(
                        height: 5.0,
                      ),
                    
                      _containerUnidad(snapshot.data.movil+'-'+snapshot.data.fijo),
                    ]),
                  ),
                 appData.permisos=='Admini'? Container(): Container(
                    height: 6.0,
                    width: 280.0,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 114, 0, 1.0),
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <prefix.Widget>[
                      _containerIcono2(Icons.people, 'JUNTA DIRECTIVA', null),
                      SizedBox(
                        width: 10.0,
                      ),
                      _containerIcono2(Icons.security, 'VIGILANCIA', null),
                      SizedBox(
                        width: 10.0,
                      ),
                      _containerIcono2(Icons.person, 'ADMINISTRADOR', 15),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DrawerAdminItem()));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 80.0, vertical: 20.0),
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
                      )),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          );
        else
          return Center(
              child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
          ));
      },
    );
  }
    _containerIcono2(IconData iconData, leyenda, int posicion) {
    return GestureDetector(
        onTap: () {
          _selecionadoItem2(posicion, "CHATEAR");
        },
        child: Column(
          children: <prefix.Widget>[
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(255, 114, 0, 1.0),
                  style: BorderStyle.solid,
                  width: 4.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(
                iconData,
                size: 65.0,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(width: 5.0),
            Text(
              leyenda,
              style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
  _containerUnidad(texto) {
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: Text(
          texto,
          style: TextStyle(
              color: Colors.grey.shade900,
              fontFamily: 'CenturyGothic',
              fontWeight: FontWeight.bold,
              fontSize: 17.0),
        ),
      ),
      decoration: BoxDecoration(
          color: Color.fromRGBO(252, 71, 0, 0.2),
          borderRadius: BorderRadius.circular(5.0)),
    );
  }

  _vistaperfil(){
   
    return SingleChildScrollView(
      child: Column(
        children: <prefix.Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <prefix.Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <prefix.Widget>[
                    SizedBox(
                      height: 2.0,
                    ),

                    SizedBox(
                      height: 2.0,
                    ),
                    botonEditEliminar('GUARDAR', 0),
                  ],
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: perfilProvider.getPerfilResidente(),   
            builder: (BuildContext context,
                AsyncSnapshot<PerfilResidente> snapshot) {
              print(snapshot);
              if (snapshot.connectionState == ConnectionState.done) {
                appData.estado = snapshot.data.estado;
                appData.cedula = snapshot.data.inputCed;
                nombre.text = snapshot.data.inputName;
                apellido.text = snapshot.data.inputApe;
                email.text = snapshot.data.inputEmail;
                telefono.text = snapshot.data.inputTel;
                direccion.text = snapshot.data.inputDir;
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <prefix.Widget>[
                      Center(
                        child: fotoUsuario(),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      infoText(nombre,'Nombre'),
                      SizedBox(
                        height: 5.0,
                      ),
                      infoText(apellido,'Apellido'),
                      SizedBox(
                        height: 5.0,
                      ),
                      infoText(telefono,'Telefono'),
                      SizedBox(
                        height: 5.0,
                      ),
                      infoText(email, 'Email'),
                      SizedBox(
                        height: 5.0,
                      ),
                      infoText(direccion,'Direccion'),
                      SizedBox(
                        height: 10.0,
                      ),

                      Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 7.0,width: 310.0 , decoration: BoxDecoration( color: Color.fromRGBO(255, 114, 0, 1.0), borderRadius: BorderRadius.circular(5.0)),),
        ),
           Row(
             mainAxisAlignment:appData.permisos=='Admini'? MainAxisAlignment.center:  MainAxisAlignment.spaceEvenly,
             
             children: <prefix.Widget>[
              appData.permisos=='Admini'? Container(): _containerIcono('recursos/imagenes/trespersonasicon.jpg', 'UNIDADES',17),
               appData.permisos=='Admini'? Container(): SizedBox(width: 10.0,),
               _containerIcono('recursos/imagenes/facturaicon.png', 'FACTURAS',5),
               SizedBox(width: 10.0,),
               _containerIcono('recursos/imagenes/iconreserva.png','RESERVAS',18,)
                
             ],),
             
             Padding(
          padding: const EdgeInsets.symmetric(horizontal:30.0,vertical: 10.0),
          child: Container(height: 7.0,width: 320.0 , decoration: BoxDecoration( color: Color.fromRGBO(255, 114, 0, 1.0), borderRadius: BorderRadius.circular(5.0)),),
        ),
             SizedBox(height:10.0),
            
             
                      botonPrincipal(context)
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.orange),
                  )),
                );
              }
            },
          ),
        ],
      ),
    );
  }
   botonPrincipal(context){
   return GestureDetector(
       onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DrawerAdminItem() ));
       }, 
       child: Container(
       margin: EdgeInsets.symmetric(horizontal: 80.0 ),
       padding: EdgeInsets.symmetric(vertical: 7.0),
       child: Center(child: Text('PRINCIPAL', style: TextStyle(color:Color.fromRGBO(255, 153, 29, 1.0), fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 20.0),),),
       decoration: BoxDecoration(  borderRadius: BorderRadius.circular(5.0)),
     ),
   );

 }
   prefix.Widget _fotoUsuario() {
    return Container(
      width: 150,
      height: 150,
      child: CircleAvatar(
        backgroundColor: Color.fromRGBO(255, 114, 0, 0.2),
        foregroundColor: Color.fromRGBO(255, 114, 0, 1.0),
        child: CircleAvatar(
            radius: 68.0,
            backgroundColor: Color.fromRGBO(255, 114, 0, 1.0),
            child: Stack(
                alignment: AlignmentDirectional.center,
                children: <prefix.Widget>[
                  Container(
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage(
                                  "recursos/imagenes/profile.png")))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <prefix.Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.add_photo_alternate,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ])),
      ),
    );
  }
  containerIcono(IconData iconData, leyenda) {
    return Column(
      children: <prefix.Widget>[
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(255, 114, 0, 1.0),
              style: BorderStyle.solid,
              width: 4.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(
            iconData,
            size: 95.0,
            color: Colors.grey.shade800,
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          leyenda,
          style: TextStyle(
              fontFamily: 'CenturyGothic',
              fontSize: 15.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
  botonEditEliminar(texto, n) {
    pr = new ProgressDialog(context);
    pr.style(
        message: 'Guardando cambios...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w600));

    pr = new ProgressDialog(context);

    return GestureDetector(
        onTap: () {
          if (n == 1) {
          } else {
            if (nombre.text.isEmpty ||
                apellido.text.isEmpty ||
                telefono.text.isEmpty ||
                email.text.isEmpty ||
                direccion.text.isEmpty) {
              ValidacionLoginAlert(context);
            } else {
              pr.show();
              perfilProvider
                  .editarPerfilResidente(nombre.text, apellido.text,
                      direccion.text, telefono.text, email.text) 
                  .then((value) {
                pr.dismiss();
                EdicionCompleta(context);
              });
            }
          }
        },
        child: Text(
          texto,
          style: TextStyle(
              color: Color.fromRGBO(255, 114, 0, 1.0),
              fontFamily: 'CenturyGothic',
              fontWeight: FontWeight.bold,
              fontSize: 17.0),
          textAlign: TextAlign.right,
        ));
  }
   prefix.Widget infoText(controller,nombre) {
    return Container(
      color: color,
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: TextField(
        
          textAlign: TextAlign.center,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '',
          ),
          style: TextStyle(
            color: Colors.grey.shade700,
            fontFamily: 'CenturyGothic',
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            
          ),
        ),
      ),
    );
  }

  _containerIcono( iconData, leyenda,posicion){

   return GestureDetector(child: Column(
     children: <prefix.Widget>[
       SizedBox(height: 10.0,),
       Container( 
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(255, 114, 0, 1.0), style: BorderStyle.solid, width: 4.0, ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(iconData),
                  padding: EdgeInsets.all(5.0),
                 
                ),
                SizedBox(height:5.0),
                Text(leyenda, style: TextStyle(fontFamily: 'CenturyGothic', fontSize:16.0, fontWeight: FontWeight.bold),),
     ],
   ),
   onTap: (){
     _selecionadoItem2(posicion, leyenda);
   },
   );

 }

 _vistasubunidades(){
   return SingleChildScrollView(
      child: Column(
      children: <prefix.Widget>[
        Text('UNIDADES RESIDENCIALES',style: TextStyle(color: Colors.black,fontSize: 25.0,fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold ),),
        _listaSubunidad(),
        //_formularioActualizar(),
        SizedBox(height:30.0,),
          Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 7.0,width: 310.0 , decoration: BoxDecoration( color: Color.fromRGBO(255, 114, 0, 1.0), borderRadius: BorderRadius.circular(5.0)),),
        ),
           Row(
             mainAxisAlignment:appData.permisos=='Admini'? MainAxisAlignment.center:  MainAxisAlignment.spaceEvenly,
             
             children: <prefix.Widget>[
              appData.permisos=='Admini'? Container():  _containerIcono('recursos/imagenes/trespersonasicon.jpg', 'UNIDADES',17),
              appData.permisos=='Admini'? Container():  SizedBox(width: 10.0,),
               _containerIcono('recursos/imagenes/facturaicon.png', 'FACTURAS',5),
               SizedBox(width: 10.0,),
               _containerIcono('recursos/imagenes/iconreserva.png','RESERVAS',18),
                
             ],),
             
             Padding(
          padding: const EdgeInsets.symmetric(horizontal:30.0,vertical: 10.0),
          child: Container(height: 7.0,width: 320.0 , decoration: BoxDecoration( color: Color.fromRGBO(255, 114, 0, 1.0), borderRadius: BorderRadius.circular(5.0)),),
        ),
        botonPrincipal(context)
      ],
    ),
    );
 }
 _listaSubunidad(){
    final _listarVisita=new ListaSubUnidadProvider();
    if (_estadolistasubunidad){
       return FutureBuilder(future: _listarVisita.getlistasubunidades(),
        builder: (BuildContext context,
                AsyncSnapshot<List<DatosListaSubunidades>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) { 
                      _estadolistasubunidad=false;
                      _datoslistaSubUnidad=snapshot;
                      return     ConstrainedBox(
  constraints: new BoxConstraints(
    maxHeight: 270.0,
    
  ),

  child: 
      Container(
 
    padding:  EdgeInsets.all(10.0),
    child: Scrollbar(
        
        child: new ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return  _cardMensajesListaSubunidad(snapshot.data[index].propietario.toString(),snapshot.data[index].residente.toString(),snapshot.data[index].tipoUnidad,snapshot.data[index].estadoCuenta,snapshot.data[index].nomenclatura,snapshot.data[index].estadoUnidad,snapshot.data[index].id.toString(),snapshot.data[index].total.toString(),index % 2 == 0 ? Color.fromRGBO(254, 215, 185, 1) :Color.fromRGBO(217, 218, 229  , 1) );
            
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
    maxHeight: 270.0,
    
  ),

  child: 
      Container(
 
    padding:  EdgeInsets.all(10.0),
    child: Scrollbar(
        
        child: new ListView.builder(
          itemCount: _datoslistaSubUnidad.data.length,
          itemBuilder: (context, index) {
            return  _cardMensajesListaSubunidad(_datoslistaSubUnidad.data[index].propietario.toString(),_datoslistaSubUnidad.data[index].residente.toString(),_datoslistaSubUnidad.data[index].tipoUnidad,_datoslistaSubUnidad.data[index].estadoCuenta,_datoslistaSubUnidad.data[index].nomenclatura,_datoslistaSubUnidad.data[index].estadoUnidad,_datoslistaSubUnidad.data[index].id.toString(),_datoslistaSubUnidad.data[index].total.toString(),index % 2 == 0 ? Color.fromRGBO(254, 215, 185, 1) :Color.fromRGBO(217, 218, 229  , 1)  );
            
  },
        ),
        
    ),
  ),
  
  
);
    }
  }

  prefix.Widget _cardMensajesListaSubunidad(String propietario ,String residente,String tipounida,String estadocuenta,String nomenclatura,String estadoUnidad,String id,String total,color){
    
  return  GestureDetector(  
         child: Card(
           color: color,
           child: Container(
             padding: EdgeInsets.symmetric(horizontal:5.0, vertical: 2.0),
             margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 0.0),
             child: Row(
               children: <prefix.Widget>[
                Text(propietario.length >10 ?propietario.substring(0,10)+"...":propietario, style: TextStyle(color: Colors.black, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 13.0),),
                SizedBox(width: 15.0,),
                 Text(tipounida, style: TextStyle(color:Colors.black,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),), 
                Expanded(
                                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <prefix.Widget>[

                     Text('VER MAS', style: TextStyle(color: Color.fromRGBO(240, 75, 14 , 1),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),),

                    ],
                  ),
                )
              ],
             ),
           ),
         ), onTap: (){
                 /*  _controllerPropietario.text=propietario;
                   _controllerNombrenclatura.text=nomenclatura;
                   _controllerResidente.text=residente;
                   _tipoUnidad=tipounida;
                   _tipoEstado=estadoUnidad;
                   _controllerEstadoCuenta.text=estadocuenta;
                   _controllerTotal.text=total;
                   _estadoButton=true;
                   _idactualizar=id;
                   setState(() {
                     
                   });*/
                  },
                  );

}
}



class fotoUsuario extends StatefulWidget {
  fotoUsuario({Key key}) : super(key: key);

  @override
  _fotoUsuarioState createState() => _fotoUsuarioState();
}

class _fotoUsuarioState extends State<fotoUsuario> {
  File _image;

  
  var imagenMostrada = appData.fotoPerfil!=null?Image.memory(appData.fotoPerfil).image:AssetImage(
                                      "recursos/imagenes/profile.png");

  Future getImageFromCam() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera, maxHeight: 250.0, maxWidth:250.0);
   
    setState(() {
      _image = image;
      List<int> imageBytes = image.readAsBytesSync();
      print(imageBytes);
      String base64Image = base64.encode(imageBytes);
      appData.encodedFotoPerfil = base64Image;
      imagenMostrada = Image.file(_image).image; 
      
        
      
     
    });
  }

  Future getImageFromGallery() async {  
    var image = await ImagePicker.pickImage(source: ImageSource.gallery, maxHeight: 250.0, maxWidth:250.0);
    setState(() {
      _image = image;
      List<int> imageBytes = image.readAsBytesSync();
      print(imageBytes);
      String base64Image = base64.encode(imageBytes);
      appData.encodedFotoPerfil = base64Image; 
      imagenMostrada = Image.file(_image).image;
      print(base64Image); 
    });
  }

  bool _isVisible = true;
  

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  prefix.Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: CircleAvatar(
        backgroundColor: Color.fromRGBO(255, 114, 0, 0.2),
        foregroundColor: Color.fromRGBO(255, 114, 0, 1.0),
        child: CircleAvatar(
            radius: 68.0,
            backgroundColor: Color.fromRGBO(255, 114, 0, 1.0),
            child: Stack(
                alignment: AlignmentDirectional.center,
                children: <prefix.Widget>[
Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage( 
                              image: imagenMostrada,
                              fit: BoxFit.fill,
                            ), 
                          ),
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <prefix.Widget>[
                      IconButton(
                        onPressed: () {
                          getImageFromCam();
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          getImageFromGallery();
                        },
                        icon: Icon(
                          Icons.add_photo_alternate,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ])),
      ),
    );
  }
}