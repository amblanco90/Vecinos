import 'package:edificion247/src/pages/residente/drawer.dart';
import 'package:edificion247/src/pages/residente/unidadesLista.dart';
import 'package:flutter/material.dart';
import 'package:edificion247/src/pages/admin/drawer_admin.dart';

class AfterLoginPage extends StatelessWidget {
  const AfterLoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              //Color.fromRGBO(205, 105, 55,1.0),
              Color.fromRGBO(168, 86, 0, 1.0),
              Color.fromRGBO(211, 94, 0, 1.0),

              Color.fromRGBO(255, 114, 0, 1.0),

              Color.fromRGBO(255, 135, 5, 1.0),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                '¿Con que rol desea ingresar?',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                    fontFamily: 'CenturyGothic'),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                 Container(
                    child: FlatButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: ()=>  Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DrawerAdminItem(),
                                    maintainState: false)),
                      child: Column(children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.business,
                            size: 50.0,
                            color: Colors.white,
                          ),
                        onPressed: (){
                           Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DrawerAdminItem(),
                                    maintainState: false));
                        },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: Text(
                            'A D M I N I S T R A D O R',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'CenturyGothic'),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  
                  
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 100.0, vertical: 5.0 ) ,
                    child: FlatButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: ()=>  Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DrawerItem(),
                                    maintainState: false)),
                      child: Column(children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            size: 50.0,
                            color: Colors.white, 
                          ),
                          onPressed: () {
                             Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DrawerItem(),
                                    maintainState: false));
                          },
                        ),
                        SizedBox( 
                          height: 10.0,
                        ),
                        Center(
                          child: Text(
                            'R E S I D E N T E',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'CenturyGothic'),
                          ),
                        ),
                      ]),
                    ),
                  ),

                  /* _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0),(Icons.home),'R E S I D E N T E', context, DrawerItem()),
                   _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0), Icons.business_center ,'A D M I N I S T R A D O R', context, DrawerAdminItem()),
               */
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _crearBotonRedondeado(Color color, IconData icon, String texto,
    BuildContext context, Widget route) {
  return Container(
    height: 130.0,
    margin: EdgeInsets.all(30.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 3,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 5.0),
        IconButton(
          icon: Icon(
            icon,
            color: Colors.grey.shade700,
            size: 40.0,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => route, maintainState: false));
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              texto,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
      ],
    ),
  );
}
