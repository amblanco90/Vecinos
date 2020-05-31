import 'package:edificion247/src/providers/emergenciaProvider.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

noticiaAlert(BuildContext context,texto,titulo,fecha) {
  
  

  return showDialog(
    context: context,
    builder: (context) {
     
      
      // add StatefulBuilder to return value

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            backgroundColor: Colors.transparent,
            content: SingleChildScrollView(
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
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(fecha, style :TextStyle(
                                            fontSize: 13.0,
                                            
                                            color: Colors.grey.shade700,
                                            fontFamily: 'CenturyGothic',
                                            fontWeight: FontWeight.bold,
                                          )),
                      ],
                    ),
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
                        Text(titulo, maxLines: null,

                        style :TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.orange,
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
                                child: Text(
                                  texto,
                                  style:TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.grey.shade700,
                                            fontFamily: 'CenturyGothic',
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                  
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
                  SizedBox(
                        height: 8.0, 
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



emergenciaAlert(BuildContext context,texto,titulo,fecha,id,estado,funcion) {

  final emergenciaProvider = EmergenciaProvider();

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

  var estadoString;

  if(estado==0){
    estadoString="CANCELADA";
  }
  if(estado==30){
    estadoString="ENVIADA CON EXITO";
  }
  if(estado ==31){
    estadoString="NO ENVIADA";
  }

  

  return showDialog(
    context: context,
    builder: (context) {
     
      
      // add StatefulBuilder to return value

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            backgroundColor: Colors.transparent,
            content: SingleChildScrollView(
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
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(fecha, style :TextStyle(
                                            fontSize: 13.0,
                                            
                                            color: Colors.grey.shade700,
                                            fontFamily: 'CenturyGothic',
                                            fontWeight: FontWeight.bold,
                                          )),
                      ],
                    ),
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
                        Text(titulo, maxLines: null,

                        style :TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.orange,
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
                                child: Text(
                                  texto,
                                  style:TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.grey.shade700,
                                            fontFamily: 'CenturyGothic',
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                  
                                  maxLines: null,
                                )),

                               
                 

                                
                          ],
                        ),
                      ),
                    ),
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
                        Text(estadoString!=null?estadoString:"", maxLines: null,

                        style :TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.orange,
                                            fontFamily: 'CenturyGothic',
                                            fontWeight: FontWeight.bold,
                                            
                                          )),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                  ),

                  SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                        height: 8.0, 
                      ),
                  SizedBox(
                    height: 20.0,
                  ),

                   FlatButton(
      color: Colors.grey.shade300,
      onPressed: () {

        pr.show();

        emergenciaProvider.cancelarEmergencia(context, texto, id).then((val){
          pr.hide();
          Navigator.pop(context);
          GenericAlert(context, val["msj"],null);
          funcion();
          
          

        });
        
       
      },
      child: Center(
        child: Text(
          'CANCELAR ALERTA',
          style: TextStyle(
              color: Color.fromRGBO(255, 114, 0, 1.0),
              fontFamily: 'CenturyGothic',
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
      ),
    ),
                ]),
              ),
            ),
          );
        },
      );
    },
  );


}

notificacionAlert(BuildContext context,texto,titulo,fecha,id,funcion) {

  return showDialog(
    context: context,
    builder: (context) {
     
      
      // add StatefulBuilder to return value

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            backgroundColor: Colors.transparent,
            content: SingleChildScrollView(
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
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(fecha, style :TextStyle(
                                            fontSize: 13.0,
                                            
                                            color: Colors.grey.shade700,
                                            fontFamily: 'CenturyGothic',
                                            fontWeight: FontWeight.bold,
                                          )),
                      ],
                    ),
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
                        Text(titulo, maxLines: null,

                        style :TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.orange,
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
                                child: Text(
                                  texto,
                                  style:TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.grey.shade700,
                                            fontFamily: 'CenturyGothic',
                                            fontWeight: FontWeight.bold,
                                            
                                          ),
                                  
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

                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        NuevoMensaje(context, id,funcion);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 20.0),
                        padding: EdgeInsets.symmetric(vertical: 7.0),
                        child: Center(
                          child: Text(
                            'RESPONDER',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 153, 29, 1.0),
                                fontFamily: 'CenturyGothic',
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(2.0)),
                      )),
                  SizedBox(
                        height: 8.0, 
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

