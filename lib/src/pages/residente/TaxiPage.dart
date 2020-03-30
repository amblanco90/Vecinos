import 'package:edificion247/src/models/pedidoTaxi.dart';
import 'package:edificion247/src/providers/pedidoTaxi.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:edificion247/src/pages/residente/drawer.dart';

import '../../http/api-service.dart';
import '../../http/api-service.dart';

class TaxiPage extends StatefulWidget {
  TaxiPage({Key key}) : super(key: key);

  @override
  _TaxiPageState createState() => _TaxiPageState();
}

class _TaxiPageState extends State<TaxiPage> {
  final descripcionController = TextEditingController();
  final api = PedidoTaxiProvider();

  @override
  Widget build(BuildContext context) {

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
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              color: Colors.white,
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
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[descripcion],
                      ),
                    ),
                    Table(
                      children: [
                        TableRow(children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 153, 29, 0.9),
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 65.0, vertical: 10.00),
                            child: FlatButton(
                              child: Text('PEDIR TAXI',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0,
                                      fontFamily: 'CenturyGothic')),
                              onPressed: () {
                                if (descripcionController.text.isEmpty) {
                                  ValidacionLoginAlert(context);
                                } else {
                                  api
                                      .pedirTaxi(
                                          context, descripcionController.text)
                                      .then((value) {
                                    descripcionController.clear();
                                    print(value);
                                    setState(() {
                                      
                                    });
                                    
                                    PedirTaxiAlert(context);
                                  });
                                }
                              },
                            ),
                          )
                        ])
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'HISTORIAL',
              style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 50.0,
                maxHeight: 160.0,
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
                    future: api.getAllPedidosTaxi(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<PedidoTaxi>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done)
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: Colors.grey.shade300,
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      snapshot.data[index].fechaCreacion,
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                    Text(''),
                                    Text(
                                      'OBSERVACIONES:',
                                      style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontFamily: 'CenturyGothic'),
                                    ),
                                    
                                    Text(
                                      snapshot.data[index].descripcion,
                                      maxLines: 3,
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontFamily: 'CenturyGothic',
                                          fontWeight: FontWeight.bold),
                                    ),

                                    snapshot.data[index].estado == 0
                                        ? Text(
                                            'CANCELADO',
                                            maxLines: 3,
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'CenturyGothic'),
                                          )
                                        : Container(),
                                    snapshot.data[index].estado == 1
                                        ? Text(
                                            'PENDIENTE',
                                            maxLines: 3,
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'CenturyGothic'),
                                          )
                                        : Container(),
                                    snapshot.data[index].estado == 2
                                        ? Text(
                                            'ATENDIDO',
                                            maxLines: 3,
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'CenturyGothic'),
                                          )
                                        : Container(),
                                    
                                    Text(
                                      snapshot.data[index].estado.toString(),
                                      maxLines: 3,
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontFamily: 'CenturyGothic',
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            );
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

            Container(
              margin: EdgeInsets.symmetric(horizontal: 100.0, vertical: 5.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DrawerItem()));
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
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            )


   
          ],
        ),
      ),
    );
  }


}