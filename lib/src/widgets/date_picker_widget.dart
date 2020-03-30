import 'package:flutter/material.dart';
import 'package:edificion247/src/helpers/appdata.dart';

class DatePickerWidget extends StatefulWidget {
  DatePickerWidget({Key key}) : super(key: key);


  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  
  
  String _selectedDate = 'Fecha inicio';

  Future<void> _selectDate(BuildContext context) async {

      
    final b = showDatePicker(
      
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2500),
      locale: Locale('es','ES')
      
 
    );
    
    final DateTime d = await b;

    
    if (d != null)
      setState(() {
        _selectedDate = d.day.toString()+ '-' + d.month.toString()+'-' + d.year.toString();
        appData.fecha_inicial_reserva = _selectedDate;
      });
  }


  @override
  Widget build(BuildContext context) {
    return Row(
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
                  borderRadius: BorderRadius.all(Radius.circular(32.0))
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
}



//FECHA FINAL WIDGET

class FinalDateWidget extends StatefulWidget {
  FinalDateWidget({Key key}) : super(key: key);

  @override
  _FinalDateWidgetState createState() => _FinalDateWidgetState();
}

class _FinalDateWidgetState extends State<FinalDateWidget> {

  String _selectedDate = 'Fecha fin';

  Future<void> _selectDate(BuildContext context) async {

      
    final b = showDatePicker(
      
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2500),
      locale: Locale('es','ES')
      
 
    );
    
    final DateTime d = await b;

    
    if (d != null)
      setState(() {
        _selectedDate = d.day.toString()+ '-' + d.month.toString()+'-' + d.year.toString();
        appData.fecha_final_reserva = _selectedDate;
      });
  }


  @override
  Widget build(BuildContext context) {
     return Row(
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
                  borderRadius: BorderRadius.all(Radius.circular(32.0))
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
}