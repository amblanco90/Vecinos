import 'dart:math';

import 'package:edificion247/src/helpers/appdata.dart';
import 'package:edificion247/src/http/api-service.dart';
import 'package:edificion247/src/http/datos-reserva.dart';
import 'package:edificion247/src/models/visitas_models.dart';
import 'package:edificion247/src/pages/residente/drawer.dart';
import 'package:edificion247/src/providers/reservas_provider.dart';
import 'package:edificion247/src/widgets/calendar_widget.dart';
import 'package:edificion247/src/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';




class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final DateTime now = DateTime.now();
  bool _llamarzona=true;
  String _selectedDate = '2020-06-09';
    String _selectedDateBaseDato = '2020-06-09';
  String _idreserva = " ";
   String _dropdownStrHoraInicio =" ";
   List opcionesInicial=[" "];
   List opcionesFinal=[' '];
    String fecha_Selecionada='2020-06-09';
   String _dropdownStrHoraFinal =" ";
   final _controllerObservaciones=TextEditingController();
   List<dynamic> _listareserva=new List();
   List<dynamic> _listaZonas=new List();
   String _zonaSelecionadad='Piscina';
   int _posicionZona=1;
   final reservaProvider=new ReservasProvider();
   CalendarController _calendarController=CalendarController();
   List<dynamic> _listaocupada=[];
   Map<DateTime, List<dynamic>> _events= {};
   TextEditingController _eventsController=new TextEditingController();
   List<Reserva> todasReserva=new List();
   bool _estadotablecale=true;
   bool _estadoDisponibilidadZonas=true;
   List<Reserva> _datoslistareserva=new List();
 @override
  Widget build(BuildContext context) {
  
  
  if(_estadotablecale){
   _solicitarTodasReserva();
  }
   _solicitarListaZona();
    return SingleChildScrollView(
          child: Column(

        children: <Widget>[
         _calendarTable(),
        

          Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 4.0,width: 350.0 , decoration: BoxDecoration( color: Colors.grey, borderRadius: BorderRadius.circular(5.0)),),
        ),

          
          _reservas(context),

          Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 4.0,width: 350.0 , decoration: BoxDecoration( color: Colors.grey, borderRadius: BorderRadius.circular(5.0)),),
        ),
        SizedBox(height:10.0),
        SizedBox(height:10.0),
        SizedBox(height:10.0),
        botonPrincipal(context),
        SizedBox(height:10.0),
        

        ],
      ),
    );
  }

_solicitarListaZona(){
  if(_llamarzona == true){
ApiService _apiService=new ApiService();
  _apiService.listarZona().then((onValue){
    if(onValue!=null){
      setState(() {
        _llamarzona=false;
        _listaZonas=onValue;
      });
    }
  });
  }
  
}

_solicitarDisponibilidadZonas(String id_zona,String fecha){
  if(_estadoDisponibilidadZonas){
      ApiService _apiService=new ApiService();
      _apiService.getDisponibilidadZona(id_zona, fecha).then((value){
        try{
           if(value == "error"){
             opcionesInicial.clear();
             opcionesInicial.add(" ");
             opcionesFinal.clear();
             opcionesFinal.add(" ");
             _dropdownStrHoraInicio=" ";
             _dropdownStrHoraFinal=" ";
             _estadoDisponibilidadZonas=false;
             setState(() {
               
             });
             _alertReservaMensajes(context, "No hay horarios disponibles para esta fecha");
           }else{
            opcionesInicial.clear();
            opcionesInicial.add(" ");
            opcionesFinal.clear();
            opcionesFinal.add(" ");
            _dropdownStrHoraInicio=" ";
             _dropdownStrHoraFinal=" ";
           for(int i=0;i<value.length;i++){
             opcionesInicial.add(value[i]);
          }
          _estadoDisponibilidadZonas=false;
              setState(() {
                
              });
           }
        }catch(e){
          
        }
       
      });
  }
}

