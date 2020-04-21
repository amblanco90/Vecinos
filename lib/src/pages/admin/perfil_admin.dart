import 'dart:convert';
import 'dart:io';

import 'package:edificion247/my_flutter_app_icons.dart';
import 'package:edificion247/src/bloc/perfil_admin_bloc.dart';
import 'package:edificion247/src/bloc/provider_perfil.dart';
import 'package:edificion247/src/bloc/provider_perfil_admin.dart';
import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/models/perfilResidente.dart';
import 'package:edificion247/src/pages/admin/drawer_admin.dart';
import 'package:edificion247/src/pages/residente/misvisitas.dart';
import 'package:edificion247/src/providers/perfilProvider.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';

class MiPerfilAdminPages extends StatefulWidget {

  @override
  _MiPerfilAdminPagesState createState() => _MiPerfilAdminPagesState();
}

class _MiPerfilAdminPagesState extends State<MiPerfilAdminPages> {
 final nombre = TextEditingController();
  final apellido = TextEditingController();
  final telefono = TextEditingController();
  final email = TextEditingController();
  final direccion = TextEditingController();
  final perfilProvider = PerfilProvider();
  var color = Colors.transparent;
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 2.0,
                    ),
                    botonEditEliminar('EDITAR', 1),
                    SizedBox(
                      height: 2.0,
                    ),
                    botonEditEliminar('GUARDAR', 0),
                  ],
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: perfilProvider.getPerfilResidente(),   
            builder: (BuildContext context,
                AsyncSnapshot<PerfilResidente> snapshot) {
              print(snapshot);
              if (snapshot.connectionState == ConnectionState.done) {
                appData.estado = snapshot.data.estado;
                appData.cedula = snapshot.data.inputCed;
                nombre.text = snapshot.data.inputName;
                apellido.text = snapshot.data.inputApe;
                email.text = snapshot.data.inputEmail;
                telefono.text = snapshot.data.inputTel;
                direccion.text = snapshot.data.inputDir;
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: fotoUsuario(),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      infoText(nombre,'Nombre'),
                      SizedBox(
                        height: 5.0,
                      ),
                      infoText(apellido,'Apellido'),
                      SizedBox(
                        height: 5.0,
                      ),
                      infoText(telefono,'Telefono'),
                      SizedBox(
                        height: 5.0,
                      ),
                      infoText(email, 'Email'),
                      SizedBox(
                        height: 5.0,
                      ),
                      infoText(direccion,'Direccion'),
                      SizedBox(
                        height: 10.0,
                      ),

                      Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 7.0,width: 310.0 , decoration: BoxDecoration( color: Color.fromRGBO(255, 114, 0, 1.0), borderRadius: BorderRadius.circular(5.0)),),
        ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             
             children: <Widget>[
               _containerIcono('recursos/imagenes/trespersonasicon.jpg', 'UNIDADES'),
               SizedBox(width: 10.0,),
               _containerIcono('recursos/imagenes/facturaicon.png', 'FACTURAS'),
               SizedBox(width: 10.0,),
               _containerIcono('recursos/imagenes/iconreserva.png','RESERVAS'),
                
             ],),
             
             Padding(
          padding: const EdgeInsets.symmetric(horizontal:30.0,vertical: 10.0),
          child: Container(height: 7.0,width: 320.0 , decoration: BoxDecoration( color: Color.fromRGBO(255, 114, 0, 1.0), borderRadius: BorderRadius.circular(5.0)),),
        ),
             SizedBox(height:10.0),
            
             
                      botonPrincipal(context)
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.orange),
                  )),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _fotoUsuario() {
    return Container(
      width: 150,
      height: 150,
      child: CircleAvatar(
        backgroundColor: Color.fromRGBO(255, 114, 0, 0.2),
        foregroundColor: Color.fromRGBO(255, 114, 0, 1.0),
        child: CircleAvatar(
            radius: 68.0,
            backgroundColor: Color.fromRGBO(255, 114, 0, 1.0),
            child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Container(
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage(
                                  "recursos/imagenes/profile.png")))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.add_photo_alternate,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ])),
      ),
    );
  }

  containerIcono(IconData iconData, leyenda) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: 100.0,
          height: 100.0,
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
            size: 95.0,
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
    );
  }

  botonEditEliminar(texto, n) {
    pr = new ProgressDialog(context);
    pr.style(
        message: 'Guardando cambios...',
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

    return GestureDetector(
        onTap: () {
          if (n == 1) {
          } else {
            if (nombre.text.isEmpty ||
                apellido.text.isEmpty ||
                telefono.text.isEmpty ||
                email.text.isEmpty ||
                direccion.text.isEmpty) {
              ValidacionLoginAlert(context);
            } else {
              pr.show();
              perfilProvider
                  .editarPerfilResidente(nombre.text, apellido.text,
                      direccion.text, telefono.text, email.text) 
                  .then((value) {
                pr.dismiss();
                EdicionCompleta(context);
              });
            }
          }
        },
        child: Text(
          texto,
          style: TextStyle(
              color: Color.fromRGBO(255, 114, 0, 1.0),
              fontFamily: 'CenturyGothic',
              fontWeight: FontWeight.bold,
              fontSize: 17.0),
          textAlign: TextAlign.right,
        ));
  }

  botonPrincipal(context){
   return GestureDetector(
       onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DrawerAdminItem() ));
       }, 
       child: Container(
       margin: EdgeInsets.symmetric(horizontal: 80.0 ),
       padding: EdgeInsets.symmetric(vertical: 7.0),
       child: Center(child: Text('PRINCIPAL', style: TextStyle(color:Color.fromRGBO(255, 153, 29, 1.0), fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 20.0),),),
       decoration: BoxDecoration(  borderRadius: BorderRadius.circular(5.0)),
     ),
   );

 }

  Widget infoText(controller,nombre) {
    return Container(
      color: color,
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: TextField(
        
          textAlign: TextAlign.center,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '',
          ),
          style: TextStyle(
            color: Colors.grey.shade700,
            fontFamily: 'CenturyGothic',
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            
          ),
        ),
      ),
    );
  }

  _containerIcono( iconData, leyenda){

   return GestureDetector(child: Column(
     children: <Widget>[
       SizedBox(height: 10.0,),
       Container( 
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(255, 114, 0, 1.0), style: BorderStyle.solid, width: 4.0, ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(iconData),
                  padding: EdgeInsets.all(5.0),
                 
                ),
                SizedBox(height:5.0),
                Text(leyenda, style: TextStyle(fontFamily: 'CenturyGothic', fontSize:16.0, fontWeight: FontWeight.bold),),
     ],
   ),
   );

 }

 


}

