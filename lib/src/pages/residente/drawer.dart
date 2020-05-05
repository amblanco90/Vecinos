import 'package:edificion247/src/bloc/perfil_bloc.dart';
import 'package:edificion247/src/bloc/provider_perfil.dart';
import 'package:edificion247/src/bloc/provider_unidad.dart';
import 'package:edificion247/src/bloc/provider_visitas.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/noticia.dart';
import 'package:edificion247/src/models/pedidoTaxi.dart';
import 'package:edificion247/src/models/perfilResidente.dart';
import 'package:edificion247/src/models/unidadmodel.dart';
import 'package:edificion247/src/pages/login/Login.dart';
import 'package:edificion247/src/pages/residente/TaxiPage.dart';
import 'package:edificion247/src/pages/residente/chat.dart';
import 'package:edificion247/src/pages/residente/emergenciasPage.dart';
import 'package:edificion247/src/pages/residente/home_pages.dart';
import 'package:edificion247/src/pages/residente/junta-directiva.dart';
import 'package:edificion247/src/pages/residente/mibuzon.dart';
import 'package:edificion247/src/pages/residente/micasillero.dart';
import 'package:edificion247/src/pages/residente/mifamilia.dart';
import 'package:edificion247/src/pages/residente/miperfil.dart';
import 'package:edificion247/src/pages/residente/misfacturas.dart';
import 'package:edificion247/src/pages/residente/misreservas.dart';
import 'package:edificion247/src/pages/residente/misvisitas.dart';
import 'package:edificion247/src/pages/residente/re_chatadministrador.dart';
import 'package:edificion247/src/pages/residente/vigilante.dart';
import 'package:edificion247/src/pages/residente/miunidad.dart';
import 'package:edificion247/src/pages/residente/pqr.dart';
import 'package:edificion247/src/providers/casilleroProvider.dart';
import 'package:edificion247/src/providers/noticiasProvider.dart';
import 'package:edificion247/src/providers/perfilProvider.dart';
import 'package:edificion247/src/providers/push_notification_provider.dart';
import 'package:edificion247/src/providers/subunidadProvider.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:edificion247/src/widgets/dropdown_widget.dart';
import 'package:edificion247/src/widgets/noticiasAlert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'conyuque.dart';
import 'hijos.dart';
import 'otros.dart';

class DrawerItem extends StatefulWidget {
  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  String nombre_appbar = 'Home';
  int _posicionAnterior;
  String _nombreAnterion;
  int _draweanterior;
  final nombre = TextEditingController();
  final apellido = TextEditingController();
  final telefono = TextEditingController();
  final email = TextEditingController();
  final direccion = TextEditingController();
  final perfilProvider = PerfilProvider();
  var color = Colors.transparent;
  ProgressDialog pr;
  int i = 0;

  @override
  void initState() { 
    super.initState();
    final pushProvider = PushNotificationProvider();
    pushProvider.initNotifications(fincion,context);
  }

  funcion(){
    setState(() {
      
    });
  }

  fincion(){
    setState(() {
                        _item = 12;
                        nombre_appbar = 'Home';
                      });
  }