_solicitarTodasReserva(){
  reservaProvider.getreservatodas().then((onValue){
    if(onValue!= null ){
      _listaocupada=new List();
      _events.clear();
      _eventsController.clear();
      for (int i=0;i<onValue.length;i++){
        if (_events[corregir_fecha(onValue[i].fecha_hora_inicio)] != null) {
                      _events[corregir_fecha(onValue[i].fecha_hora_inicio)]
                          .add(onValue[i].nombre_zona +" \n F. inicio  "+onValue[i].fecha_hora_inicio+"    F. fin  "+onValue[i].fecha_hora_fin);
                    } else {
                      _events[corregir_fecha(onValue[i].fecha_hora_inicio)] = [
                        onValue[i].nombre_zona +" \n F. inicio  "+onValue[i].fecha_hora_inicio+"    F. fin  "+onValue[i].fecha_hora_fin
                      ];
                    }
      }
        
    }
  });
}
  Widget _calendario(){

  return  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[ 
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey),
                    left: BorderSide(width: 1.0, color: Colors.grey),
                    right: BorderSide(width: 1.0, color: Colors.grey),
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0.8))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                    data: Theme.of(context).copyWith(
                            
                            primaryColor: Colors.orange,
                            splashColor: Colors.orange,
                            accentColor: Colors.orange,
                            buttonColor: Colors.orange,
                            backgroundColor: Colors.orange,
                            buttonTheme: ButtonThemeData(
                          
                          buttonColor: Colors.orange,
                          

                        
                           //color of the text in the button "OK/CANCEL"
                        ),
                            
                          ),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Builder(
                          builder: (context) => InkWell(
                          child: Text(
                              _selectedDate,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            _selectDate(context);
                          },
                        ),
                      ),
                      Builder(
                          builder: (context) =>IconButton(
                          icon: Icon(Icons.calendar_today),
                          tooltip: 'Tap to open date picker',
                          onPressed: () {
                            _selectDate(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
}
 Future<void> _selectDate(BuildContext context) async {

      
    final b = showDatePicker(
      
      context: context,
     initialDate: DateTime.now(),
  firstDate: DateTime.now().subtract(Duration(days: 1)),
  lastDate: DateTime(2100),
      locale: Locale('es','ES')
      
 
    );
    
    final DateTime d = await b;
    int mes = int.parse(DateFormat('M').format(now));
    int dia = int.parse(DateFormat('dd').format(now));
    if (d != null)
    if (d.month == mes || d.month == mes+1 || d.month == mes+2){
       
      if(d.month>=10){
      _selectedDate =d.year.toString()+'-'+ d.month.toString()+ '-' + d.day.toString();
      }else{
        fecha_Selecionada =  d.year.toString()+'-0'+ d.month.toString()+ '-'+ d.day.toString();
      }
    }else{
      _alertReservaMensajes(context, 'No se puede elegir a mas de 3 meses');
    }
       appData.fecha_inicial_reserva = fecha_Selecionada;
        setState(() {
          fecha_Selecionada=fecha_Selecionada;
          _selectedDate=fecha_Selecionada;
        });
        _estadoDisponibilidadZonas=true;
        for(int e=0;e<_listaZonas.length;e++){
                  dynamic _zona=_listaZonas[e];
                  if(_zona['zonaSocial'] == _zonaSelecionadad){
                      _posicionZona=_zona['id'];
                  }
              }
        _solicitarDisponibilidadZonas(_posicionZona.toString(),fecha_Selecionada);
      
  }

  Widget _alertReserva(BuildContext context){  
  return  AlertDialog(
        title:_zonasHabilitadas(),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Row(children: <Widget>[
                Text('Fecha Inicio: ',style: TextStyle(fontFamily: 'CenturyGothic', color:Color.fromRGBO(255, 153, 29, 1.0), fontSize: 18.0,fontWeight: FontWeight.bold )),
                Text(fecha_Selecionada,style: TextStyle(fontFamily: 'CenturyGothic', fontSize: 15.0,fontWeight: FontWeight.bold )),
              ],),
            _calendario(),
            Row(children: <Widget>[
               Text('Hora Inicio: ',style: TextStyle(fontFamily: 'CenturyGothic', color:Color.fromRGBO(255, 153, 29, 1.0), fontSize: 18.0,fontWeight: FontWeight.bold )),
                DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down, color: Colors.orange),
             value: _dropdownStrHoraInicio,
             onChanged: (String newValue){
               setState(() {
                 _dropdownStrHoraInicio = newValue;
                 _dropdownStrHoraFinal=" ";
                 _colocarHoraDisponibles();
               });
                 
             },
  items: opcionesInicial.map(( value) {
    return new DropdownMenuItem<String>(
      value: value,
      child: new Text(value),
    );
  }).toList(),
)
            ],),
             Row(children: <Widget>[
               Text('Hora Final: ',style: TextStyle(fontFamily: 'CenturyGothic', color:Color.fromRGBO(255, 153, 29, 1.0), fontSize: 18.0,fontWeight: FontWeight.bold )),
                DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down, color: Colors.orange),
             value: _dropdownStrHoraFinal,
             onChanged: (String newValue){
               setState(() {
                 _dropdownStrHoraFinal = newValue;
               });
             },
  items: opcionesFinal.map(( value) {
    return new DropdownMenuItem<String>(
      value: value,
      child: new Text(value),
    );
  }).toList(),
)],),
             Text('OBSERVACIONES',style: TextStyle(fontFamily: 'CenturyGothic', color: Color.fromRGBO(255, 153, 29, 1.0), fontSize: 18.0,fontWeight: FontWeight.bold )),
            _camposFormulario3("", _controllerObservaciones, TextInputType.text),
            Divider(height: 20,),
            _botonGuardar()],
          ),
        ),
      );
}

