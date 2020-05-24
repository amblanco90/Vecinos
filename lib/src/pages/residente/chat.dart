import 'package:edificion247/src/helpers/message.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class ChatPages extends StatefulWidget {

  @override
  _ChatPagesState createState() => _ChatPagesState();
}

class _ChatPagesState extends State<ChatPages> {

  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(children: <Widget>[
              Divider(
                height: 30,
                color: Colors.white,
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(25, 5, 5, 5),
                  child: Row(children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),),
                    Text("CON QUIEN",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromRGBO(255, 153, 29, 1.0),
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold)),
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),),
                    Text("DESEA HABLAR",
                        style: TextStyle(
                            fontSize: 18.0,
                            color:Color.fromRGBO(167, 164, 164, 1),
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold)),
                  ])),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  height: 10.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color:  Color.fromRGBO(255, 153, 29, 1.0),
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              Divider(
                height: 20,
                color: Colors.white,
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _containerIcono(Icons.people, 'JUNTA DIRECTIVA', 15),
                  SizedBox(
                    width: 10.0,
                  ),
                  _containerIcono(Icons.security, 'VIGILANTE', 16),
                  SizedBox(
                    width: 10.0,
                  ),
                  _containerIcono(Icons.person, 'ADMINISTRADOR', 17),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 3.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color:Color.fromRGBO(167, 164, 164, 1),
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              Divider(
                height: 10,
                color: Colors.white,
              ),
              Divider(
                height: 40,
                color: Colors.white,
              ),
              _botonPrincipal()
            ])
          ],
        ),
      );
  }

 _botonPrincipal() {
    return GestureDetector(
      onTap: () {
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DrawerItem() ));
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 80.0),
          padding: EdgeInsets.symmetric(vertical: 7.0),
          child: RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5),
            ),
            onPressed: () {
            },
            child: const Text('PRINCIPAL',
                style: TextStyle(
                    fontSize: 24.0,
                    color: Color.fromRGBO(255, 153, 29, 1.0),
                    fontFamily: 'CenturyGothic',
                    fontWeight: FontWeight.bold)),
          )),
    );
  }
  _containerIcono(IconData iconData, leyenda, int posicion) {
    return GestureDetector(
      onTap: () {
        
      
      },
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 85.0,
            height: 85.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(255, 114, 0, 1.0),
                style: BorderStyle.solid,
                width: 4.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(
              iconData,
              size: 70.0,
              color: Colors.grey.shade800,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            leyenda,
            style: TextStyle(
                fontFamily: 'CenturyGothic',
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}