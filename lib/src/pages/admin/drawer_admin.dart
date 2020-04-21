import 'package:edificion247/src/bloc/provider_perfil_admin.dart';
import 'package:edificion247/src/bloc/provider_unidad.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/listasubunidad.dart';
import 'package:edificion247/src/models/perfilResidente.dart';
import 'package:edificion247/src/models/unidadmodel.dart';
import 'package:edificion247/src/models/noticia.dart';
import 'package:edificion247/src/models/pedidoTaxi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edificion247/src/pages/admin/ad_chatAdministrador.dart';
import 'package:edificion247/src/pages/admin/buzon_admin.dart';
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
import 'package:edificion247/src/widgets/dropdown_widget.dart';
import 'package:edificion247/src/widgets/noticiasAlert.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'dart:convert';
import 'dart:io';
import '../residente/misreservas.dart';
import '../residente/pqr.dart';

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
        case 18:return MyHomePage();
        case 19:return PqrPages();
        case 20:return VisitaPages();
        case 21:return MiCasillero();
                

      }
    
    }

    fincion(){
    
    setState(() {
                         _item = 16;
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
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
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
                          children: <Widget>[
                            Text(
                              'MI UNIDAD',
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
                  GestureDetector(
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
                          children: <Widget>[
                            Text(
                              'FACTURACION',
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
                          children: <Widget>[
                            Text(
                              'PQR SOPORTE',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  fontFamily: 'CenturyGothic'),
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
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
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
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
            _selecionadoItemAnterior(_posicion_appbar_anterior, _nombre_appbar_anterior),
      child:Scaffold(
      appBar: PreferredSize(
              preferredSize: Size.fromHeight(90.0),
              child: AppBar(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                        child: Text(appData.nombre + ' ' + appData.apellido,
                            style: TextStyle(fontFamily: 'CenturyGothic'),
                            textAlign: TextAlign.left)),
                   // DropdownWidget(),
                  ],
                ),
                backgroundColor: Color.fromRGBO(255, 114, 0, 1),
                bottom: PreferredSize(
                    child: _opcionesDrawer(),
                    preferredSize: Size.fromHeight(90.0))
                
              ),
            ),
      drawer: drawerItem(),
      body: _itemSelecionado(),
     
    ));
  }
 Widget listTile(texto, numero){
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

Widget drawerItem(){
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
              children: <Widget>[
                _cabeceradrawer(),
                
                Container(
                  
                 padding: EdgeInsets.symmetric(horizontal: 20.0),
                 child: Column(
                 children: <Widget>[
                Divider(color: Colors.black,thickness: 0.7,),
                listTile('PERFIL',11),
                
                Divider(color: Colors.black,thickness: 0.7,),
                listTile('UNIDAD',17),
                
                Divider(color: Colors.black,thickness: 0.7,),    
                listTile('UNIDADES',14),
                
                Divider(color: Colors.black,thickness: 0.7,),    
                listTile('REGISTRAR UNIDADES',7),
                
                Divider(color: Colors.black,thickness: 0.7,),    
              /*  ExpansionTile(
                  

                  title: Text('UNIDAD',style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'CenturyGothic'),textAlign: TextAlign.center),
                  children: <Widget>[
                    InkWell(
                    child: Text("DATOS BASICOS",style: TextStyle(fontSize: 15,color: Colors.black), textAlign: TextAlign.right,),
                    onTap: () {

                        _selecionadoItem(17,'DATOS BASICOS');
                      
                      },
                    ), 
                    Divider(),
                    InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("REGISTRAR SUB UNIDADES",style: TextStyle(fontSize: 15,color: Colors.black),),
                    ),
                    onTap: () {

                     _selecionadoItem(7,'REGISTRAR SUB UNIDADES');

                    },
                    ), 
                    InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("LISTA DE SUB UNIDADES",style: TextStyle(fontSize: 15,color: Colors.black),),
                    ),
                    onTap: () {

                     _selecionadoItem(14,'LISTA DE SUB UNIDADES');

                    },
                    ), 

                    Divider(),
                    InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("RESIDENTES",style: TextStyle(fontSize: 15,color: Colors.black),),
                    ),
                    onTap: () {

                     _selecionadoItem(2,'RESIDENTES');

                    },
                    ), 

                    Divider(),
                    InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("BUZON UNIDAD",style: TextStyle(fontSize: 15,color: Colors.black),),
                    ),
                    onTap: () {
                     _selecionadoItem(8,'BUZON UNIDAD');

                    },
                    ), 

                     Divider(),
                    InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("ZONAS SOCIALES",style: TextStyle(fontSize: 15,color: Colors.black),),
                    ),
                    onTap: () {
                      _selecionadoItem(9,'ZONAS SOCIALES');
                    },
                    ), 

                     Divider(),
                    InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("PNAL. ASISTENCIAL Y ADMINISTRATIVO",style: TextStyle(fontSize: 15,color: Colors.black),textAlign: TextAlign.center,),
                    ),
                    onTap: () {},
                    ), 

                     Divider(),
                    ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("PQR UNIDAD",style: TextStyle(fontSize: 15,color: Colors.black),textAlign: TextAlign.center,),
                    ),
                    onTap: () {
                        _selecionadoItem(6,'PQR unidad');
                    },
                    ), 

                     Divider(),
                    InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("CONTACTAR JUNTA DIRECTIVA",style: TextStyle(fontSize: 15,color: Colors.black),textAlign: TextAlign.center,),
                    ),
                    onTap: () {
                     _selecionadoItem(12,'CONTACTAR JUNTA DIRECTIVA');
                    },
                    ), 
                    ],
                  ),
                  Divider(color: Colors.black,thickness: 0.7,),
                  */
                listTile('NOTIFICACIONES',8),
                Divider(color: Colors.black,thickness: 0.7,),
                
                listTile('RESERVA', 18),
                Divider(color: Colors.black,thickness: 0.7,),
                listTile('FACTURA', 5),
                Divider(color: Colors.black,thickness: 0.7,),
                 listTile('VISITA', 20),
                 Divider(color: Colors.black,thickness: 0.7,),
                listTile('TAXI', 13),
                Divider(color: Colors.black,thickness: 0.7,),
                 listTile('CHATEAR', 15),
                
                
                
                
                
                Divider(color: Colors.black,thickness: 0.7,),
                listTile('PQR', 19),
                
                Divider(color: Colors.black,thickness: 0.7,),
               
               
        
                   ],
                 ),
               ),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                          child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Image.asset('recursos/imagenes/exit.png')),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onPressed: () {
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
                     EmergenciaAlert(context);
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
                children: <Widget>[
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
  Widget _cabeceradrawer(){
  return Container(
       
       padding: EdgeInsets.symmetric(horizontal:10.0),
       child:Column(
       children: <Widget>[
         Row(
            children: <Widget>[
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
                  children: <Widget>[
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
          Text(appData.nombre + ' ' + appData.apellido,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CenturyGothic')),
          Text('ADMINISTRADOR', style: TextStyle(color: Colors.white)),
          //DropDownSidebar(),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0, top: 5.0),
            child: Container(
              height: 4.0,
              width: 210.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.0)),
            ),
          ),DropdownWidget()
       ],
     ),
    
    
  );
}

Widget _botonesRedondeados(context) {
    final noticiasProvider = NoticiasProvider();
    return Column(
      children: <Widget>[
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
                future: noticiasProvider.getAllNoticias(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Noticia>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done)
                    return snapshot.data.length > 0
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: (){

                                    noticiaAlert(context, snapshot.data[index].descripcion,
                                    snapshot.data[index].titulo, snapshot.data[index].fechaCreacion);

                                  },

                                  child: Card(
                                  color: Colors.grey.shade300,
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
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
                        : Container();
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
 Widget _homeAdmin(){
   return Container(
      child: ListView(children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        cardBienvenida(context),
        _botonesRedondeados(context),
      ]),
    );
 }

 
  Widget cardBienvenida(context) {
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
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
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
                    children: <Widget>[
                      SizedBox(
                        width: 40.0,
                      ),
                      Icon(
                        Icons.monetization_on,
                        color: Colors.white,
                        size: 55.0,
                      ),
                      Text(' 123.000',
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

 

 Widget _crearBotonRedondeado(Color color, Image image, String texto,
      BuildContext context, int posicion, padding) {
    return Column(
      children: <Widget>[
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

      children: <Widget>[
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
                        return ListView.builder(
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
                        );
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
             children: <Widget>[
               _containerIconoNotficaciones('recursos/imagenes/personas.png', 'JUNTA DIRECTIVA',00,00),
               SizedBox(width: 10.0,),
               _containerIconoNotficaciones('recursos/imagenes/junta.png', 'VIGILANCIA',00,00),
               SizedBox(width: 10.0,),
               _containerIconoNotficaciones('recursos/imagenes/admin.png','ADMINISTRADOR',19,12),
             ],),
             SizedBox(height:20.0),
             //_botonPrincipal(),
             SizedBox(height:10.0),
      ],

    );
  }
   Widget cardMensajes(
      texto, fecha, hora, color, estado, BuildContext context, id){
      return GestureDetector(
        
        child: Card(
          color: color,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
            child: Row(
              children: <Widget>[
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
                    children: <Widget>[
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

                          noticiaAlert(context, texto,
                                    'DETALLES', fecha);
                         

                         
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
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(children: <Widget>[
              Icon(Icons.mail_outline, color: Colors.transparent ),
              SizedBox(width: 5.0,),
              Text('INBOX', style: TextStyle(color: Colors.transparent,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 17.0),),
            ],)
          ],),
        Column(children: <Widget>[
            Row(children: <Widget>[
              Icon(Icons.mail_outline, color: Color.fromRGBO(255, 114, 0, 1.0), ),
              SizedBox(width: 5.0,),
              Text('INBOX', style: TextStyle(color: Color.fromRGBO(255, 114, 0, 1.0),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 17.0),),
            ],)
        ],),
        Column(
          children: <Widget>[
            
              Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Text('ENVIADOS', style: TextStyle(color: Color.fromRGBO(255, 114, 0, 1.0),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 14.0,),textAlign: TextAlign.end,),
            onTap: (){
              _selecionadoItem2(15, "CHATEAR");
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
     children: <Widget>[
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

  _chatAdmin(){
    return SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(children: <Widget>[
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
    stream: Firestore.instance.collection('userChatAdmin').snapshots(),
    builder: (context, snapshot) {

      if (!snapshot.hasData) {
        return Center(
                      child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.orange),
                  ));
      } else {
      List<Widget> itemchat =  snapshot.data.documents.map((f) {
        return _cardMensajes(f.documentID , f.data['nombre'] , f.data['texto']);
}).toList();
        return ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
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
  Widget _cardMensajes( _numeroidentificacion,_nombre,_mensaje){
   

  return  GestureDetector(  
         child: Card(
           child: Container(
             height: 50,
             padding: EdgeInsets.symmetric(horizontal:5.0, vertical: 2.0),
             child: Row(
               children: <Widget>[
                 
                Text(_numeroidentificacion, style: TextStyle(color: Colors.grey.shade700, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),),
                SizedBox(width: 15.0,),
                Text(_nombre, style: TextStyle(color: Colors.grey.shade700, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),),
                SizedBox(width: 15.0,),
                 Text(_mensaje, style: TextStyle(color:Color.fromRGBO(255, 153, 29, 1.0),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),), 
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
           cedularecidente=_numeroidentificacion;
           _selecionadoItem2(16, "CHAT ADMINITRADOR");
         });

}
Widget EmergenciaAlert(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(
                  color: Colors.orange,
                  width: 4,
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
              child: Column(children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('ESCOJA EL TIPO DE EMERGENCIA',
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0)),
                  ],
                ),

                DropdownWidgetEmergencia(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Container(
                    height: 3.0,
                    width: 240.0,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    pqrGeneradaAlert(context);
                    
                 
                  },
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Center(
                      child: Text(
                        'ENVIAR',
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.orangeAccent.shade100,
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                )
              ]),
            ),
          ),
        );
      });
}

Widget pqrGeneradaAlert(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
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
          actions: <Widget>[
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
                children: <Widget>[
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
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Column(children: <Widget>[
                      _containerUnidad('RESIDENCIAL'),
                      SizedBox(
                        height: 5.0,
                      ),
                      _containerUnidad(snapshot.data.direccion),
                      SizedBox(
                        height: 5.0,
                      ),
                    /* _containerUnidad('BARRANQUILLA'),
                      SizedBox(
                        height: 5.0,
                      ),*/
                      _containerUnidad(snapshot.data.movil+'-'+snapshot.data.fijo),
                    ]),
                  ),
                  Container(
                    height: 6.0,
                    width: 280.0,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 114, 0, 1.0),
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
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
          children: <Widget>[
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
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 2.0,
                    ),
                    botonEditEliminar('EDITAR', 1),
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
                    children: <Widget>[
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
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             
             children: <Widget>[
               _containerIcono('recursos/imagenes/trespersonasicon.jpg', 'UNIDADES',17),
               SizedBox(width: 10.0,),
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
   Widget _fotoUsuario() {
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
                children: <Widget>[
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
                    children: <Widget>[
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
      children: <Widget>[
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
   Widget infoText(controller,nombre) {
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
     children: <Widget>[
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
      children: <Widget>[
        Text('UNIDADES RESIDENCIALES',style: TextStyle(color: Colors.black,fontSize: 25.0,fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold ),),
        _listaSubunidad(),
        //_formularioActualizar(),
        SizedBox(height:30.0,),
          Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 7.0,width: 310.0 , decoration: BoxDecoration( color: Color.fromRGBO(255, 114, 0, 1.0), borderRadius: BorderRadius.circular(5.0)),),
        ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             
             children: <Widget>[
               _containerIcono('recursos/imagenes/trespersonasicon.jpg', 'UNIDADES',17),
               SizedBox(width: 10.0,),
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

  Widget _cardMensajesListaSubunidad(String propietario ,String residente,String tipounida,String estadocuenta,String nomenclatura,String estadoUnidad,String id,String total,color){
    
  return  GestureDetector(  
         child: Card(
           color: color,
           child: Container(
             padding: EdgeInsets.symmetric(horizontal:5.0, vertical: 2.0),
             margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 0.0),
             child: Row(
               children: <Widget>[
                Text(propietario.length >10 ?propietario.substring(0,10)+"...":propietario, style: TextStyle(color: Colors.black, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 13.0),),
                SizedBox(width: 15.0,),
                 Text(tipounida, style: TextStyle(color:Colors.black,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),), 
                Expanded(
                                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

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
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
   
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
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
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
  Widget build(BuildContext context) {
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
                children: <Widget>[
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
                    children: <Widget>[
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