import 'package:flutter/material.dart';


class DialogReservaPage extends StatefulWidget {
  DialogReservaPage({Key key}) : super(key: key);

  @override
  _DialogReservaPageState createState() => _DialogReservaPageState();
}

class _DialogReservaPageState extends State<DialogReservaPage> {
  @override
  Widget build(BuildContext context) {
    int _n = 0; //counter variable

      void add() {
        setState(() {
          _n++;
        });
      }

      void minus() {
        setState(() {
          if (_n != 0) _n--;
        });
      }

      @override
      Widget build(BuildContext context) {
        return Container(
          width: 100,
          height: 100,
          child: Text('adsf'),
        );
        
      }
  }
}