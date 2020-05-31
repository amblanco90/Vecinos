import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/residente.dart';
import 'package:edificion247/src/pages/admin/drawer_admin.dart';
import 'package:edificion247/src/providers/residentesProvider.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:edificion247/src/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ResidentesP extends StatefulWidget {
  @override
  _ResidentesPState createState() => _ResidentesPState();
}

class _ResidentesPState extends State<ResidentesP> {
  final residentesProvider = ResidentesProvider();
  final cedulaController = TextEditingController();
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final direccionController = TextEditingController();
  final telefonoController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pr = new ProgressDialog(context);
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

    final color = TextStyle(color: Colors.white);

    final cedula = TextFormField(
      controller: cedulaController,
      cursorColor: Color.fromRGBO(205, 105, 55, 1.0),
      keyboardType: TextInputType.number,
      autofocus: false,
      maxLines: null,
      onChanged: (string) {},
      decoration: InputDecoration(
        hintText: 'CEDULA',
        hintStyle: TextStyle(fontFamily: 'CenturyGothic'),
        focusColor: Colors.grey.shade700,
        enabledBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700,
              width: 1.0,
              style: BorderStyle.solid),
        ),
        focusedBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700,
              width: 1.0,
              style: BorderStyle.solid),
        ),
        border: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700, width: 1.0, style: BorderStyle.none),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );
    final nombre = TextFormField(
      controller: nombreController,
      cursorColor: Color.fromRGBO(205, 105, 55, 1.0),
      keyboardType: TextInputType.text,
      autofocus: false,
      maxLines: null,
      onChanged: (string) {},
      decoration: InputDecoration(
        hintText: 'NOMBRES',
        hintStyle: TextStyle(fontFamily: 'CenturyGothic'),
        focusColor: Colors.grey.shade700,
        enabledBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700,
              width: 1.0,
              style: BorderStyle.solid),
        ),
        focusedBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700,
              width: 1.0,
              style: BorderStyle.solid),
        ),
        border: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700, width: 1.0, style: BorderStyle.none),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );
    final apellido = TextFormField(
      controller: apellidoController,
      cursorColor: Color.fromRGBO(205, 105, 55, 1.0),
      keyboardType: TextInputType.text,
      autofocus: false,
      maxLines: null,
      onChanged: (string) {},
      decoration: InputDecoration(
        hintText: 'APELLIDOS',
        hintStyle: TextStyle(fontFamily: 'CenturyGothic'),
        focusColor: Colors.grey.shade700,
        enabledBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700,
              width: 1.0,
              style: BorderStyle.solid),
        ),
        focusedBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700,
              width: 1.0,
              style: BorderStyle.solid),
        ),
        border: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700, width: 1.0, style: BorderStyle.none),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );
    final direccion = TextFormField(
      controller: direccionController,
      cursorColor: Color.fromRGBO(205, 105, 55, 1.0),
      keyboardType: TextInputType.text,
      autofocus: false,
      maxLines: null,
      onChanged: (string) {},
      decoration: InputDecoration(
        hintText: 'DIRECCION',
        hintStyle: TextStyle(fontFamily: 'CenturyGothic'),
        focusColor: Colors.grey.shade700,
        enabledBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700,
              width: 1.0,
              style: BorderStyle.solid),
        ),
        focusedBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700,
              width: 1.0,
              style: BorderStyle.solid),
        ),
        border: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700, width: 1.0, style: BorderStyle.none),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );
    final telefono = TextFormField(
      controller: telefonoController,
      cursorColor: Color.fromRGBO(205, 105, 55, 1.0),
      keyboardType: TextInputType.number,
      autofocus: false,
      maxLines: null,
      onChanged: (string) {},
      decoration: InputDecoration(
        hintText: 'TELEFONO',
        hintStyle: TextStyle(fontFamily: 'CenturyGothic'),
        focusColor: Colors.grey.shade700,
        enabledBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700,
              width: 1.0,
              style: BorderStyle.solid),
        ),
        focusedBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700,
              width: 1.0,
              style: BorderStyle.solid),
        ),
        border: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700, width: 1.0, style: BorderStyle.none),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );
    final email = TextFormField(
      controller: emailController,
      cursorColor: Color.fromRGBO(205, 105, 55, 1.0),
      keyboardType: TextInputType.text,
      autofocus: false,
      maxLines: null,
      onChanged: (string) {},
      decoration: InputDecoration(
        hintText: 'EMAIL',
        hintStyle: TextStyle(fontFamily: 'CenturyGothic'),
        focusColor: Colors.grey.shade700,
        enabledBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700,
              width: 1.0,
              style: BorderStyle.solid),
        ),
        focusedBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700,
              width: 1.0,
              style: BorderStyle.solid),
        ),
        border: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade700, width: 1.0, style: BorderStyle.none),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.orange,
                    width: 3,
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
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10.0),
                          cedula,
                          SizedBox(height: 10.0),
                          nombre,
                          SizedBox(height: 10.0),
                          apellido,
                          SizedBox(height: 10.0),
                          telefono,
                          SizedBox(height: 10.0),
                          direccion,
                          SizedBox(height: 10.0),
                          email,
                          EstadoNuevoResidente()
                        ],
                      ),
                    ),
                    Table(
                      children: [
                        TableRow(children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 153, 29, 0.9),
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.00),
                            child: FlatButton(
                              child: Text('CREAR/EDITAR RESIDENTE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'CenturyGothic',
                                      fontSize: 17.0)),
                              onPressed: () {

                                if(cedulaController.text.isEmpty||nombreController.text.isEmpty||
                                apellidoController.text.isEmpty||telefonoController.text.isEmpty||
                                direccionController.text.isEmpty||emailController.text.isEmpty){

                                  ValidacionLoginAlert(context);


                                  
                                }else{
                                  pr.show();
                                residentesProvider.crearResidente(context, cedulaController.text, nombreController.text, apellidoController.text, direccionController.text, 
                                telefonoController.text, emailController.text).then((val){
                                  setState(() {
                                    
                                  });
                                 pr.dismiss();
                                
                                  
                                  appData.idNuevoResidente=null;
                                  appData.estado_nuevo_residente='Activo';
                                  appData.idEstadoNuevoResidente=1;
                                  cedulaController.text='';
                                  nombreController.text='';
                                  apellidoController.text='';
                                  direccionController.text ='';
                                  emailController.text='';
                                  telefonoController.text='';
                                  GenericAlert(context, val["respuesta"],null);
                                  


                                });
                                }

                              },
                            ),
                          )
                        ]),
                        TableRow(children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 153, 29, 0.9),
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.00),
                            child: FlatButton(
                              child: Text('LIMPIAR',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'CenturyGothic',
                                      fontSize: 17.0)),
                              onPressed: () {
                                appData.idNuevoResidente=null;
                                appData.estado_nuevo_residente='Activo';
                                appData.idEstadoNuevoResidente=1;
                                cedulaController.text='';
                                nombreController.text='';
                                apellidoController.text='';
                                direccionController.text ='';
                                emailController.text='';
                                telefonoController.text='';


                              },
                            ),
                          )
                        ])
                      ],
                    )
                  ],
                ),
              ),
            ),
            ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 35.0,
                maxHeight: 335.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.orange,
                    width: 3,
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
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                child: Scrollbar(
                  child: FutureBuilder(
                    future: residentesProvider.getAllResidentes(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Residente>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done)
                        return snapshot.data != null
                            ? ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                      
                                      onTap: (){

                                appData.idNuevoResidente=snapshot.data[index].id;
                                print(snapshot.data[index].id);
                                print(appData.idNuevoResidente);
                                print(snapshot.data[index].estado);
                                if(snapshot.data[index].estado==1){

                                  setState(() {
                                    appData.estado_nuevo_residente='Activo';
                                  });

                                   

                                }else{
                                  setState(() {
                                    appData.estado_nuevo_residente='Inactivo';
                                  });
                                  
                                }
                                appData.idNuevoResidente=snapshot.data[index].id;
                                appData.idEstadoNuevoResidente=snapshot.data[index].estado;
                                print(appData.idEstadoNuevoResidente);
                                cedulaController.text=snapshot.data[index].cedula.toString();
                                nombreController.text=snapshot.data[index].nombres;
                                apellidoController.text=snapshot.data[index].apellidos;
                                direccionController.text =snapshot.data[index].direccion;
                                emailController.text=snapshot.data[index].correo;
                                telefonoController.text=snapshot.data[index].telefono.toString();

                                

                                      },

                                      child: Card(
                                      color: Colors.grey.shade300,
                                      child: Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                             Text(
                                              snapshot.data[index].id.toString(),
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              'CEDULA',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              snapshot.data[index].cedula
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              'NOMBRE',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              snapshot.data[index].nombres,
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              'APELLIDO',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              snapshot.data[index].apellidos,
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              'DIRECCION',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              snapshot.data[index].direccion,
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              'TELEFONO',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              snapshot.data[index].telefono
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              'EMAIL',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              snapshot.data[index].correo,
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                             Text(
                                              'ESTADO',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                            Text(
                                              snapshot.data[index].estado==1?'ACTIVO':'INACTIVO',
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                  fontFamily: 'CenturyGothic'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100.0, vertical: 5.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DrawerAdminItem()));
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  padding: EdgeInsets.symmetric(vertical: 7.0),
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
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
