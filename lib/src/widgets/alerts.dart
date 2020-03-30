import 'package:edificion247/src/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';

Widget MensajeRecibido(BuildContext context) {
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
                    Text('DE: ',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 114, 0, 1.0),
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0)),
                    Text('ADMINISTRACION',
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '19/02/2020',
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontFamily: 'CenturyGothic',
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0),
                          ),
                          Text(
                            '2:00 PM',
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
                ConstrainedBox(
                  constraints: new BoxConstraints(
                    maxHeight: 190.0,
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    child: Scrollbar(
                      child: new ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Container(
                              width: 200.0,
                              height: 200.0,
                              child: TextField(
                                cursorColor: Colors.orange,
                                decoration:
                                    InputDecoration.collapsed(hintText: ''),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    NuevoMensaje(context);
                  },
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Center(
                      child: Text(
                        'RESPONDER',
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

Widget NuevoMensaje(BuildContext context) {
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
                    Text('PARA: ',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 114, 0, 1.0),
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0)),
                    Text('ADMINISTRACION',
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '19/02/2020',
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontFamily: 'CenturyGothic',
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0),
                          ),
                          Text(
                            '2:00 PM',
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
                ConstrainedBox(
                  constraints: new BoxConstraints(
                    maxHeight: 190.0,
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    child: Scrollbar(
                      child: new ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Container(
                              width: 200.0,
                              height: 200.0,
                              child: TextField(
                                cursorColor: Colors.orange,
                                decoration:
                                    InputDecoration.collapsed(hintText: ''),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Center(
                      child: Text(
                        'CERRAR',
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

Widget ErrorLoginAlert(BuildContext context) {
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
              Text('Su usuario y/o contraseña son incorrectos'),
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

Widget ReservaGeneradaAlert(BuildContext context) {
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
                child: Image.asset('recursos/imagenes/Logo.png'),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text('Su solicitud de reserva ha sido generada exitosamente.'),
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

Widget ValidacionLoginAlert(BuildContext context) {
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
              Text('Debe completar todos los campos.'),
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

Widget PedirTaxiAlert(BuildContext context) {
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
              Text('Se ha notificado al vigilante que usted necesita un taxi.'),
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

Widget EdicionCompleta(BuildContext context) {
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
              Text('Se ha  editado su perfil correctamente.'),
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

Widget PQRAlert(BuildContext context) {
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
              Text('PQR generado exitosamente.'),
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

Widget RegistroZonaAlert(BuildContext context) {
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
              Text('Registro de zona completado exitosamente'),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Aceptar',
                style: TextStyle(color: Color.fromRGBO(205, 105, 55, 1.0)),
              ),
              onPressed: () {},
              /* onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaPeticionesReservaPage() ),
              )*/
            ),
          ],
        );
      });
}

Widget GenericAlert(BuildContext context, texto) {
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
              Text(texto),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Aceptar',
                style: TextStyle(color: Color.fromRGBO(205, 105, 55, 1.0)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              
              /* onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaPeticionesReservaPage() ),
              )*/
            ),
          ],
        );
      });
}

