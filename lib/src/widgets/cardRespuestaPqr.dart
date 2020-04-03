import 'dart:convert';
import 'package:flutter/material.dart';

cardRespuestaPqr(nombre,hora,texto,foto){
  return  Card(
                                
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      child: Row(
                                        children: <Widget>[
                                          Text(nombre,style: TextStyle(
                                                 color: Colors.orange,
                                                  fontFamily: 'CenturyGothic',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.0)),
                                          Expanded(child: Container()),
                                          Text(DateTime.parse(hora).day.toString()+'/'+DateTime.parse(hora).month.toString()+'/'+
                                          DateTime.parse(hora).year.toString()+' '+DateTime.parse(hora).hour.toString()+':'+DateTime.parse(hora).minute.toString()
                                          ,style: TextStyle(
                                                   color: Colors.grey.shade700,
                                                    fontFamily: 'CenturyGothic',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.0)),
                                        ],
                                      ),
                                    ),
                                    Row(
                                    children: <Widget>[
                                     
                                     Expanded(
                                     
                                     child: Column(
                                       children: <Widget>[
                                         
                                         Container(
                                           padding: EdgeInsets.all(5.0),
                                           child: Text(texto, style: TextStyle(
                                               color: Colors.grey.shade700,
                                                fontFamily: 'CenturyGothic',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.0),),
                                         )

                                       ],

                                       ),
                                     ),
                                     foto!=null?Column(

                                       children: <Widget>[

                                         Container(
                          margin: EdgeInsets.all(5.0),
                          width: 80.0,
                          height: 80.0,
                          color: Colors.grey.shade200,
                          child: foto == null
                              ? Center(
                                      child: Icon(Icons.camera),
                                    )
                              : Image.memory(base64.decode(foto)),
                        ),


                                         
                                       ],

                                     ):Container(),

                                    ],
                              ),
                                  ],
                                ),
                            );
                           
                         
}