import 'dart:convert';
import 'dart:io';

import 'package:edificion247/src/models/pqr.dart';
import 'package:edificion247/src/pages/residente/drawer.dart';
import 'package:edificion247/src/pages/residente/lista_pqr.dart';
import 'package:edificion247/src/providers/pqrProvider.dart';
import 'package:edificion247/src/search/search_delegate_factura.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:edificion247/src/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';

class PqrPages extends StatefulWidget {
  PqrPages({Key key}) : super(key: key);

  @override
  _PqrPagesState createState() => _PqrPagesState();
}

class _PqrPagesState extends State<PqrPages> {
  File _image;
  final tController = TextEditingController();
  final descripcionController = TextEditingController();
  final pqrProvider = PqrProvider();
  ProgressDialog pr;

  Future getImageFromCam() async {
    final app = descripcionController.text;
    

    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      descripcionController.text = app; 
    });
  }

  Future getImageFromGallery() async {
    final app = descripcionController.text;
    
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      descripcionController.text = app; 
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
    pr = new ProgressDialog(context);
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

    pr = new ProgressDialog(context);
    final color = TextStyle(color: Colors.white);

    final descripcion = TextFormField(
      controller: descripcionController,
      
      cursorColor: Color.fromRGBO(205, 105, 55, 1.0),
      keyboardType: TextInputType.multiline,
      autofocus: false,
      maxLines: null,
      onChanged: (string){
       
      },
      decoration: InputDecoration( 
        hintText: 'DESCRIPCION',
        hintStyle: TextStyle(
          fontFamily: 'CeturyGothic'
        ), 
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
            SizedBox(height: 10.0,),

   Row(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: <Widget>[
       Text('TUS ',style:  TextStyle(color: Colors.orange.shade800, fontWeight: FontWeight.bold, fontSize: 25.0, fontFamily: 'CenturyGothic'),),
       Text('PQRs',style:  TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.bold, fontSize: 25.0, fontFamily: 'CenturyGothic'),),
     ],
   ),
   SizedBox(height: 10.0,),

   Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 7.0,width: 305.0, decoration: BoxDecoration( color: Colors.orange.shade600, borderRadius: BorderRadius.circular(5.0)),),
   ), 

   SizedBox(height: 10.0,),



   GestureDetector(
        onTap:(){
          nuevopqr(context);
        },
        child: Container(
       padding: EdgeInsets.all(20.0),
       margin: EdgeInsets.all(10.0),
       decoration: BoxDecoration(
         border: Border.all(color: Colors.orange,width: 4,),
         borderRadius: BorderRadius.circular(5.0),
        

       ),
       child:  Text('RADICAR NUEVA PQR',style:  TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold, fontSize: 25.0, fontFamily: 'CenturyGothic'),),
     ),
   ),
   SizedBox(height: 10.0,),
   
   Row(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: <Widget>[
       Text('HISTORIAL',style:  TextStyle(color: Colors.orange.shade800, fontWeight: FontWeight.bold, fontSize: 25.0, fontFamily: 'CenturyGothic'),),
      
     ],
   ),
   SizedBox(height: 10.0,),

   Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 4.0,width: 305.0, decoration: BoxDecoration( color: Colors.grey.shade500, borderRadius: BorderRadius.circular(5.0)),),
   ), 


   ConstrainedBox(
  constraints: new BoxConstraints(
    minHeight: 35.0,
    maxHeight: 250.0,
  ),

  child: Container(
    
    margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0), 
    child: Scrollbar(
        
        child: FutureBuilder(
          future: pqrProvider.getAllPqrs() ,
          
          builder: (BuildContext context, AsyncSnapshot<List<Pqr>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done)
              return snapshot.data!=null?ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
              return  cardMensajes(snapshot.data[index].descripcion,snapshot.data[index].fechaCreacion ,'',snapshot.data[index].id.isEven?Colors.red.shade100:Colors.grey.shade300 ,
              snapshot.data[index].estado, context, snapshot.data[index].id);
         
             },
            ): Container();
            else 
              return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),));
          },
        ),

      ),
    ),
  ),

  Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(height: 4.0,width: 305.0, decoration: BoxDecoration( color: Colors.grey.shade500, borderRadius: BorderRadius.circular(5.0)),),
   ), 


  GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DrawerItem()));
                          }, 
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
                            padding: EdgeInsets.symmetric(vertical: 7.0),
                            child: Center(
                              child: Text(
                                'PRINCIPAL',
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 153, 29, 1.0),
                                    fontFamily: 'CenturyGothic',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(5.0)),
                          ))


   
     
     
          ],
        ),
      ),
    );
  }


 
