import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/pedidoTaxi.dart';
import 'package:edificion247/src/pages/admin/drawer_admin.dart';
import 'package:edificion247/src/providers/pedidoTaxi.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:edificion247/src/pages/residente/drawer.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../../http/api-service.dart';
import '../../http/api-service.dart';

class TaxiPage extends StatefulWidget {
  TaxiPage({Key key}) : super(key: key);

  @override
  _TaxiPageState createState() => _TaxiPageState();
}

class _TaxiPageState extends State<TaxiPage> {
  var estadoString = 'ACTIVO';
  final descripcionController = TextEditingController();
  final api = PedidoTaxiProvider();

  ProgressDialog pr;
  ProgressDialog peliminar;

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.style(
        message: 'Guardando...',
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

    peliminar = new ProgressDialog(context);
    peliminar.style(
        message: 'Eliminando...',
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

    peliminar = new ProgressDialog(context);

    final color = TextStyle(color: Colors.white);

    final descripcion = TextFormField(
      controller: descripcionController,
      cursorColor: Color.fromRGBO(205, 105, 55, 1.0),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'OBSERVACIONES',
        focusColor: Colors.grey.shade700,
        enabledBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700,
              width: 1.0,
              style: BorderStyle.solid),
        ),
        focusedBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700,
              width: 1.0,
              style: BorderStyle.solid),
        ),
        border: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700, width: 1.0, style: BorderStyle.none),
        ),
        hintStyle:
            TextStyle(color: Colors.grey.shade700, fontFamily: 'CenturyGothic'),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Center(
                child: GestureDetector(
              onTap: () {
                PedirTaxi(context);
              },
              child: CircleAvatar(
                backgroundColor: Colors.orange,
                radius: 90,
                child: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  radius: 83,
                  child: Text(
                    'TAXI',
                    style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 60.0),
                  ),
                ),
              ),
            )),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ESTADO: ',
                  style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                Text(
                  estadoString,
                  style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: 4.0,
                width: 300.0,
                decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 50.0,
                maxHeight: 300.0,
              ),
              child: Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                child: Scrollbar(
                  child: FutureBuilder(
                    future: api.getAllPedidosTaxi(),
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
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: 4.0,
                width: 300.0,
                decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100.0, vertical: 5.0),
              child: FlatButton(
                onPressed: () {
                  
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>  appData.rol=='Residente'? DrawerItem():DrawerAdminItem()));
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardMensajes(
      texto, fecha, hora, color, estado, BuildContext context, id) {
    if (estado == 0) {
      estadoString = 'CANCELADO';
    } else if (estado == 1) {
      estadoString = 'ACTIVO';
    } else if (estado == 20) {
      estadoString = 'EN PORTERIA';
    } else if (estado == 21) {
      estadoString = 'DESPACHADO';
    }

    return GestureDetector(
        onTap: () {
          if (estado == 0) {
            estadoString = 'CANCELADO';
          } else if (estado == 1) {
            estadoString = 'ACTIVO';
          } else if (estado == 20) {
            estadoString = 'EN PORTERIA';
          } else if (estado == 21) {
            estadoString = 'DESPACHADO';
          }
          setState(() {});
        },
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
                          '(LEER)' + estadoString,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 114, 0, 1.0),
                              fontFamily: 'CenturyGothic',
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0),
                        ),
                        onTap: () {
                          if (estado == 0) {
                            estadoString = 'CANCELADO';
                          } else if (estado == 1) {
                            estadoString = 'ACTIVO';
                          } else if (estado == 20) {
                            estadoString = 'EN PORTERIA';
                          } else if (estado == 21) {
                            estadoString = 'DESPACHADO';
                          }

                          verTaxi(context, estadoString, texto, id);
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

  Widget PedirTaxi(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          final observaciones = TextEditingController();
          return Dialog(
            backgroundColor: Colors.transparent,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.orangeAccent.shade400,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(' SOLICITUD TAXI ',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ConstrainedBox(
                    constraints: new BoxConstraints(
                      maxHeight: 190.0,
                    ),
                    child: Container(
                      color: Colors.grey.shade200,
                      padding: EdgeInsets.all(10.0),
                      child: Scrollbar(
                        child: new ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Container(
                                width: 200.0,
                                height: 200.0,
                                child: TextField(
                                  controller: observaciones,
                                  cursorColor: Colors.orange,
                                  decoration: InputDecoration.collapsed(
                                      hintText: 'OBSERVACIONES',
                                      hintStyle: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.grey.shade700,
                                        fontFamily: 'CenturyGothic',
                                        fontWeight: FontWeight.bold,
                                      )),
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
                      pr.show();
                      if (observaciones.text.isEmpty) {
                        ValidacionLoginAlert(context);
                      } else {
                        api
                            .pedirTaxi(context, observaciones.text)
                            .then((value) {
                          observaciones.clear();
                          print(value);
                          setState(() {});
                          pr.dismiss();
                          Navigator.pop(context);
                          PedirTaxiAlert(context);
                        });
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Center(
                        child: Text(
                          'CONFIRMAR PEDIDO',
                          style: TextStyle(
                              color: Colors.orange.shade700,
                              fontFamily: 'CenturyGothic',
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Center(
                        child: Text(
                          'CANCELAR PEDIDO',
                          style: TextStyle(
                              color: Colors.orange.shade700,
                              fontFamily: 'CenturyGothic',
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ]),
              ),
            ),
          );
        });
  }

  Widget verTaxi(BuildContext context, estadoString, observaciones, id) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.orangeAccent.shade400,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(' ESTADO SOLICITUD ',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ConstrainedBox(
                    constraints: new BoxConstraints(
                      maxHeight: 190.0,
                    ),
                    child: Container(
                      color: Colors.grey.shade200,
                      padding: EdgeInsets.all(10.0),
                      child: Scrollbar(
                        child: new ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Container(
                              width: 200.0,
                              height: 200.0,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('OBSERVACIONES: ',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey.shade700,
                                          fontFamily: 'CenturyGothic',
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(observaciones,
                                        maxLines: null,
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey.shade700,
                                          fontFamily: 'CenturyGothic',
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(height: 10.0),
                                    Row(
                                      children: <Widget>[
                                        Text('ESTADO: ',
                                            maxLines: null,
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.grey.shade700,
                                              fontFamily: 'CenturyGothic',
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(estadoString,
                                            maxLines: null,
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.grey.shade700,
                                              fontFamily: 'CenturyGothic',
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      pr.show();
                      api.eliminarPedidoTaxi(context, id).then((value) {
                        print(value);
                        setState(() {});
                        pr.dismiss();

                        Navigator.pop(context);
                        GenericAlert(context, value["respuesta"],null);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Center(
                        child: Text(
                          'CANCELAR PEDIDO',
                          style: TextStyle(
                              color: Colors.orange.shade700,
                              fontFamily: 'CenturyGothic',
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ]),
              ),
            ),
          );
        });
  }
}