Widget _zonasHabilitadas(){
  return Center(
         child: DropdownButtonHideUnderline(
                    child: DropdownButton(
             icon: Icon(Icons.arrow_drop_down, color: Colors.orange),
             value: _zonaSelecionadad,
             onChanged: (String newValue){
               setState(() {
                 _zonaSelecionadad = newValue;
               });

             },
              
               items :_listaZonas.map((d){
                 return DropdownMenuItem<String>(
                      
                      value: d['zonaSocial'],
                      child: Text(d['zonaSocial'], style: TextStyle(color:Colors.grey, fontFamily:'CenturyGothic', fontWeight:FontWeight.bold),) ,
                      
                      );
               }).toList()
             
           ),
         ),
       );
}


_botonGuardar(){

   return GestureDetector(
       onTap: (){ 
         
       }, 
       child: Container(
       child: RaisedButton(
                 shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5),),
          onPressed: () {
            
              if(_dropdownStrHoraFinal ==" "){
                _alertReservaMensajes(context,"Tiene que elegir una hora final");
                  return;
              }
              for(int e=0;e<_listaZonas.length;e++){
                  dynamic _zona=_listaZonas[e];
                  if(_zona['zonaSocial'] == _zonaSelecionadad){
                      _posicionZona=_zona['id'];
                  }
              }
              DatosReserva datosReserva;
              if(_idreserva  !=" "){
                   datosReserva=DatosReserva(id_subunidad: appData.idSubunidad.toString(),valor: "5000",id_residente: "10",id_zona_social: _posicionZona.toString(), observaciones: _controllerObservaciones.text,fecha_hora_inicio:fecha_Selecionada+" "+_dropdownStrHoraInicio,fecha_hora_fin:fecha_Selecionada+" "+_dropdownStrHoraFinal,username: appData.cedula.toString(),id_reserva: _idreserva.toString());
              }else{
                 datosReserva=DatosReserva(id_subunidad: appData.idSubunidad.toString(),valor: "5000",id_residente: "10",id_zona_social: _posicionZona.toString(), observaciones: _controllerObservaciones.text,fecha_hora_inicio:fecha_Selecionada+" "+_dropdownStrHoraInicio,fecha_hora_fin:fecha_Selecionada+" "+_dropdownStrHoraFinal,username: appData.cedula.toString(),id_reserva: " ");
              }
              ApiService apiService=ApiService();
              apiService.guardarReserva(datosReserva).then((isSuccess){
                  if(isSuccess == 'ok'){
                    _alertReservaMensajes(context,"Reserva exitosa");
                    _idreserva=" ";
                    _controllerObservaciones.text=" ";
                    _estadotablecale=true;
                    setState(() {
                      
                    });
                   
                  }else{
                    _alertReservaMensajes(context,isSuccess);
                  }
              });
            
          },
          child: const Text(
            'ENVIAR RESERVA',
            style:TextStyle(fontSize: 18.0, color: Color.fromRGBO(255, 153, 29, 1.0),fontFamily: 'CenturyGothic',fontWeight: FontWeight.bold)
          ),
          )
     ),
   );

 }

 Widget _alertReservaMensajes (BuildContext context,String mensaje){

   showDialog(

     context: context,
     barrierDismissible: false,
     builder: (context){
       return AlertDialog(
         
         content: Column(
           mainAxisSize: MainAxisSize.min,
           children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 40.0,
                child: Image.asset('recursos/imagenes/logo.png'),
              ),
              SizedBox(height: 15.0,),
              Text(mensaje),
           ],
         ),

         actions: <Widget>[
           FlatButton(
             child: Text('Aceptar', style: TextStyle(color: Color.fromRGBO(205, 105, 55, 1.0)),),
             onPressed: () => Navigator.of(context).pop(),
           ),
         ],
        

       );
     }


   );

 }
