
import 'dart:io';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/providers/pqrProvider.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:edificion247/src/widgets/dropdown_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/material.dart';

gg(BuildContext context, funcion) {
  final pqrProvider = PqrProvider();
  ProgressDialog pr;

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

  return showDialog(
    context: context,
    builder: (context) {
      final observaciones = TextEditingController();
      File _image;
      // add StatefulBuilder to return value

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            backgroundColor: Colors.transparent,
            content: SingleChildScrollView(
              child: Container(
                width: MediaQuery. of(context). size. width - 10, 

                height:MediaQuery. of(context). size.height * 0.8,    
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
                        onTap: (){
                          appData.dirigido_a=1;
                          appData.tipo_pqr=1;
                          Navigator.pop(context);

                          },
                        child: Icon(Icons.close),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(' RADICAR PQR ',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('DIRIGIDO A',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic', 
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  DropDownDestinoPqr(),
                  SizedBox(
                    height: 10.0,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('TIPO PQR',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic', 
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  DropDownZonaPqr(),
                  SizedBox(
                    height: 10.0,
                  ),
                  ConstrainedBox(
                    constraints: new BoxConstraints(
                      maxHeight: 120.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: Colors.grey.shade200,
                      ),
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
                                      hintText: 'DESCRIBA SU PQR',
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
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.attach_file,
                                        color: Colors.grey.shade700,
                                      ),
                                      Text(
                                        'ADJUNTAR FOTO',
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontFamily: 'CenturyGothic',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13.0),
                                      ),
                                    ],
                                  ),
                                  onTap: () async {
                                    final app = observaciones.text;
                                    try {
                                      observaciones.text = app;
                                      _image = await ImagePicker.pickImage(
                                          source: ImageSource.gallery, maxHeight: 250.0, maxWidth: 250.0);
                                      setState(() {});
                                    } catch (_) {
                                      print(_);
                                    }
                                  }),
                            ],
                          ),
                        ),
                        Container(
                          width: 80.0,
                          height: 80.0,
                          color: Colors.grey.shade200,
                          child: _image == null
                              ? Center(
                                  child: Icon(Icons.add),
                                )
                              : Image.file(_image),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          if (observaciones.text.isEmpty) {
                            ValidacionLoginAlert(context);
                            appData.dirigido_a=1;
                            appData.tipo_pqr=1;
                          } else {
                            pr.show();
                            pqrProvider
                                .generarPqr(context, observaciones.text, _image)
                                .then((val) {
                              setState(() {
                                _image = null;
                                appData.dirigido_a=1;
                                appData.tipo_pqr=1;
                                pr.dismiss();
                                Navigator.pop(context);
                                pqrGeneradaAlert(context);
                                funcion();
                                
                              });
                            });
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: Center(
                            child: Text(
                              'RADICAR',
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
                        width: 15.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          appData.dirigido_a=1;
                          appData.tipo_pqr=1;
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: Center(
                            child: Text(
                              'CANCELAR',
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
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ]),
              ),
            ),
          );
        },
      );
    },
  );
}

