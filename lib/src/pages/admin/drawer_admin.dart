import 'package:edificion247/src/bloc/provider_perfil_admin.dart';
import 'package:edificion247/src/bloc/provider_unidad.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/noticia.dart';
import 'package:edificion247/src/models/residente.dart';
import 'package:edificion247/src/pages/admin/buzon_admin.dart';
import 'package:edificion247/src/pages/admin/buzon_unidades_admin.dart';
import 'package:edificion247/src/pages/admin/chat_admin.dart';
import 'package:edificion247/src/pages/admin/home_admin_pages.dart';
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
import 'package:edificion247/src/providers/noticiasProvider.dart';
import 'package:edificion247/src/widgets/dropdown_widget.dart';
import 'package:edificion247/src/widgets/home_button_widget.dart';
import 'package:edificion247/src/widgets/noticiasAlert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class DrawerAdminItem extends StatefulWidget {

  @override
  _DrawerAdminItemState createState() => _DrawerAdminItemState();
}

class _DrawerAdminItemState extends State<DrawerAdminItem> {

    String _nombre_appbar='';
    String _nombre_appbar_anterior="";
    int _posicion_appbar=0;
    int _posicion_appbar_anterior=0;

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
        case 8: return MiBuzonPages();
        case 9: return ZonasSocialesPages();
        case 12: return JuntaDirectivaPages();
        case 11:return MiPerfilAdminPages();
        case 13:return TaxiPage();
        case 14:return ListaSubUnidadesPage();
        case 15:return ChatPageAdmin();
        case 16: MiBuzonPages();
                

      }
    
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
            _item=posicion;
            _nombre_appbar=nombre;
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
                            _item = 0;
                            _nombre_appbar = 'Home';
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
   return SizedBox(
        width: 250.0,
        child: Drawer(
          
          child: Container(
            decoration: BoxDecoration(
                   gradient: LinearGradient(
                          begin: Alignment.topRight, 
                          end: Alignment.bottomRight,
                          colors: [
                            //Color.fromRGBO(205, 105, 55,1.0),                           
                              Color.fromRGBO(255, 135, 5,1.0),
                              Color.fromRGBO(255, 114, 0,1.0),
                              Color.fromRGBO(168, 86,0, 1.0),
                          ])
                 ),
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
                    
                
                ExpansionTile(
                  

                  title: Text('UNIDAD',style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'CenturyGothic'),textAlign: TextAlign.center),
                  children: <Widget>[
                    InkWell(
                    child: Text("DATOS BASICOS",style: TextStyle(fontSize: 15,color: Colors.black), textAlign: TextAlign.right,),
                    onTap: () {

                        _selecionadoItem(1,'DATOS BASICOS');
                      
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

                listTile('SOPORTE 24/7', 3),
                Divider(color: Colors.black,thickness: 0.7,),

                listTile('CHAT', 15),
                
                Divider(color: Colors.black,thickness: 0.7,),
                listTile('TAXI', 13),
                
                Divider(color: Colors.black,thickness: 0.7,),
                listTile('NOTIFICACIONES',8),
                
                Divider(color: Colors.black,thickness: 0.7,),
               
                listTile('SEGURIDAD',5),
                
                Divider(color: Colors.black,thickness: 0.7,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      
                      
                      Column(
                        
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                            child: Icon(Icons.exit_to_app, color: Colors.white,),
                            onTap:(){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(), maintainState: false));
                            }
                            ),
                        ],
                      ),
                      


                      Container(
                          
                          height: 80.0,
                          width: 80.0,
                          child: Image(
                          image: AssetImage('recursos/imagenes/logoApp.png'),
                        ),
                      ),


                      
                      Icon(Icons.warning, color: Colors.white,),


                     
                     


                    ],
                  ),
                   Divider(color: Colors.white,thickness: 4.0,),

                   ],
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
                  Text('V.1.0', style: TextStyle(color: Colors.white),)        
                 ],
               ),


              ],


            ),
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
             Icon(Icons.home, color: Colors.white,size: 25.0,),
             Expanded(
               child: Container(),
             ),
             IconButton(
               icon: Icon(Icons.arrow_back_ios, color: Colors.white,size: 25.0,),
               onPressed: (){
                 Navigator.of(context).pop();
               },
               )
           ],
         ),
         CircleAvatar(
             backgroundColor: Color.fromRGBO(239, 103, 0, 1.0),
             radius: 70.0,
             child: CircleAvatar(
             radius: 65.0,
             backgroundColor: Colors.grey,
             child: Text('J',style:TextStyle(fontSize: 40.0, color: Colors.white)),
           ),
         ),
         SizedBox(height: 5.0,),
         Text('Carlos Saumeth', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Arial')),
         Text('ADMINISTRADOR', style: TextStyle(color: Colors.white)),
         DropdownWidget()
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

  
}