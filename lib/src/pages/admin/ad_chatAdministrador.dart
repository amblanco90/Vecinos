import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminChatAdministradorPages extends StatefulWidget {
   final String cedulachatresidente;
  AdminChatAdministradorPages({this.cedulachatresidente,Key key}): super(key: key);

  @override
  _AdminChatAdministradorPagesState createState() => _AdminChatAdministradorPagesState();
}

class _AdminChatAdministradorPagesState extends State<AdminChatAdministradorPages> {
  final Firestore _firestore = Firestore.instance;
  final messageController = TextEditingController();
  ScrollController scrollController= ScrollController();

  Future<void> callback() async{
     var documentReference = Firestore.instance.collection('mensagesEdificio'+appData.idUnidad.toString())
        .document(widget.cedulachatresidente)
        .collection(widget.cedulachatresidente)
        .document(DateTime.now().millisecondsSinceEpoch.toString());
       

      String menssage=messageController.text;
    if (messageController.text.length> 0){
          Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
        documentReference,
        {
         "de":"admin",
        "texto":menssage,
        "nombre":appData.nombre,
        "para":"re"+widget.cedulachatresidente,
        'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
        "uid_admin":appData.cedula.toString()
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
      .document(widget.cedulachatresidente)
      .collection(widget.cedulachatresidente)
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
                    timestamp: doc.data['timestamp'],
                    me: "admin" == doc.data['de'],
                   )).toList();
                  return ListView(
                    controller: scrollController,
                    reverse: true,
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
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: FloatingActionButton(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.send,),
                    onPressed: callback,
                  ),
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
  final int posicion;
  final String timestamp;
  const Mensaje({Key key,this.de,this.text,this.me,this.nombre,this.posicion,this.timestamp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child:Column(
          crossAxisAlignment: me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Material( 
              color: me ? Colors.yellow[500] : Colors.blue[200],
              borderRadius: BorderRadius.circular(10.0),
              elevation: 6.0,
              child: Container( 
                padding :EdgeInsets.symmetric(horizontal: 10.0,vertical:10.0),
                child: Text( 
                  text
                )
              )
            ),
            Container(
                    child: Text(
                      DateFormat('dd MMM kk:mm')
                          .format(DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp))),
                      style: TextStyle(color:  Colors.black, fontSize: 12.0, fontStyle: FontStyle.italic),
                    ),
                    margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
                  ),
            
          ],
        )
      
    );
  }
}