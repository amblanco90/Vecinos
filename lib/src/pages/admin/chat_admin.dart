import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:flutter/material.dart';

class ChatPageAdmin extends StatefulWidget {

  @override
  _ChatPageAdminState createState() => _ChatPageAdminState();
}

class _ChatPageAdminState extends State<ChatPageAdmin> {
   final Firestore _firestore = Firestore.instance;
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
                  child:
                    Text("CHAT ADMINISTRADOR",
                        style: TextStyle(
                            fontSize: 23.0,
                            color: Color.fromRGBO(255, 153, 29, 1.0),
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold)),
                
                  ),
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
              Container(  
                width: 400,
                height: 400,
  child: StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('useredificio'+appData.idUnidad.toString()).snapshots(),
    builder: (context, snapshot) {

      if (!snapshot.hasData) {
        return Center(
                      child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.orange),
                  ));
      } else {
      List<Widget> itemchat =  snapshot.data.documents.map((f) {
        return _cardMensajes(f.documentID , f.data['nombre'] , f.data['texto']);
}).toList();
        return ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            ...itemchat,
          ],
          );
      }
    },
  ),
),
             

              
         
            
           
             
            ])
          ],
        ),
      );
  }
     Widget _cardMensajes( _numeroidentificacion,_nombre,_mensaje){
   

  return  GestureDetector(  
         child: Card(
           child: Container(
             height: 50,
             padding: EdgeInsets.symmetric(horizontal:5.0, vertical: 2.0),
             child: Row(
               children: <Widget>[
                 
                Text(_numeroidentificacion, style: TextStyle(color: Colors.grey.shade700, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),),
                SizedBox(width: 15.0,),
                Text(_nombre, style: TextStyle(color: Colors.grey.shade700, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),),
                SizedBox(width: 15.0,),
                 Text(_mensaje, style: TextStyle(color:Color.fromRGBO(255, 153, 29, 1.0),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 15.0),), 
                Expanded(
                                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

              
                    ],
                  ),
                )
              ],
             ),
           ),
         ), onTap: (){
         
         });

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