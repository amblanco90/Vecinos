import 'package:edificion247/src/models/cartelera.dart';
import 'package:edificion247/src/models/noticia.dart';
import 'package:edificion247/src/models/pqr.dart';
import 'package:edificion247/src/pages/admin/drawer_admin.dart';
import 'package:edificion247/src/providers/noticiasProvider.dart';
import 'package:edificion247/src/providers/pqrProvider.dart';
import 'package:edificion247/src/widgets/estadoPqrAdmin.dart';
import 'package:edificion247/src/widgets/generarNoticia.dart';
import 'package:edificion247/src/widgets/generarPqrAlert.dart';
import 'package:edificion247/src/widgets/verNoticia.dart';
import 'package:flutter/material.dart';


class CrearNoticiasPage extends StatefulWidget {
  CrearNoticiasPage({Key key}) : super(key: key);

  @override
  _CrearNoticiasPageState createState() => _CrearNoticiasPageState();
}

class _CrearNoticiasPageState extends State<CrearNoticiasPage> {
  final descripcionController = TextEditingController();
   final pqrProvider = NoticiasProvider();
  final tController = TextEditingController();

  bool _isVisible = true;

  void refresh() {
    setState(() {});
  }

  Widget cardMensajes(
      id, titulo, fechaCreacion, descripcion, imagen ,BuildContext context,color) {
    var estadoString;

    

    return GestureDetector(
        onTap: () {
          verNoticia(context, titulo, descripcion, imagen, fechaCreacion, id,refresh);
        },
        child: Card(
          color: color,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
            child: Row(
              children: <Widget>[
                Container(
                    height: 15.0,
                    width: 120.0,
                    child: Text(
                      titulo,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontFamily: 'CenturyGothic',
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0),
                    )),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '(LEER)' ,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 114, 0, 1.0),
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        fechaCreacion,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0),
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'NOTICIAS',
                  style: TextStyle(
                      color: Colors.orange.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      fontFamily: 'CenturyGothic'),
                ),
               
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: 7.0,
                width: 305.0,
                decoration: BoxDecoration(
                    color: Colors.orange.shade600,
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () {
                
                generarNoticia(context, refresh);
                //_dialogCall(context);
              },
              child: Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.orange,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  'NUEVA NOTICIA',
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      fontFamily: 'CenturyGothic'),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HISTORIAL',
                  style: TextStyle(
                      color: Colors.orange.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      fontFamily: 'CenturyGothic'),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: 4.0,
                width: 305.0,
                decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 35.0,
                maxHeight: 250.0,
              ),
              child: Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                child: Scrollbar(
                  child: FutureBuilder(
                    future: pqrProvider.getAllNoticiasAdmin(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Cartelera>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done)
                        
                        return snapshot.data != null
                            ? ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                 
                                  return cardMensajes(
                                      snapshot.data[index].idCartelera,
                                      snapshot.data[index].titulo,
                                       snapshot.data[index].fechaCreacion,
                                       snapshot.data[index].descripcion,
                                       snapshot.data[index].imagen,
                                       context,
                                      snapshot.data[index].idCartelera.isEven
                                          ? Colors.red.shade100
                                          : Colors.grey.shade300,
                                      );
                                },
                              )
                            : Center(child:Text("No hay noticias creadas."));
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: 4.0,
                width: 305.0,
                decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DrawerAdminItem()));
                },
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
                  padding: EdgeInsets.symmetric(vertical: 7.0),
                  child: Center(
                    child: Text(
                      'PRINCIPAL',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 153, 29, 1.0),
                          fontFamily: 'CenturyGothic',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5.0)),
                ))
          ],
        ),
      ),
    );
  }
}