class fotoUsuario extends StatefulWidget {
  fotoUsuario({Key key}) : super(key: key);

  @override
  _fotoUsuarioState createState() => _fotoUsuarioState();
}

class _fotoUsuarioState extends State<fotoUsuario> {
  File _image;

  
  var imagenMostrada = appData.fotoPerfil!=null?Image.memory(appData.fotoPerfil).image:AssetImage(
                                      "recursos/imagenes/profile.png");

  Future getImageFromCam() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
   
    setState(() {
      _image = image;
      List<int> imageBytes = image.readAsBytesSync();
      print(imageBytes);
      String base64Image = base64.encode(imageBytes);
      appData.encodedFotoPerfil = base64Image;
      imagenMostrada = Image.file(_image).image; 
      
        
      
     
    });
  }

  Future getImageFromGallery() async {  
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      List<int> imageBytes = image.readAsBytesSync();
      print(imageBytes);
      String base64Image = base64.encode(imageBytes);
      appData.encodedFotoPerfil = base64Image; 
      imagenMostrada = Image.file(_image).image;
      print(base64Image); 
    });
  }

  bool _isVisible = true;
  

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: CircleAvatar(
        backgroundColor: Color.fromRGBO(255, 114, 0, 0.2),
        foregroundColor: Color.fromRGBO(255, 114, 0, 1.0),
        child: CircleAvatar(
            radius: 68.0,
            backgroundColor: Color.fromRGBO(255, 114, 0, 1.0),
            child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage( 
                              image: imagenMostrada,
                              fit: BoxFit.fill,
                            ), 
                          ),
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          getImageFromCam();
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          getImageFromGallery();
                        },
                        icon: Icon(
                          Icons.add_photo_alternate,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ])),
      ),
    );
  }
}