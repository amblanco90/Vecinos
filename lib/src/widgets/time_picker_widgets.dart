import 'package:flutter/material.dart';
import 'package:edificion247/src/helpers/appdata.dart';

class InitialTimeWidget extends StatefulWidget {
  InitialTimeWidget({Key initialTimekey}) : super(key: initialTimekey);

  @override
  _InitialTimeWidgetState createState() => _InitialTimeWidgetState();
}



class _InitialTimeWidgetState extends State<InitialTimeWidget> {
  
  TimeOfDay _currentTime = new TimeOfDay.now();
  
  String timeText = 'I N I C I O';
 
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = formattedTime;
          appData.hora_inicial_reserva = timeText;
        });
      }

    }



  @override
  Widget build(BuildContext context) {
    
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                              timeText,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
                          },
                        ),
                      ),
                      Builder(
                          builder: (context) =>IconButton(
                          icon: Icon(Icons.access_time),
                          tooltip: 'Tap to open date picker',
                          onPressed: () {
                            selectTime(context);
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
}




class FinalTimeWidget extends StatefulWidget {
  FinalTimeWidget({Key key}) : super(key: key);

  @override
  _FinalTimeWidgetState createState() => _FinalTimeWidgetState();
}

class _FinalTimeWidgetState extends State<FinalTimeWidget> {

  TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = ' F I N  ';
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = formattedTime;
          appData.hora_final_reserva = timeText;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
     return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                              timeText,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
                          },
                        ),
                      ),
                      Builder(
                          builder: (context) =>IconButton(
                          icon: Icon(Icons.access_time),
                          tooltip: 'Tap to open date picker',
                          onPressed: () {
                            selectTime(context);
                            
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
}








// DROPDOWN DEL AREA DE LAS ZONAS SOCIALES

class HoraInicioLunes extends StatefulWidget {
  HoraInicioLunes({Key key}) : super(key: key);

  @override
  _HoraInicioLunesState createState() => _HoraInicioLunesState();
}

class _HoraInicioLunesState extends State<HoraInicioLunes> {
  TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = appData.hora_inicio_lunes;
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = selectedTime.hour.toString()+':'+selectedTime.minute.toString()+':00';
          appData.hora_inicio_lunes = timeText;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
     return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                              appData.hora_inicio_lunes,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
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

}


class HoraFinLunes extends StatefulWidget {
  HoraFinLunes({Key key}) : super(key: key);

  @override
  _HoraFinLunesState createState() => _HoraFinLunesState();
}

class _HoraFinLunesState extends State<HoraFinLunes> {
  TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = appData.hora_final_lunes;
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = selectedTime.hour.toString()+':'+selectedTime.minute.toString()+':00';;
          appData.hora_final_lunes = timeText;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
     return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                              appData.hora_final_lunes,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
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
}

class HoraInicioMartes extends StatefulWidget {
  HoraInicioMartes({Key key}) : super(key: key);

  @override
  _HoraInicioMartesState createState() => _HoraInicioMartesState();
}

class _HoraInicioMartesState extends State<HoraInicioMartes> {
 TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = appData.hora_inicio_martes;
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = selectedTime.hour.toString()+':'+selectedTime.minute.toString()+':00';
          appData.hora_inicio_martes = timeText;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
     return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                              appData.hora_inicio_martes,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
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
}

class HoraFinalMartes extends StatefulWidget {
  HoraFinalMartes({Key key}) : super(key: key);

  @override
  _HoraFinalMartesState createState() => _HoraFinalMartesState();
}

class _HoraFinalMartesState extends State<HoraFinalMartes> {
  TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = appData.hora_final_martes;
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = selectedTime.hour.toString()+':'+selectedTime.minute.toString()+':00';
          appData.hora_final_martes = timeText;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
     return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                              appData.hora_final_martes,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
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
}


class HoraInicioMiercoles extends StatefulWidget {
  HoraInicioMiercoles({Key key}) : super(key: key);

  @override
  _HoraInicioMiercolesState createState() => _HoraInicioMiercolesState();
}

class _HoraInicioMiercolesState extends State<HoraInicioMiercoles> {
  TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = appData.hora_inicio_miercoles;
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = selectedTime.hour.toString()+':'+selectedTime.minute.toString()+':00';
          appData.hora_inicio_miercoles = timeText;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
     return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                              appData.hora_inicio_miercoles,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
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
}

class HoraFinalMiercoles extends StatefulWidget {
  HoraFinalMiercoles({Key key}) : super(key: key);

  @override
  _HoraFinalMiercolesState createState() => _HoraFinalMiercolesState();
}

class _HoraFinalMiercolesState extends State<HoraFinalMiercoles> {
  TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = appData.hora_final_miercoles;
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = selectedTime.hour.toString()+':'+selectedTime.minute.toString()+':00';
          appData.hora_final_miercoles = timeText;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
     return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                              appData.hora_final_miercoles,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
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
}

class HoraInicioJueves extends StatefulWidget {
  HoraInicioJueves({Key key}) : super(key: key);

  @override
  _HoraInicioJuevesState createState() => _HoraInicioJuevesState();
}

class _HoraInicioJuevesState extends State<HoraInicioJueves> {
  TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = appData.hora_inicio_jueves;
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = selectedTime.hour.toString()+':'+selectedTime.minute.toString()+':00';
          appData.hora_inicio_jueves = timeText;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
     return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                              appData.hora_inicio_jueves,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
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
}

class HoraFinalJueves extends StatefulWidget {
  HoraFinalJueves({Key key}) : super(key: key);

  @override
  _HoraFinalJuevesState createState() => _HoraFinalJuevesState();
}

class _HoraFinalJuevesState extends State<HoraFinalJueves> {
 TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = appData.hora_final_jueves;
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = selectedTime.hour.toString()+':'+selectedTime.minute.toString()+':00';
          appData.hora_final_jueves = timeText;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
     return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                              appData.hora_final_jueves,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
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
}

class HoraInicioViernes extends StatefulWidget {
  HoraInicioViernes({Key key}) : super(key: key);

  @override
  _HoraInicioViernesState createState() => _HoraInicioViernesState();
}

class _HoraInicioViernesState extends State<HoraInicioViernes> {
 TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = appData.hora_inicio_viernes;
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = selectedTime.hour.toString()+':'+selectedTime.minute.toString()+':00';
          appData.hora_inicio_viernes = timeText;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
     return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                              appData.hora_inicio_viernes,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
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
}

class HoraFinalViernes extends StatefulWidget {
  HoraFinalViernes({Key key}) : super(key: key);

  @override
  _HoraFinalViernesState createState() => _HoraFinalViernesState();
}

class _HoraFinalViernesState extends State<HoraFinalViernes> {
  TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = appData.hora_final_viernes;
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = selectedTime.hour.toString()+':'+selectedTime.minute.toString()+':00';
          appData.hora_final_viernes= timeText;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
     return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                              appData.hora_final_viernes,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
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
}

class HoraInicioSabado extends StatefulWidget {
  HoraInicioSabado({Key key}) : super(key: key);

  @override
  _HoraInicioSabadoState createState() => _HoraInicioSabadoState();
}

class _HoraInicioSabadoState extends State<HoraInicioSabado> {
  TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = appData.hora_inicio_sabado;
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = selectedTime.hour.toString()+':'+selectedTime.minute.toString()+':00';
          appData.hora_inicio_sabado = timeText;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
     return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                              appData.hora_inicio_sabado,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
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
}

class HoraFinalSabado extends StatefulWidget {
  HoraFinalSabado({Key key}) : super(key: key);

  @override
  _HoraFinalSabadoState createState() => _HoraFinalSabadoState();
}

class _HoraFinalSabadoState extends State<HoraFinalSabado> {
  TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = appData.hora_final_sabado;
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = selectedTime.hour.toString()+':'+selectedTime.minute.toString()+':00';
          appData.hora_final_sabado = timeText;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
     return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                             appData.hora_final_sabado,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
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
}

class HoraInicioDomingo extends StatefulWidget {
  HoraInicioDomingo({Key key}) : super(key: key);

  @override
  _HoraInicioDomingoState createState() => _HoraInicioDomingoState();
}

class _HoraInicioDomingoState extends State<HoraInicioDomingo> {
  TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = appData.hora_inicio_domingo;
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = selectedTime.hour.toString()+':'+selectedTime.minute.toString()+':00';
          appData.hora_inicio_domingo = timeText;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
     return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                              appData.hora_inicio_domingo,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
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
}

class HoraFinalDomingo extends StatefulWidget {
  HoraFinalDomingo({Key key}) : super(key: key);

  @override
  _HoraFinalDomingoState createState() => _HoraFinalDomingoState();
}

class _HoraFinalDomingoState extends State<HoraFinalDomingo> {
  TimeOfDay _currentTime = new TimeOfDay.now();

  String timeText = appData.hora_final_domingo;
  Future<Null> selectTime(BuildContext context) async {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: _currentTime,
      );

      MaterialLocalizations localizations = MaterialLocalizations.of(context);
      String formattedTime = localizations.formatTimeOfDay(selectedTime,
          alwaysUse24HourFormat: false);

      if (formattedTime != null) {
        setState(() {
          timeText = selectedTime.hour.toString()+':'+selectedTime.minute.toString()+':00';
          appData.hora_final_domingo= timeText;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
     return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                   
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                  
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
                              appData.hora_final_domingo,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))
                          ),
                          onTap: (){
                            selectTime(context);
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
}