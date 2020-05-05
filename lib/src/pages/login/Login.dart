import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/http/api-service.dart';
import 'package:edificion247/src/pages/login/afterLogin.dart';

import 'package:edificion247/src/http/datos-login.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

String pais = ' ';


class _LoginPageState extends State<LoginPage> {
   bool _colocar=false;
  bool _obscureText = true;
 

  ProgressDialog pr;

  String _password;
  bool check = false;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final userController = TextEditingController();
  final passwordController = TextEditingController();
  String email;
  String contrasena;
  

  @override
  Widget build(BuildContext context) {
    _obtenerdatos();
    pr = new ProgressDialog(context);
    
    pr.style(
        message: 'Cargando...',
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
    final size = MediaQuery.of(context).size;
    //recuperarDatos();
    //userController.text=email;
    //passwordController.text=contrasena;
    final logo = Container(
      height: size.height * 0.4,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 65.0,
        child: Image.asset('recursos/imagenes/logoApp.png'),
      ),
    );

    final user = TextFormField(
      controller: userController,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
        hintText: 'USUARIO',
        hintStyle: TextStyle(
            letterSpacing: 1.5,
            fontSize: 17.0,
            color: Colors.white54,
            fontFamily: 'CenturyGothic',
            fontWeight: FontWeight.bold),
        focusColor: Colors.white,
        enabledBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white, width: 3.0, style: BorderStyle.solid),
        ),
        focusedBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white, width: 3.0, style: BorderStyle.solid),
        ),
        border: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white, width: 3.0, style: BorderStyle.none),
        ),
      ),
    );

    final password = TextFormField(
      controller: passwordController,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      autofocus: false,
      obscureText: _obscureText,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
        hintText: 'CONTRASEÑA',
        hoverColor: Colors.white,
        focusColor: Colors.white,
        hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 17.0,
            color: Colors.white54,
            fontFamily: 'CenturyGothic'),
        enabledBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white, width: 3.0, style: BorderStyle.solid),
        ),
        focusedBorder: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white, width: 3.0, style: BorderStyle.solid),
        ),
        suffix:Padding(
          padding: const EdgeInsets.all(0.0),
          child: GestureDetector(
                    
                    onTap: (){
                      _toggle();
                    },
                    child: Icon(

                    Icons.remove_red_eye,
                    color: Colors.white,
                  ),
          ),
        ) ,
        
              
        border: new UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white, width: 3.0, style: BorderStyle.none),
        ),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        padding: EdgeInsets.all(8.0),
        textColor: Colors.orange.shade800,
        color: Colors.white,
        child: Text(
          "INGRESAR",
          style: TextStyle(
              letterSpacing: 3.0,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'CenturyGothic'),
        ),
        onPressed: () {
          appData.unidades= [];
          ApiService apiService = new ApiService();
          DatosLogin datos = new DatosLogin(
              username: userController.text, password: passwordController.text);

          apiService.login(datos, pr, context,userController.text,passwordController.text,check).then((onValue) {
            if (userController.text.isEmpty ||
                passwordController.text.isEmpty) {
              (context);
            } else if (userController.text.isEmpty &&
                passwordController.text.isEmpty) {
              ValidacionLoginAlert(context);
            } else if (onValue == false) {
              ErrorLoginAlert(context);
            }
          });
        },
      ),
    );

    final forgotLabel = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        
        Text(
          'RECUPERAR  CONTRASEÑA',

          textAlign: TextAlign.end,
          style: TextStyle(color: Colors.white, 
          fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,
          letterSpacing: 1.2),
        ),
      ],
    );

    final containerRecordar = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Checkbox(
          activeColor: Colors.white,
          checkColor: Colors.orange.shade800,
          onChanged: (bool value) {
            setState(() {
              check = value;
            });
          },
          value: check,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'RECORDARME',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14.0,
                fontFamily: 'CenturyGothic'),
          ),
        )
      ],
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                //Color.fromRGBO(205, 105, 55,1.0),
                Color.fromRGBO(168, 86, 0, 1.0),
                Color.fromRGBO(211, 94, 0, 1.0),

                Color.fromRGBO(255, 114, 0, 1.0),

                Color.fromRGBO(255, 135, 5, 1.0),
              ])),
          child: Column(
            children: <Widget>[
              Expanded(
                              child: Center(
                    child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 24.0, right: 24.0),
                  children: <Widget>[
                    Text(
                      pais,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    logo,
                    user,
                    SizedBox(height:25.0),
                    password,
                    SizedBox(height: 5.0,),
                    forgotLabel,
                    containerRecordar,
                    loginButton,
                    SizedBox(
                      height: 20.0,
                    ),
                   
                  ],
                )),
              ),
               Image.asset('recursos/imagenes/LogoEmpresa.png'),
            ],
          ),
        ));
  }
  _obtenerdatos() async {
    final prefs = await SharedPreferences.getInstance();
    final usuario = prefs.getString('usuario') ?? "";
    final password = prefs.getString('password') ?? "";
    if(_colocar==false){
      setState(() {
        userController.text=usuario.toString();
      passwordController.text=password.toString();
      check=true;
      });

      _colocar=true;
    }
  }
}
/* guardarDatos(String email,String password) async {
     final prefs = await SharedPreferences.getInstance();
     prefs.setString('email', email);
     prefs.setString('password', password);
   }
    recuperarDatos()  async{
     final prefs = await  SharedPreferences.getInstance();
       email=prefs.getString('email')?? '';
       contrasena=prefs.getString('password') ?? '';
   }
   
*/

/*_obtenerUbicacion() async {
  try{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
          pais=placemark[0].country;
    });
  }on PlatformException catch (e) {
  if (e.code == 'PERMISSION_DENIED') {
      print('Permission denied');
  } 
}*/