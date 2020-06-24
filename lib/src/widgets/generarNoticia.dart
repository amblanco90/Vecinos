import 'dart:io';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/providers/noticiasProvider.dart';
import 'package:edificion247/src/providers/pqrProvider.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:edificion247/src/widgets/dropdown_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
generarNoticia(BuildContext context, funcion) {
  final pqrProvider = NoticiasProvider();
  ProgressDialog pr;
  String _selectedDate = DateTime.now().year.toString()+"-"+ DateTime.now().month.toString()+
  "-"+ DateTime.now().day.toString();
  final DateTime now = DateTime.now();
  String fecha_seleccionada = DateTime.now().year.toString()+"-"+ DateTime.now().month.toString()+
  "-"+ DateTime.now().day.toString();
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

   Future<dynamic> _selectDate(BuildContext context, ) async {

      
    final b = showDatePicker(
      
      context: context,
     initialDate: DateTime.now(),
  firstDate: DateTime.now().subtract(Duration(days: 1)),
  lastDate: DateTime(2100),
      locale: Locale('es','ES')
      
 
    );
    
    final DateTime d = await b;
    int mes = int.parse(DateFormat('M').format(now));
    int dia = int.parse(DateFormat('dd').format(now));
    if (d != null)
    if (d.month == mes || d.month == mes+1 || d.month == mes+2){
       
      if(d.month>=10){
      _selectedDate =d.year.toString()+'-'+ d.month.toString()+ '-' + d.day.toString();
      }else{
        fecha_seleccionada =  d.year.toString()+'-0'+ d.month.toString()+ '-'+ d.day.toString();
      }
    }
       
      
         fecha_seleccionada=fecha_seleccionada;
          _selectedDate=fecha_seleccionada;
      
        
      
  }



  

 
  return showDialog(
    context: context,
    builder: (context) {
      final observaciones = TextEditingController();
      final titulo = TextEditingController();
      File _image;
      
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
                        onTap: (){
                          
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
                      Text(' CREAR NOTICIA ',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  SizedBox(height:10.0),
                   Container(
                                width: 250.0,
                                height: 50.0,
                                padding: EdgeInsets.all(10.0),
                                color: Colors.grey.shade200,
                                child: TextField(
                                  controller: titulo,
                                  cursorColor: Colors.orange,
                                  decoration: InputDecoration.collapsed(
                                      hintText: 'TITULO',
                                      hintStyle: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.grey.shade700,
                                        fontFamily: 'CenturyGothic',
                                        fontWeight: FontWeight.bold,
                                      )),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                )),

                                SizedBox(height: 20.0,),
                            
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
                                      hintText: 'ESCRIBA SU NOTICIA AQUÍ',
                                      hintStyle: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.grey.shade700,
                                        fontFamily: 'CenturyGothic',
                                        fontWeight: FontWeight.bold,
                                      )),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                )),
                                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                     
                    ],
                  ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         Text(
                                    'VENCIMIENTO',
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontFamily: 'CenturyGothic',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0),
                                  ),
                        Expanded(
                          child: Container()
                        ),
                         Builder(
                          builder: (context) => InkWell(
                          child: Text(
                              _selectedDate,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                          
                          
                            _selectDate(context ).whenComplete((){
                              setState((){});
                            });
                            setState((){});
                          },
                        ),
                      ),
                      Builder(
                          builder: (context) =>IconButton(
                          icon: Icon(Icons.calendar_today),
                          tooltip: 'Tap to open date picker',
                          onPressed: () {
                           
                             _selectDate(context ).whenComplete((){
                              setState((){});
                            });
                            setState((){});
                            
                          },
                        ),
                      ),

                        ],
                    ),
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
                                          source: ImageSource.gallery);
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
                          if (observaciones.text.isEmpty||titulo.text.isEmpty) {
                            ValidacionLoginAlert(context);
                           
                          } else {
                            pr.show();
                            pqrProvider
                                .generarNoticia(context, titulo.text, observaciones.text, _selectedDate, _image)
                                .then((val) {
                              setState(() {
                                _image = null;
                                titulo.clear();
                                observaciones.clear();
                                pr.dismiss();
                                
                                GenericAlert(context, "Noticia generada exitosamente",
                                 "Administrador");
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

