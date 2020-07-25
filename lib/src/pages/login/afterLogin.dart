import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/pages/residente/drawer.dart';
import 'package:edificion247/src/pages/residente/unidadesLista.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:edificion247/src/pages/admin/drawer_admin.dart';

class AfterLoginPage extends StatefulWidget {
  const AfterLoginPage({Key key}) : super(key: key);

  @override
  _AfterLoginPageState createState() => _AfterLoginPageState();
}

class _AfterLoginPageState extends State<AfterLoginPage> {
  var color1 = Colors.transparent;
  var color2 = Colors.transparent;
  var seleccionado = 'Ninguno';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logo = Container(
      height: size.height * 0.2,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 20.0,
        child: Image.asset('recursos/imagenes/logoApp.png'),
      ),
    );

    final botones = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
         appData.permisos=='Residente'&& appData.permisos!='Admini'? Column(
              children: <Widget>[
                FlatButton(
                    color: color1,
                    onPressed: (){
                     appData.rol="Residente";
                     GenericAlert(context, "¿Está seguro de que desea entrar con el rol de "+appData.rol+"?", appData.rol);
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 41.0,
                            child: Image.asset(
                                'recursos/imagenes/residenteicon.png'),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'RESIDENTE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'CenturyGothic',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ))
              ],
            ):Container(),
           appData.permisos=='Administrador'|| appData.permisos=='Admini'? Column(
              children: <Widget>[
                FlatButton(
                    color: color2,
                    onPressed: (){
                     appData.rol="Admin";
                     GenericAlert(context, "¿Está seguro de que desea entrar con el rol de "+appData.rol+"?", appData.rol);
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 40.0,
                            child:
                                Image.asset('recursos/imagenes/adminicon.png'),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'ADMIN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'CenturyGothic',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ))
              ],
            ):Container(),
          ],
        ),
      ],
    );

    final leyenda = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'SELECCIONA TU ROL',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'CenturyGothic',
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              letterSpacing: 1.2),
        ),
      ],
    );

    return Scaffold(
        backgroundColor: Colors.white,
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
              Expanded(
                child: Center(
                    child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 24.0, right: 24.0),
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    logo,
                    SizedBox(height: 30.0),
                    leyenda,
                    SizedBox(height: 30.0),
                    botones,
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 6.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                    SizedBox(height: 50.0),
                 
                   
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                )),
              ),
              Image.asset('recursos/imagenes/LogoEmpresa.png'),
            ],
          ),
        ));
  }
}
