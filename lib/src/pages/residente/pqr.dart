import 'dart:convert';
import 'dart:io';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/pqr.dart';
import 'package:edificion247/src/pages/residente/drawer.dart';
import 'package:edificion247/src/providers/pqrProvider.dart';
import 'package:edificion247/src/search/search_delegate_factura.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:edificion247/src/widgets/dropdown_widget.dart';
import 'package:edificion247/src/widgets/estadoPqrAlert.dart';
import 'package:edificion247/src/widgets/generarPqrAlert.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';

class PqrPages extends StatefulWidget {
  PqrPages({Key key}) : super(key: key);

  @override
  _PqrPagesState createState() => _PqrPagesState();
}

class _PqrPagesState extends State<PqrPages> {
  final pqrProvider = PqrProvider();

  final tController = TextEditingController();
  final descripcionController = TextEditingController();

  bool _isVisible = true;

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
        appData.permisos=='Admini' ? Container():     Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'TUS ',
                  style: TextStyle(
                      color: Colors.orange.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      fontFamily: 'CenturyGothic'),
                ),
                Text(
                  'PQRs',
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      fontFamily: 'CenturyGothic'),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: 7.0,
                width: 305.0,
                decoration: BoxDecoration(
                    color: Colors.orange.shade600,
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () {
                
                gg(context, refresh);
                //_dialogCall(context);
              },
              child: Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.orange,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  'RADICAR NUEVA PQR',
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      fontFamily: 'CenturyGothic'),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HISTORIAL',
                  style: TextStyle(
                      color: Colors.orange.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      fontFamily: 'CenturyGothic'),
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
                width: 305.0,
                decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 35.0,
                maxHeight: 250.0,
              ),
              child: Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                child: Scrollbar(
                  child: FutureBuilder(
                    future: pqrProvider.getAllPqrs(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Pqr>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done)
                        
                        return snapshot.data != null
                            ? ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                 var tipoString;
                                 if(snapshot.data[index].idTipoPqr==1){
                                     tipoString = 'ZONA';
                                  }else if(snapshot.data[index].idTipoPqr==2){
                                    tipoString = 'CASA';
                                  }else if(snapshot.data[index].idTipoPqr==3){
                                    tipoString = 'UNIDAD GENERAL';
                                  }else if(snapshot.data[index].idTipoPqr==4){
                                    tipoString = 'OTRO';
                                  }
                                  return cardMensajes(
                                      snapshot.data[index].descripcion,
                                      snapshot.data[index].fechaCreacion,
                                      '',
                                      snapshot.data[index].idPqr.isEven
                                          ? Colors.red.shade100
                                          : Colors.grey.shade300,
                                      snapshot.data[index].estado,
                                      context,
                                      snapshot.data[index].idPqr,
                                      snapshot.data[index].foto,
                                      snapshot.data[index].destinatario,
                                      tipoString);
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: 4.0,
                width: 305.0,
                decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DrawerItem()));
                },
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
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
      ),
    );
  }

  Widget cardMensajes(
      texto, fecha, hora, color, estado, BuildContext context, id,foto,destinatario,tipo) {
    var estadoString;

    if (estado == 0) {
      estadoString = 'INACTIVO';
    } else if (estado == 1) {
      estadoString = 'ACTIVO';
    } else if (estado == 30) {
      estadoString = 'RESUELTO';
    }

    return GestureDetector(
        onTap: () {
          estadoPqr(context,texto,foto,estadoString,id,destinatario,tipo);
        },
        child: Card(
          color: color,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
            child: Row(
              children: <Widget>[
                Container(
                    height: 15.0,
                    width: 120.0,
                    child: Text(
                      texto,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontFamily: 'CenturyGothic',
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0),
                    )),
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

                           estadoPqr(context,texto,foto,estadoString,id,destinatario,tipo);

                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
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


}

