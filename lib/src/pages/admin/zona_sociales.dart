import 'dart:io';

import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/pqr.dart';
import 'package:edificion247/src/models/zonaSocial.dart';
import 'package:edificion247/src/pages/admin/drawer_admin.dart';
import 'package:edificion247/src/providers/pqrProvider.dart';
import 'package:edificion247/src/providers/zonasSocialesProvider.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:edificion247/src/widgets/dropdown_widget.dart';
import 'package:edificion247/src/widgets/time_picker_widgets.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ZonasSocialesPages extends StatefulWidget {
  @override
  _ZonasSocialesPagesState createState() => _ZonasSocialesPagesState();
}

class _ZonasSocialesPagesState extends State<ZonasSocialesPages> {
  File _image;
  final tController = TextEditingController();
  final descripcionController = TextEditingController();
  final nomenclaturaController = TextEditingController();
  final zonasSocialesProvider = ZonasSocialesProvider();
  final valorController = TextEditingController();

  ProgressDialog pr;

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

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
    final color = TextStyle(color: Colors.white);

    final nombreZona = TextFormField(
      controller: descripcionController,
      cursorColor: Color.fromRGBO(205, 105, 55, 1.0),
      keyboardType: TextInputType.multiline,
      autofocus: false,
      maxLines: null,
      onChanged: (string) {},
      decoration: InputDecoration(
        hintText: 'Nombre zona social',
        hintStyle:
            TextStyle(fontWeight: FontWeight.bold, fontFamily: 'CenturyGothic'),
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
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );
    final nomenclatura = TextFormField(
      controller: nomenclaturaController,
      cursorColor: Color.fromRGBO(205, 105, 55, 1.0),
      keyboardType: TextInputType.multiline,
      autofocus: false,
      maxLines: null,
      onChanged: (string) {},
      decoration: InputDecoration(
        hintText: 'Nomenclatura',
        hintStyle: TextStyle(
          fontFamily: 'CenturyGothic',
          fontWeight: FontWeight.bold,
        ),
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
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );
    final valor = TextFormField(
      controller: valorController,
      cursorColor: Color.fromRGBO(205, 105, 55, 1.0),
      keyboardType: TextInputType.number,
      autofocus: false,
      maxLines: null,
      onChanged: (string) {},
      decoration: InputDecoration(
        hintText: 'Valor',
        hintStyle: TextStyle(
          fontFamily: 'CenturyGothic',
          fontWeight: FontWeight.bold,
        ),
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
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
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
                    nomenclatura,
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Tipo',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'CenturyGothic',
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold),
                    ),
                    DropDownZonasAdmin(),
                    DataTable(columns: [
                      DataColumn(
                        label: Text(
                          'Dia',
                          style: TextStyle(
                              
                              fontFamily: 'CenturyGothic',
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Inicio',
                          style: TextStyle(
                              
                              fontFamily: 'CenturyGothic',
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Fin',
                          style: TextStyle(
                            
                              fontFamily: 'CenturyGothic',
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ], rows: [
                      DataRow(cells: [
                        DataCell(
                          Text(
                            'Lunes',
                            style: TextStyle(
                                
                                fontFamily: 'CenturyGothic',
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(HoraInicioLunes()),
                        DataCell(HoraFinLunes())
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text(
                            'Martes',
                            style: TextStyle(
                                
                                fontFamily: 'CenturyGothic',
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(HoraInicioMartes()),
                        DataCell(HoraFinalMartes())
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text(
                            'Miercoles',
                            style: TextStyle(
                                
                                fontFamily: 'CenturyGothic',
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(HoraInicioMiercoles()),
                        DataCell(HoraFinalMiercoles())
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text(
                            'Jueves',
                            style: TextStyle(
                               
                                fontFamily: 'CenturyGothic',
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(HoraInicioJueves()),
                        DataCell(HoraFinalJueves())
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text(
                            'Viernes',
                            style: TextStyle(
                               
                                fontFamily: 'CenturyGothic',
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(HoraInicioViernes()),
                        DataCell(HoraFinalViernes())
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text(
                            'Sábado',
                            style: TextStyle(
                                
                                fontFamily: 'CenturyGothic',
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(HoraInicioSabado()),
                        DataCell(HoraFinalSabado())
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text(
                            'Domingo',
                            style: TextStyle(
                                
                                fontFamily: 'CenturyGothic',
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(HoraInicioDomingo()),
                        DataCell(HoraFinalDomingo())
                      ])
                    ]),
                    valor,
                    DropDownZonaSocialAdmin(),
                    Table(
                      children: [
                        TableRow(children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 153, 29, 0.9),
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.00),
                            child: FlatButton(
                              child: Text('CREAR ZONA SOCIAL',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'CenturyGothic',
                                      fontSize: 15.0)),
                              onPressed: () {
                                if (nomenclaturaController.text.isEmpty ||
                                    valorController.text.isEmpty) {
                                  ValidacionLoginAlert(context);
                                } else {
                                  pr.show();
                                  zonasSocialesProvider
                                      .crearZonaSocial(
                                          nomenclaturaController.text,
                                          valorController.text)
                                      .then((value) {
                                    setState(() {
                                      appData.hora_final_lunes = 'Fin';
                                      appData.hora_inicio_lunes = 'Inicio';
                                      appData.hora_inicio_martes = 'Inicio';
                                      appData.hora_final_martes = 'Fin';
                                      appData.hora_inicio_miercoles = 'Inicio';
                                      appData.hora_final_miercoles = 'Fin';
                                      appData.hora_inicio_jueves = 'Inicio';
                                      appData.hora_final_jueves = 'Fin';
                                      appData.hora_inicio_viernes = 'Inicio';
                                      appData.hora_final_viernes = 'Fin';
                                      appData.hora_inicio_sabado = 'Inicio';
                                      appData.hora_final_sabado = 'Fin';
                                      appData.hora_inicio_domingo = 'Inicio';
                                      appData.hora_final_domingo = 'Fin';
                                      appData.tipo_zona = 1;
                                      appData.tipo_zona_string = 'Piscina';
                                      appData.estado_zona = 1;
                                      appData.estado_zona_string = 'Activo';
                                      appData.idZonaSocial = null;
                                      descripcionController.text = '';
                                      valorController.text = '';
                                      nomenclaturaController.text = '';
                                    });
                                    pr.dismiss();
                                    GenericAlert(context, value["respuesta"]);
                                  });
                                }
                              },
                            ),

                            
                          )
                          ,
                        
                        ]),
                        TableRow(
                          children:[
                            Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 153, 29, 0.9),
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.00),
                            child: FlatButton(
                              child: Text('LIMPIAR',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'CenturyGothic',
                                      fontSize: 15.0)),
                              onPressed: () {
                                
                                    setState(() {
                                      appData.hora_final_lunes = 'Fin';
                                      appData.hora_inicio_lunes = 'Inicio';
                                      appData.hora_inicio_martes = 'Inicio';
                                      appData.hora_final_martes = 'Fin';
                                      appData.hora_inicio_miercoles = 'Inicio';
                                      appData.hora_final_miercoles = 'Fin';
                                      appData.hora_inicio_jueves = 'Inicio';
                                      appData.hora_final_jueves = 'Fin';
                                      appData.hora_inicio_viernes = 'Inicio';
                                      appData.hora_final_viernes = 'Fin';
                                      appData.hora_inicio_sabado = 'Inicio';
                                      appData.hora_final_sabado = 'Fin';
                                      appData.hora_inicio_domingo = 'Inicio';
                                      appData.hora_final_domingo = 'Fin';
                                      appData.tipo_zona = 1;
                                      appData.tipo_zona_string = 'Piscina';
                                      appData.estado_zona = 1;
                                      appData.estado_zona_string = 'Activo';
                                      appData.idZonaSocial = null;
                                      descripcionController.text = '';
                                      valorController.text = '';
                                      nomenclaturaController.text = '';
                                    });
                                   
                                  })
                              
                              
                            

                            
                          )
                        
                          ]
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 35.0,
                maxHeight: 280.0,
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
                    future: zonasSocialesProvider.getAllZonasSociales(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<ZonaSocial>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done)
                        return snapshot.data != null
                            ? ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {

                                      setState(() {
                                      appData.hora_final_lunes = 'Fin';
                                      appData.hora_inicio_lunes = 'Inicio';
                                      appData.hora_inicio_martes = 'Inicio';
                                      appData.hora_final_martes = 'Fin';
                                      appData.hora_inicio_miercoles = 'Inicio';
                                      appData.hora_final_miercoles = 'Fin';
                                      appData.hora_inicio_jueves = 'Inicio';
                                      appData.hora_final_jueves = 'Fin';
                                      appData.hora_inicio_viernes = 'Inicio';
                                      appData.hora_final_viernes = 'Fin';
                                      appData.hora_inicio_sabado = 'Inicio';
                                      appData.hora_final_sabado = 'Fin';
                                      appData.hora_inicio_domingo = 'Inicio';
                                      appData.hora_final_domingo = 'Fin';
                                      appData.tipo_zona = 1;
                                      appData.tipo_zona_string = 'Piscina';
                                      appData.estado_zona = 1;
                                      appData.estado_zona_string = 'Activo';
                                      appData.idZonaSocial = null;
                                      descripcionController.text = '';
                                      valorController.text = '';
                                      nomenclaturaController.text = '';
                                    });

                                      print(snapshot.data[index].disponibilidad);
                                      appData.estado_zona_string=snapshot.data[index].inputTipoZona==1?appData.estado_zona_string='Activo':'Inactivo';
                                      appData.idZonaSocial=snapshot.data[index].inputId;
                                      if(snapshot.data[index].inputTipoZona==1){
                                        appData.tipo_zona_string= 'Piscina';
                                      }else if (snapshot.data[index].inputTipoZona==2){
                                        appData.tipo_zona_string='Salón';
                                      }else if(snapshot.data[index].inputTipoZona==3){
                                        appData.tipo_zona_string='Gimnasio';
                                      }
                                      
                                    
                                      for (var i = 0;
                                          i <
                                              snapshot.data[index]
                                                  .disponibilidad.length;
                                          i++) {
                                        nomenclaturaController.text =
                                            snapshot.data[index].inputNomen;
                                        valorController.text = snapshot
                                            .data[index].inputValor
                                            .toString();
                                        if (snapshot.data[index]
                                                .disponibilidad[i]["dia"] ==
                                            1) {
                                          appData.hora_inicio_lunes = snapshot
                                                  .data[index].disponibilidad[i]
                                              ["hora_inicio"];
                                          print(snapshot
                                                  .data[index].disponibilidad[i]
                                              ["hora_inicio"]);
                                          appData.hora_final_lunes = snapshot
                                              .data[index]
                                              .disponibilidad[i]["hora_fin"];

                                              

                                             
                                        }else if (snapshot.data[index]
                                                .disponibilidad[i]["dia"] ==
                                            2) {
                                          appData.hora_inicio_martes = snapshot
                                                  .data[index].disponibilidad[i]
                                              ["hora_inicio"];
                                          print(snapshot
                                                  .data[index].disponibilidad[i]
                                              ["hora_inicio"]);
                                          appData.hora_final_martes = snapshot
                                              .data[index]
                                              .disponibilidad[i]["hora_fin"];

                                              
                                             
                                        }else if (snapshot.data[index]
                                                .disponibilidad[i]["dia"] ==
                                            3) {
                                          appData.hora_inicio_miercoles = snapshot
                                                  .data[index].disponibilidad[i]
                                              ["hora_inicio"];
                                          print(snapshot
                                                  .data[index].disponibilidad[i]
                                              ["hora_inicio"]);
                                          appData.hora_final_miercoles = snapshot
                                              .data[index]
                                              .disponibilidad[i]["hora_fin"];

                                            

                                             
                                        }else if (snapshot.data[index]
                                                .disponibilidad[i]["dia"] ==
                                            4) {
                                          appData.hora_inicio_jueves = snapshot
                                                  .data[index].disponibilidad[i]
                                              ["hora_inicio"];
                                          print(snapshot
                                                  .data[index].disponibilidad[i]
                                              ["hora_inicio"]);
                                          appData.hora_final_jueves = snapshot
                                              .data[index]
                                              .disponibilidad[i]["hora_fin"];

                                             

                                             
                                        }else if (snapshot.data[index]
                                                .disponibilidad[i]["dia"] ==
                                            5) {
                                          appData.hora_inicio_viernes = snapshot
                                                  .data[index].disponibilidad[i]
                                              ["hora_inicio"];
                                          print(snapshot
                                                  .data[index].disponibilidad[i]
                                              ["hora_inicio"]);
                                          appData.hora_final_viernes = snapshot
                                              .data[index]
                                              .disponibilidad[i]["hora_fin"];

                                             

                                             
                                        }else if (snapshot.data[index]
                                                .disponibilidad[i]["dia"] ==
                                            6) {
                                          appData.hora_inicio_sabado = snapshot
                                                  .data[index].disponibilidad[i]
                                              ["hora_inicio"];
                                          print(snapshot
                                                  .data[index].disponibilidad[i]
                                              ["hora_inicio"]);
                                          appData.hora_final_sabado = snapshot
                                              .data[index]
                                              .disponibilidad[i]["hora_fin"];

                                              

                                             
                                        }else if (snapshot.data[index]
                                                .disponibilidad[i]["dia"] ==
                                            7) {
                                          appData.hora_inicio_domingo = snapshot
                                                  .data[index].disponibilidad[i]
                                              ["hora_inicio"];
                                          print(snapshot
                                                  .data[index].disponibilidad[i]
                                              ["hora_inicio"]);
                                          appData.hora_final_domingo = snapshot
                                              .data[index]
                                              .disponibilidad[i]["hora_fin"];

                                              
                                        }

                                        setState(() {
                                          
                                        });

                                      }
                                    
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
                                              snapshot.data[index].inputId
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              'NOMBRE',
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              snapshot.data[index].inputNomen,
                                              maxLines: 3,
                                              style: TextStyle(
                                                  color: Colors.grey.shade600,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              'ESTADO',
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              snapshot.data[index].estado == 1
                                                  ? 'ACTIVO'
                                                  : 'INACTIVO',
                                              maxLines: 3,
                                              style: TextStyle(
                                                  color: Colors.grey.shade600,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'CenturyGothic'),
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
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100.0, vertical: 5.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DrawerAdminItem()));
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
