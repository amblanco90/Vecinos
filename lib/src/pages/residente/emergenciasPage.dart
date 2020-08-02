import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/pedidoTaxi.dart';
import 'package:edificion247/src/pages/admin/drawer_admin.dart';

import 'package:edificion247/src/providers/casilleroProvider.dart';
import 'package:edificion247/src/widgets/noticiasAlert.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

class EmergenciasPage extends StatefulWidget {
 

  @override
  _EmergenciasPageState createState() => _EmergenciasPageState();
}

class _EmergenciasPageState extends State<EmergenciasPage> {
  @override
  Widget build(BuildContext context) {


    funcion(){
      setState(() {
        
      });
    }

    final emergenciaProvider = CasilleroProvider();

    return ListView(

      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'EMERGENCIAS',
              style: TextStyle(
                color: Color.fromRGBO(255, 114, 0, 1.0),
                fontFamily: 'CenturyGothic',
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
        ConstrainedBox(
          constraints: new BoxConstraints(
            maxHeight: 250.0,
          ),
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Scrollbar(
              child: FutureBuilder(
                future: emergenciaProvider.getAllEmergencias() ,
                builder: (BuildContext context,
                    AsyncSnapshot<List<PedidoTaxi>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done)
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return cardMensajes(
                            snapshot.data[index].descripcion,
                            snapshot.data[index].fechaCreacion,
                            '',
                            snapshot.data[index].idCasillero.isEven
                                ? Colors.red.shade100
                                : Colors.grey.shade300,
                            snapshot.data[index].estado,
                            context,
                            snapshot.data[index].idCasillero,funcion);
                      },
                    );
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

        SizedBox(height: 20.0),
        _botonPrincipal(context),
        SizedBox(height: 10.0),
      ],

    );

   



  }

_botonPrincipal(context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
    child: FlatButton(
      color: Colors.grey.shade300,
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => appData.rol == 'Residente'
                    ? DrawerItem()
                    : DrawerAdminItem()));
      },
      child: Center(
        child: Text(
          'PRINCIPAL',
          style: TextStyle(
              color: Color.fromRGBO(255, 114, 0, 1.0),
              fontFamily: 'CenturyGothic',
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
      ),
    ),
  );
}

Widget cardMensajes(
    texto, fecha, hora, color, estado, BuildContext context, id,funcion) {
  return GestureDetector(
    onTap:(){
      emergenciaAlert(context, texto, 'DETALLES', fecha,id,estado,funcion);
    },
      child: Card(
    color: color,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 160.0,
            child: Text(
              texto,
              maxLines: null,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  
                  color: Colors.grey.shade700,
                  fontFamily: 'CenturyGothic',
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    '(LEER)',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 114, 0, 1.0),
                        fontFamily: 'CenturyGothic',
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0),
                  ),
                  onTap: () {
                  emergenciaAlert(context, texto, 'DETALLES', fecha,id,estado,funcion);
                  },
                ),
                SizedBox(width: 30),
                Text(
                  fecha,
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0),
                ),
                Text(
                  hora,
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
}