  _opcionesDrawer() {
    switch (i) {
      case 0:
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
                        _item = 11;
                        nombre_appbar = 'Home';
                      });
                    },
                    child: SizedBox(
                      width: 110,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _item = 11;
                            nombre_appbar = 'Home';
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'PRINCIPAL',
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
                        _item = 0;
                        nombre_appbar = 'Home';
                      });
                    },
                    child: SizedBox(
                      width: 140.0,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _item = 0;
                            nombre_appbar = 'Home';
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
                        _item = 10;
                        nombre_appbar = 'Home';
                      });
                    },
                    child: SizedBox(
                      width: 110.0,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _item = 10;
                            nombre_appbar = 'Home';
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'SOPORTE',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
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
      case 1:
        return Row(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'VISITAS',
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
      case 2:
        return Row(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'NOTIFICACIONES',
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
                      width: 150.0,
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
      case 3:
        return Row(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'FACTURAS',
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
      case 4:
        return Row(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'TAXI',
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
      case 5:
        return Row(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'PQR',
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
      case 6:
        return Row(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'PERFIL',
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
      case 7:
        return Row(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'RESERVAS',
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
      case 8:
        return Row(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'UNIDAD',
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
      case 9:
        return Row(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'FAMILIA',
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
      case 10:
        return Row(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'JUNTA DIRECTIVA',
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
      case 11:
        return Row(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'VIGILANCIA',
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
      case 12:
        return Row(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'ADMINISTRACION',
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
        case 13:
        return Row(
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'CHAT',
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

  int _item = 11;
  _itemSelecionado() {
    switch (_item) {
      case 0:
        return MisFacturas();
      case 1:
        return MyHomePage();
      case 2:
        return ProviderVisitas(
          child: VisitaPages(),
        );
      case 3:
        return _contactos();
      case 4:
        return MiBuzonPages();
      case 5:
        return _vistaUnidad();
      case 6:
        return _vistaPerfil();
      case 7:
        return MiCasillero();
      case 8:
        return VisitaPages();
      case 9:
        return MisFacturas();
      case 10:
        return PqrPages();
      case 11:
        return FC();
      case 12:
        return _notificaciones();
      case 13:
        return TaxiPage();
      case 14:
        return _familia();
      case 15:
        return ConyuguePage();
      case 16:
        return HijoPage();
      case 17:
        return OtrosPage();
      case 18:
        return ChatVigilanciaPage();
      case 19:
        return ChatAdministradorPages();
      case 20:
        return ChatJuntaDirectivaPage();
      case 21:  return _chatResidente();
      case 22: 
       return EmergenciasPage();
    }
  }

  emergencia(){

    setState(() {
      _item = 22;
      nombre_appbar = 'EMERGENCIAS';
    });

  }

   


  _selecionadoItem(int posicion, String nombre) {
    _posicionAnterior = _item;
    _nombreAnterion = nombre_appbar;
    Navigator.of(context).pop();
    setState(() {
      _item = posicion;
      nombre_appbar = nombre;
    });
  }

  _selecionadoItem2(int posicion, String nombre) {
    if(posicion != null){
      _posicionAnterior = _item;
    _nombreAnterion = nombre;
    setState(() {
      _item = posicion;
      nombre_appbar = nombre;
    });
    }
  }

  _selecionadoItemAnterior(int posicion, String _nombre, int draweranerior) {
    if (draweranerior == null) {
      draweranerior = 0;
    }

    if (posicion == null) {
      posicion = 11;
    }
    setState(() {
      _item = posicion;
      nombre_appbar = _nombre;
      i = draweranerior;
    });
  }

  selecionadoItem3(int posicion, String nombre) {
    _posicionAnterior = _item;
    _nombreAnterion = nombre;
    setState(() {
      _item = posicion;
      nombre_appbar = nombre;
    });
  }

  selecionadoItem4(int posicion) {
    if(posicion!=null){
      _draweanterior = i;
    setState(() {
      i = posicion;
    });
    }
  }

  

  @override
  Widget build(BuildContext context) {



    return WillPopScope(
        onWillPop: () async => _selecionadoItemAnterior(
            _posicionAnterior, _nombreAnterion, _draweanterior),
        child: Scaffold(
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
                    preferredSize: Size.fromHeight(90.0)),
                actions: <Widget>[
                  FlatButton(
                    color: Color.fromRGBO(255, 114, 0, 0.9),
                    child: Row(
                      children: <Widget>[
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
            body: _itemSelecionado()));
  }

  Widget listTile(texto, numero, drawer) {
    final textoDrawer = TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'CenturyGothic');
    return GestureDetector(
      onTap: () {
        _selecionadoItem(numero, texto);
        selecionadoItem4(drawer);
      },
      child: Container(
        height: 25.0,
        child: Text(texto, style: textoDrawer),
      ),
    );
  }

  Widget drawerItem() {
    return Drawer(
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
            shrinkWrap: true,
            children: <Widget>[
              cabeceradrawer(data: funcion,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    Divider(
                      color: Colors.black,
                      thickness: 0.7,
                    ),
                    listTile('PERFIL', 6, 6),
                    Divider(
                      color: Colors.black,
                      thickness: 0.7,
                    ),
                    listTile('UNIDAD', 5, 8),
                    Divider(
                      color: Colors.black,
                      thickness: 0.7,
                    ),
                    listTile('NOTIFICACIONES', 12, 2),
                    Divider(
                      color: Colors.black,
                      thickness: 0.7,
                    ),
                    listTile('RESERVAS', 1, 7),
                    Divider(
                      color: Colors.black,
                      thickness: 0.7,
                    ),
                    listTile('FACTURAS', 9, 3),
                    Divider(
                      color: Colors.black,
                      thickness: 0.7,
                    ),
                    listTile('VISITAS', 2, 1),
                    Divider(
                      color: Colors.black,
                      thickness: 0.7,
                    ),
                    listTile('FAMILIA', 14, 9),
                    Divider(
                      color: Colors.black,
                      thickness: 0.7,
                    ),
                    listTile('TAXI', 13, 4),
                    Divider(
                      color: Colors.black,
                      thickness: 0.7,
                    ),
                    listTile('PQR', 10, 5),
                     Divider(
                       color: Colors.black,
                       thickness: 0.7,
                       ),
                    listTile('EMERGENCIAS', 22, 0),
                    Divider(
                      color: Colors.black,
                      thickness: 0.7,
                    ),   
                    listTile('CHAT', 21,13),
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
        ));
  }

  Widget FC() {
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
Widget _chatResidente(){
    return  SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(children: <Widget>[
              Divider(
                height: 30,
                color: Colors.white,
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(25, 5, 5, 5),
                  child: Row(children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),),
                    Text("CON QUIEN",
                        style: TextStyle(
                            fontSize: 23.0,
                            color: Color.fromRGBO(255, 153, 29, 1.0),
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold)),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),),
                    Text("DESEA HABLAR?",
                        style: TextStyle(
                            fontSize: 23.0,
                            color:Color.fromRGBO(167, 164, 164, 1),
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold)),
                  ])),
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
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _containerIcono(Icons.people, 'JUNTA DIRECTIVA', null,null),
                  SizedBox(
                    width: 10.0,
                  ),
                  _containerIcono(Icons.security, 'VIGILANTE', null,null),
                  SizedBox(
                    width: 10.0,
                  ),
                  _containerIcono(Icons.person, 'ADMINISTRADOR', 19,12),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 3.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color:Color.fromRGBO(167, 164, 164, 1),
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              Divider(
                height: 10,
                color: Colors.white,
              ),
              Divider(
                height: 40,
                color: Colors.white,
              ),
              //_botonPrincipal()
            ])
          ],
        ),
      );
  }
  Widget _contactos() {
    return ListView(
      children: <Widget>[
        Divider(),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text(
              'A',
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Text('A D M I N I S T R A D O R'),
          onTap: () {
            _selecionadoItem2(12, 'Chat');
          },
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text(
              'V',
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Text('V I G I L A N T E'),
          onTap: () {
            _selecionadoItem2(12, 'Chat');
          },
        ),
        Divider(),
      ],
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
                  7,
                  EdgeInsets.all(2.0)),
              _crearBotonRedondeado(
                  Color.fromRGBO(255, 153, 29, 1.0),
                  Image.asset('recursos/imagenes/calendar.png'),
                  'RESERVAS',
                  context,
                  1,
                  EdgeInsets.all(8.0)),
              _crearBotonRedondeado(
                  Color.fromRGBO(255, 153, 29, 1.0),
                  Image.asset('recursos/imagenes/qr.png'),
                  'VISITAS',
                  context,
                  2,
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
                    return snapshot.data!=null? ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  noticiaAlert(
                                      context,
                                      snapshot.data[index].descripcion,
                                      snapshot.data[index].titulo,
                                      snapshot.data[index].fechaCreacion);
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
                                        Text(
                                          snapshot.data[index].titulo,
                                          style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontFamily: 'CenturyGothic',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
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

  Widget _crearBotonRedondeado2(Color color, IconData icon, String texto,
      BuildContext context, Widget route) {
    return Container(
      width: double.infinity,
      height: 140,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 50),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(0.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 5.0),
          CircleAvatar(
            backgroundColor: color,
            radius: 35.0,
            child: IconButton(
              icon: Icon(icon),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => route),
                );
              },
            ),
          ),
          Text(
            texto,
            style: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
          SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }

  Widget _familia() {
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
                child: Column(children: <Widget>[
                  Text("ADMINISTRA LOS MIEMBROS ",
                      style: TextStyle(
                          fontSize: 23.0,
                          color: Color.fromRGBO(255, 153, 29, 1.0),
                          fontFamily: 'CenturyGothic',
                          fontWeight: FontWeight.bold)),
                  Text("DE TU NUCLEO FAMILIAR",
                      style: TextStyle(
                          fontSize: 23.0,
                          color: Color.fromRGBO(255, 153, 29, 1.0),
                          fontFamily: 'CenturyGothic',
                          fontWeight: FontWeight.bold)),
                ])),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: 4.0,
                width: 300.0,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(167, 164, 164, 1),
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            Divider(
              height: 50,
              color: Colors.white,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 8.0,
              width: 265.0,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 114, 0, 1.0),
                  borderRadius: BorderRadius.circular(5.0)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _containerIcono(Icons.favorite, 'CONYUGE', 15,9),
                SizedBox(
                  width: 10.0,
                ),
                _containerIcono(Icons.people, 'HIJOS', 16,9),
                SizedBox(
                  width: 10.0,
                ),
                _containerIcono(Icons.add_circle_outline, 'OTROS', 17,9),
              ],
            ),
            Container(
              height: 8.0,
              width: 265.0,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 114, 0, 1.0),
                  borderRadius: BorderRadius.circular(5.0)),
            ),
            Divider(
              height: 10,
              color: Colors.white,
            ),
            Text(
                '*Recuerde que estos miembros tendran \n acceso a la aplicacion por medio  del \n documento de identificacion bajo el rol \n del "Nucleo Familiar" en la unidad \n Residente Registrada',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Color.fromRGBO(255, 153, 29, 1.0),
                    fontFamily: 'CenturyGothic',
                    fontWeight: FontWeight.bold)),
            Divider(
              height: 40,
              color: Colors.white,
            ),
            botonPrincipal()
          ])
        ],
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

  _containerIcono(IconData iconData, leyenda, int posicion,int drawer) {
    return GestureDetector(
      onTap: () {
        _selecionadoItem2(posicion, "");
        selecionadoItem4(drawer);
        
      
      },
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 85.0,
            height: 85.0,
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
              size: 70.0,
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
      ),
    );
  }

  _vistaPerfil() {
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
                    _botonEditEliminarPerfil('EDITAR', 1),
                    SizedBox(
                      height: 2.0,
                    ),
                    _botonEditEliminarPerfil('GUARDAR', 0),
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
                      _infoText(nombre, 'Nombre'),
                      SizedBox(
                        height: 5.0,
                      ),
                      _infoText(apellido, 'Apellido'),
                      SizedBox(
                        height: 5.0,
                      ),
                      _infoText(telefono, 'Telefono'),
                      SizedBox(
                        height: 5.0,
                      ),
                      _infoText(email, 'Email'),
                      SizedBox(
                        height: 5.0,
                      ),
                      _infoText(direccion, 'Direccion'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 6.0,
                        width: 265.0,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 114, 0, 1.0),
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _containerIcono3(Icons.people, 'MI FAMILIA', 14, 9),
                          SizedBox(
                            width: 10.0,
                          ),
                          _containerIcono3(
                              Icons.monetization_on, 'FACTURAS', 9, 3),
                          SizedBox(
                            width: 10.0,
                          ),
                          _containerIcono3(
                              Icons.event_available, 'RESERVAS', 1, 7),
                        ],
                      ),
                      Container(
                        height: 6.0,
                        width: 265.0,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 114, 0, 1.0),
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DrawerItem()));
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
                          ))
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

  _botonEditEliminarPerfil(texto, n) {
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

  _botonPrincipal() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 100.0, vertical: 5.0),
      child: FlatButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => DrawerItem()));
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

  Widget _infoText(controller, nombre) {
    return Container(
      color: color,
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: nombre,
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontFamily: 'CenturyGothic',
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              )),
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

  botonPrincipal() {
    return GestureDetector(
      onTap: () {
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DrawerItem() ));
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 80.0),
          padding: EdgeInsets.symmetric(vertical: 7.0),
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5),
            ),
            onPressed: () {
              setState(() {
                _selecionadoItem2(11, "Home");
              });
            },
            child: const Text('PRINCIPAL',
                style: TextStyle(
                    fontSize: 24.0,
                    color: Color.fromRGBO(255, 153, 29, 1.0),
                    fontFamily: 'CenturyGothic',
                    fontWeight: FontWeight.bold)),
          )),
    );
  }

  _containerIcono2(IconData iconData, leyenda, int posicion, int drawer) {
    return GestureDetector(
        onTap: () {
          _selecionadoItem2(posicion, "asasdxsa");
          selecionadoItem4(drawer);
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

  _containerIcono3(IconData iconData, leyenda, int posicion, int drawer) {
    return GestureDetector(
        onTap: () {
          _selecionadoItem2(posicion, "asasdxsa");
          selecionadoItem4(drawer);
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
                      _containerIcono2(Icons.people, 'JUNTA DIRECTIVA', 20, 10),
                      SizedBox(
                        width: 10.0,
                      ),
                      _containerIcono2(Icons.security, 'VIGILANCIA', 18, 11),
                      SizedBox(
                        width: 10.0,
                      ),
                      _containerIcono2(Icons.person, 'ADMINISTRADOR', 19, 12),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DrawerItem()));
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
             _botonPrincipal(),
             SizedBox(height:10.0),
      ],

    );
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
                _selecionadoItem2(19, "");
                selecionadoItem4(12);
            },
           ),
        ),
          ],
        )
      ],
    );

   

  }


  
 Widget cardMensajes(
      texto, fecha, hora, color, estado, BuildContext context, id) {
  
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
     _selecionadoItem2(19, "");
                selecionadoItem4(12);
   },
   );

 }

}

class cabeceradrawer extends StatefulWidget {
   final  data;

  const cabeceradrawer({ Key key, this.data }): super(key: key);

  @override
  _cabeceradrawerState createState() => _cabeceradrawerState();
}

class _cabeceradrawerState extends State<cabeceradrawer> {
  @override
  Widget build(BuildContext context) {
    final perfilProvider = new PerfilProvider();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
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
                        MaterialPageRoute(builder: (context) => DrawerItem()));
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
          Text('RESIDENTE', style: TextStyle(color: Colors.white)),
          DropDownSidebar(data: widget.data,),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0, top: 5.0),
            child: Container(
              height: 4.0,
              width: 210.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.0)),
            ),
          ),
        ],
      ),
    );
  }
  

  
}
