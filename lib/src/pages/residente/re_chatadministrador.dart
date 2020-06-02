import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/helpers/message.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';


class ChatAdministradorPages extends StatefulWidget {
  @override
  _ChatAdministradorPagesState createState() => _ChatAdministradorPagesState();
}

class _ChatAdministradorPagesState extends State<ChatAdministradorPages> {
  final Firestore _firestore = Firestore.instance;
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController= ScrollController();

 Future<void> callback() async{
     var documentReference = Firestore.instance.collection('mensagesEdificio'+appData.idUnidad.toString())
        .document(appData.cedula.toString())
        .collection(appData.cedula.toString())
        .document(DateTime.now().millisecondsSinceEpoch.toString());
         var documentReference2 = Firestore.instance.collection('useredificio'+appData.idUnidad.toString())
        .document(appData.cedula.toString());

      String menssage=messageController.text;
    if (messageController.text.length> 0){
       Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
        documentReference2,
        {
         "cedula":appData.cedula.toString(),
        "texto":menssage,
        "nombre":appData.nombre,
        'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
        },
      );
    });
          Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
        documentReference,
        {
         "de":"re"+appData.cedula.toString(),
        "texto":menssage,
        "nombre":appData.nombre,
        "para":"ad"+appData.cedula.toString(),
        'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
        },
      );
    });
    
      messageController.clear();
      scrollController.animateTo(scrollController.position.minScrollExtent, curve: Curves.easeOut,duration: Duration(milliseconds: 300));
      

    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:_firestore.collection('mensagesEdificio'+appData.idUnidad.toString())
      .document(appData.cedula.toString())
      .collection(appData.cedula.toString())
      .orderBy('timestamp', descending: true)
      .limit(20)
      .snapshots(),
              builder: (context,snapshot){
                if (!snapshot.hasData){
                  return Center( 
                    child: CircularProgressIndicator( 
                    ),
                  );
                }else{
                  List<DocumentSnapshot> docs=snapshot.data.documents;
                  List<Widget> mensajes= docs.map((doc) => Mensaje(
                    de: doc.data['de'],
                    text: doc.data['texto'],
                    nombre: doc.data['nombre'],
                    me: "re"+appData.cedula.toString() == doc.data['de'],
                   )).toList();
                  return ListView(
                    reverse: true,
                    controller: scrollController,
                    children: <Widget>[
                     ...mensajes,
                    ],
                  );  
                }
              },
            ) ,
            ),
            Container( 
              child: Row( 
                children: <Widget>[
                  Expanded( 
                    child: TextField( 
                      decoration: InputDecoration( 
                        hintText: "Ingresa nuevo mensaje",
                        border: const OutlineInputBorder(),
                      ),
                      controller: messageController,
                    ),
                  ),
                  FlatButton( 
                    color: Colors.orange,
                    child: Text('Enviar'), 
                    onPressed: callback,
                      
                  )
                ],
              ),
            )
        ],
      ) ,
    );
  }

}

class Mensaje extends StatelessWidget {
  final String de;
  final String text;
  final String nombre;
  final bool me;
  const Mensaje({Key key,this.de,this.text,this.me,this.nombre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container( 
        margin: EdgeInsets.fromLTRB(0, 3.5, 0, 0),
        child:Column(
          crossAxisAlignment: me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              nombre
            ),
            Material( 
              color: me ? Colors.teal : Colors.red,
              borderRadius: BorderRadius.circular(10.0),
              elevation: 6.0,
              child: Container( 
                padding :EdgeInsets.symmetric(horizontal: 10.0,vertical:10.0),
                child: Text( 
                  text
                )
              )
            )
          ],
        )
      ),
    );
  }
}