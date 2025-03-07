import 'package:edificion247/src/helpers/message.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class ChatVigilanciaPage extends StatefulWidget {
  @override
  _ChatVigilanciaPageState createState() => _ChatVigilanciaPageState();
}

class _ChatVigilanciaPageState extends State<ChatVigilanciaPage> {
   final List<Message> _messages = <Message>[];

  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm').format(time);
    return Container(
       child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: new Container(
              child: new Column(
                children: <Widget>[
                  //Chat list
                  new Flexible(
                    child: new ListView.builder(
                      padding: new EdgeInsets.all(8.0),
                      reverse: true,
                      itemBuilder: (_, int index) => _messages[index],
                      itemCount: _messages.length,
                    ),
                  ),
                  new Divider(height: 1.0),
                  new Container(
                      decoration:
                          new BoxDecoration(color: Theme.of(context).cardColor),
                      child: new IconTheme(
                          data: new IconThemeData(
                              color: Theme.of(context).accentColor),
                          child: new Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: new Row(
                              children: <Widget>[
                                //left send button

                                Container(width: 10.0,),
                                //Enter Text message here
                                new Flexible(
                                  child: new TextField(
                                    
                                    controller: _textController,
                                    decoration: new InputDecoration.collapsed(
                                        hintText: "Enter message"),
                                  ),
                                ),

                                  new Container(
                                    width: 48.0,
                                    height: 48.0,
                                    child: new IconButton(
                                        icon: Icon(Icons.send ,color: Color.fromRGBO(255, 153, 29, 0.9) ,),
                                        onPressed: () => _sendMsg(
                                            _textController.text,
                                            'left',
                                            formattedDate)),
                                ),


                                //right send button

                              ],
                            ),
                          ))),
                ],
              ),
            ))
    );
      
}

void _sendMsg(String msg, String messageDirection, String date) {
    if (msg.length == 0) {
      Fluttertoast.showToast(
          msg: "Escriba su mensaje aquí",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor:  Color.fromRGBO(255, 153, 29, 0.9) ,);
    } else {
      _textController.clear();
      Message message = new Message(
        msg: msg,
        direction: messageDirection,
        dateTime: date,
      );
      setState(() {
        _messages.insert(0, message);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    // Clean up the controller when the Widget is disposed
    _textController.dispose();
    super.dispose();
  }
  }