Widget _camposFormulario(String texto,TextEditingController controller,TextInputType type){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 4, 10, 4),
      height: 30,
      child:TextField(
              controller: controller,
                autofocus: false,
                keyboardType: type,
                style:
                    new TextStyle(fontSize: 13.0, color: Colors.black,fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                  filled: true,
                  //hintStyle: TextStyle(color: Colors.white54, fontFamily: 'CenturyGothic'),
                  fillColor: Color.fromRGBO(233, 233, 233, 1),
                  hintText: texto,
                 // hoverColor: Colors.black,
                 // focusColor: Colors.black,
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(5),
                  ),
  ),

)
    );
  }

  Widget _camposFormulario3(String texto,TextEditingController controller,TextInputType type){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 4, 10, 4),
      child:TextField(
              controller: controller,
                autofocus: false,
                keyboardType: type,
                style:
                    new TextStyle(fontSize: 13.0, color: Colors.black,fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                
                  filled: true,
                  fillColor: Color.fromRGBO(233, 233, 233, 1),
                  hintText: texto,

                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(5),
                  ),
  ),

)
    );
  }
_colocarHoraDisponibles(){
  
  var  fecha=_dropdownStrHoraInicio;
  var primeroSegundoCaracter=fecha.substring(0,2);
  List  datos = List<String>();

  for(int i=2;i<opcionesInicial.length;i++){
    datos.add(opcionesInicial[i]);
  }
    datos.add(" ");
      setState(() {
        opcionesFinal=datos;
      });
     

}
_reservas(BuildContext context){
  if(_estadotablecale){
    return  FutureBuilder(future: reservaProvider.getAllReservas(),
    builder: (BuildContext context,
     AsyncSnapshot<List<Reserva>> snapshot) {
      if (snapshot.connectionState == ConnectionState.done){ 
        _datoslistareserva=snapshot.data;
          return ConstrainedBox(
  constraints: new BoxConstraints(
    maxHeight: 180.0,
    
  ),

  child: Container(
 
    padding:  EdgeInsets.all(10.0),
    child: Scrollbar(
        
        child: new ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
             return  _cardMensajes(snapshot.data[index].nombre_zona.toString(),snapshot.data[index].fecha_hora_inicio,snapshot.data[index].fecha_hora_fin,'ACTIVA',snapshot.data[index].id_reserva, Colors.red.shade100, context ,snapshot.data[index].observaciones.toString());

            
  },
        ),
        
    ),
  ),
);
       }else{
         return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.orange),
                  )),
                );
       }
       } );
  }else{
    return ConstrainedBox(
  constraints: new BoxConstraints(
    maxHeight: 180.0,
    
  ),

  child: Container(
 
    padding:  EdgeInsets.all(10.0),
    child: Scrollbar(
        
        child: new ListView.builder(
          itemCount: _datoslistareserva.length,
          itemBuilder: (context, index) {
             return  _cardMensajes(_datoslistareserva[index].nombre_zona.toString(),_datoslistareserva[index].fecha_hora_inicio,_datoslistareserva[index].fecha_hora_fin,'ACTIVA',_datoslistareserva[index].id_reserva, Colors.red.shade100, context ,_datoslistareserva[index].observaciones.toString());

            
  },
        ),
        
    ),
  ),
);
  }

    
   
  }
  
