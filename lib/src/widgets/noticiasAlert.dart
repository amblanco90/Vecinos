import 'package:flutter/material.dart';

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



