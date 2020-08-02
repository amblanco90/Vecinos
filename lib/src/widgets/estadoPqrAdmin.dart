import 'dart:convert';
import 'dart:io';
import 'package:edificion247/src/models/respuestaPqr.dart';
import 'package:edificion247/src/providers/pqrProvider.dart';
import 'package:edificion247/src/providers/respuestasResidenteProvider.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:edificion247/src/widgets/cardRespuestaPqr.dart';
import 'package:edificion247/src/widgets/responderPqrAlert.dart';
import 'package:edificion247/src/widgets/respuestaPqrAdminAlert.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';

estadoPqrAdmin(BuildContext context, texto, foto,estado,id,destinatario,tipo) {
  final respuestapqrProvider = RespuestaResidenteProvider();
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
                width: MediaQuery. of(context). size. width, 

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
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(' ESTADO PQR ',
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
                  Container(
                    width: 250.0,
                                height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: Colors.grey.shade200,
                      
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(destinatario!=null?destinatario:'', style :TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.grey.shade700,
                                            fontFamily: 'CenturyGothic',
                                            fontWeight: FontWeight.bold,
                                          )),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                  ),
                  
                 SizedBox(
                    height: 10.0,
                  ),
                  
                   Container(
                    width: 250.0,
                                height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: Colors.grey.shade200,
                      
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(tipo!=null?tipo:'', style :TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.grey.shade700,
                                            fontFamily: 'CenturyGothic',
                                            fontWeight: FontWeight.bold,
                                          )),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                  ),
                  
                  
                  SizedBox(
                    height: 10.0,
                  ),
                  ConstrainedBox(
                  constraints: new BoxConstraints(
                    maxHeight: 80.0,
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
                              child: Text(
                               texto!=null?texto:'',
                                maxLines: null,
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.grey.shade700,
                                      fontFamily: 'CenturyGothic',
                                      fontWeight: FontWeight.bold,
                                    )),
                                
                               
                              )
                        ],
                      ),
                    ),
                  ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ConstrainedBox(
                    constraints: new BoxConstraints(
                      maxHeight: 120.0,
                    ),
                    child: Container(
                      width: 250.0,
                      height: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: Colors.grey.shade200,
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Scrollbar(
                        child: FutureBuilder(
                    future: respuestapqrProvider.getHilo(id,context) ,
                    builder: (BuildContext context, AsyncSnapshot<List<RespuestaPqr>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done)
                        return snapshot.data != null
                            ? ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return cardRespuestaPqr(snapshot.data[index].residente, snapshot.data[index].fechaCreacion, snapshot.data[index].mensaje, snapshot.data[index].foto);
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
                SizedBox(
                        height: 8.0, 
                      ),

               Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 80.0,
                          height: 80.0,
                          color: Colors.grey.shade200,
                          child: foto == null
                              ? Center(
                                  child: Icon(Icons.camera),
                                )
                              : Image.memory(base64.decode(foto)),
                        ),

                        Expanded(child: Container()),
                        
                        
                        Row(
                          children: <Widget>[
                            
                            Text(
                                      'ESTADO: ',
                                      style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontFamily: 'CenturyGothic',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0),
                                    ),

                      Text(
                                      estado!=null?estado:'',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: 'CenturyGothic',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0),
                                    ),


                          ],
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
                         Navigator.pop(context);
                         responderPqrAdmin(context, destinatario, tipo, id, estado);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Center(
                            child: Text(
                              'RESPONDER',
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
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
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



 