Widget _cardMensajestodareserva(texto, color){
 
  return  GestureDetector(child: Card(
           color: color,
           child: Container(
             height: 30.0,
             padding: EdgeInsets.symmetric(horizontal:5.0, vertical: 2.0),
             child: Row(
               children: <Widget>[
                 
                Text(texto, style: TextStyle(color: Colors.grey.shade700, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 10.0),),
              
              ],
             ),
           ),
         )
         ) ;

}


  Widget _cardMensajes(texto, fecha, hora, estado,id_reserva,color, BuildContext context,String observacion){
 
  return  GestureDetector(child: Card(
           color: color,
           child: Container(
             padding: EdgeInsets.symmetric(horizontal:5.0, vertical: 2.0),
             child: Row(
               children: <Widget>[
                 
                Text(texto, style: TextStyle(color: Colors.grey.shade700, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 10.0),),
                SizedBox(width: 15.0,),
                Text('(LEER)'+fecha, style: TextStyle(color:Color.fromRGBO(255, 153, 29, 1.0),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 10.0),),
                  
                Expanded(
                                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                      Text(fecha, style: TextStyle(color: Colors.grey.shade700,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 10.0),),
                      Text(estado, style: TextStyle(color: Colors.grey.shade700,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 10.0),),

                    ],
                  ),
                )
              ],
             ),
           ),
         ),
         onTap: (){
           
           _alertLista(texto, fecha, observacion,estado,id_reserva);
            
         },
         ) ;

}
Widget _alertLista(String tipo ,  String fecha,String observacion,String hora,id_reserva ){
   showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text('RESERVA'),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              _campoAlert(tipo),
              _campoAlert(fecha),
              _campoAlert(hora),
              _campoAlert(observacion),
             
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Eliminar'),
            onPressed: () {
              _idreserva=" ";
              ApiService apiService=new ApiService();
              apiService.borrarReserva(id_reserva).then((onValue){
                    Navigator.of(context).pop();
                   setState(() {
                     
                   });
              });
            },
          ),
          FlatButton(
            child: Text('Editar'),
            onPressed: () {
               Navigator.of(context).pop();
               String _year=fecha.substring(6,10);
               String _month=fecha.substring(3,5);
                String _day=fecha.substring(0,2);
                _selectedDate=_day+"/"+_month+"/"+_year;
                _selectedDateBaseDato=_year+"-"+_month+"-"+_day;
                  _idreserva=id_reserva.toString();
                   _selectedDate=fecha;
          _zonaSelecionadad=tipo;
           _controllerObservaciones.text=observacion;
           
            },
          ),
          FlatButton(
            child: Text('Cerrar'),
            onPressed: () {
               _idreserva = " ";
              Navigator.of(context).pop();
            },
          ),
          
        ],
      );
    },
  );
}Widget _campoAlert(String texto){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(6, 4, 10, 4),
      height: 25,
      child:TextField(
                autofocus: false,
                keyboardType: TextInputType.text,
                style:
                    new TextStyle(fontSize: 13.0, color: Colors.black,fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.justify,
                decoration: new InputDecoration(
                  filled: true,
                  enabled: false,
                  //hintStyle: TextStyle(color: Colors.white54, fontFamily: 'CenturyGothic'),
                  fillColor: Color.fromRGBO(233, 233, 233, 1),
                  hintText: texto,
                 // hoverColor: Colors.black,
                 // focusColor: Colors.black,
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(5),
                  ),
  ),

)
    );
  }
botonPrincipal(context){
   return GestureDetector(
       onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DrawerItem() ));
       }, 
       child: Container(
       margin: EdgeInsets.symmetric(horizontal: 80.0 ),
       padding: EdgeInsets.symmetric(vertical: 7.0),
       child: Center(child: Text('PRINCIPAL', style: TextStyle(color:Color.fromRGBO(255, 153, 29, 1.0), fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 20.0),),),
       decoration: BoxDecoration( color: Colors.grey.shade300, borderRadius: BorderRadius.circular(5.0)),
     ),
   );

 }

 _calendarTable(){
   double _medidaslist=100.0;
   return Column(children: <Widget>[
     TableCalendar(
              events: _events,
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                  canEventMarkersOverflow: true,
                  todayColor: Colors.orange,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events) {
                  _estadotablecale=false;
                  setState(() {
                  
                  _listaocupada = events;
                });
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _calendarController,
            ),
            
             ConstrainedBox(
               constraints: new BoxConstraints(
                 maxHeight: _medidaslist,
               ) ,
               child: Container(
                 padding:  EdgeInsets.all(10.0),
                 child: Scrollbar(
                   child: _listaocupada.length != 0 ? ListView.builder(
                     itemCount: _listaocupada.length,
                     itemBuilder: (context,index){
                         return _cardMensajestodareserva(_listaocupada[index],  Colors.red.shade100);
                       
                     }
                     ) :Text('Esta fecha no se a echo reserva'),
                   ),
               ),
               ),
               
        _alertReserva(context),
           
   ],);
 }
 _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: _eventsController,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Save"),
                  onPressed: () {
                    if (_eventsController.text.isEmpty) return;
                    if (_events[_calendarController.selectedDay] != null) {
                      _events[_calendarController.selectedDay]
                          .add(_eventsController.text);
                    } else {
                      _events[_calendarController.selectedDay] = [
                        _eventsController.text
                      ];
                    }
                   // prefs.setString("events", json.encode(encodeMap(_events)));
                    _eventsController.clear();
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
DateTime corregir_fecha(String fecha){
    var dia=fecha.substring(0,2);
    var mes=fecha.substring(3,5);
    var anos=fecha.substring(6,10);
    var fechar_corregida="${anos}-${mes}-${dia}";
    return DateTime.parse(fechar_corregida);

  }
 
}