Widget cardMensajes(texto, fecha, hora, color, estado, BuildContext context,id){

  var estadoString;
  
  if(estado==0){

    estadoString= 'INACTIVO';

  }else if(estado==1){
     estadoString= 'ACTIVO';
  }else if(estado==30){
     estadoString= 'RESUELTO';
  }

  return    GestureDetector(
     onTap: (){
       setState(() {
         print(estadoString);
       });
        
     },
     
      child: Card(
             
             color: color,
             child: Container(
               padding: EdgeInsets.symmetric(horizontal:5.0, vertical: 8.0),
               child: Row(
                 children: <Widget>[
                   
                  Container(
                    height: 15.0,
                    width: 120.0,
                    child: Text(texto, 
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade700, fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 10.0),)),
                  SizedBox(width: 15.0,),
                  
                  Expanded(
                                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[

                    GestureDetector(

                    
                    
                    child: Text('(LEER)'+ estadoString, style: TextStyle(color: Color.fromRGBO(255, 114, 0, 1.0),  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 10.0),),
                    onTap: (){

                      
                     
                    },

                    
                    ),

                    
                        SizedBox(width: 10.0,),
                        Text(fecha, style: TextStyle(color: Colors.grey.shade700,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 10.0),),
                        Text(hora, style: TextStyle(color: Colors.grey.shade700,  fontFamily: 'CenturyGothic', fontWeight: FontWeight.bold, fontSize: 10.0),),

                      ],
                    ),
                  )
                ],
               ),
             ),
           )
  );

}

Widget nuevopqr (BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        final observaciones = TextEditingController();
        return Dialog(
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.orangeAccent.shade400,
                  width: 4,
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
              child: Column(children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(' RADICAR PQR ',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,)),
                            
                  
                  ],
                ),
                SizedBox(height: 15.0,),
               
                DropDownDestinoPqr(),
                 SizedBox(
                  height: 10.0,
                ),
                DropDownZonaPqr(),
                 SizedBox(
                  height: 10.0,
                ),
                
                ConstrainedBox(
                  constraints: new BoxConstraints(
                    maxHeight: 120.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(3.0), 
                       color: Colors.grey.shade200,
                    ),
                   
                    padding: EdgeInsets.all(10.0),
                    child: Scrollbar(
                      child: new ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Container(
                              width: 200.0,
                              height: 200.0,
                              child: TextField(
                                controller: observaciones,
                                cursorColor: Colors.orange,
                                decoration:
                                    InputDecoration.collapsed(hintText: 'DESCRIBA SU PQR', hintStyle: TextStyle(
                            fontSize: 13.0,
                            color: Colors.grey.shade700,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.bold,) ),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 5.0,),

              Container(
                      
                      child: Row(
                        children: <Widget>[
                         
                          Expanded(
                                                      child: Row(
                              children: <Widget>[
                                
                                GestureDetector(
                                 
                                  child: Row(
                                    children: <Widget>[
                                      
                                      Icon( 
                                        Icons.attach_file,
                                        color: Colors.grey.shade700,
                                      ),

                                      Text(
                        'ADJUNTAR FOTO',
                        style: TextStyle(
                              color: Colors.grey.shade700,
                              fontFamily: 'CenturyGothic', 
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0),
                      ),
                                    ],
                                  ),
                                  onTap: getImageFromCam, 
                                ),
                                
                              ],
                            ),
                          ),
                           Container(
                              width: 80.0,
                              height: 80.0,
                              color: Colors.grey.shade200,
                              child: _image == null
                                  ? Center(
                                      child: Icon(Icons.add),
                                    )
                                  : Image.file(_image),
                          ),
                       
                        ],
                      ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                  onTap: () {
                   

                  },
                  child: Container(
                    margin:
                        EdgeInsets.only( top: 10.0),
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical:5.0),
                    child: Center(
                      child: Text(
                        'RADICAR',
                        style: TextStyle(
                            color: Colors.orange.shade700,
                            fontFamily: 'CenturyGothic', 
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
               SizedBox(width: 15.0,),
               
               GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    
                  },
                  child: Container(
                    margin:
                        EdgeInsets.only( top: 10.0),
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical:5.0),
                    child: Center(
                      child: Text(
                        'CANCELAR',
                        style: TextStyle(
                            color: Colors.orange.shade700,
                            fontFamily: 'CenturyGothic', 
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
             

              ],),
              SizedBox(height: 20.0,)
              ]),
            ),
          ),
        );
      });
}





}
