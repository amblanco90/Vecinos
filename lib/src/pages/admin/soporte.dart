import 'dart:io';

import 'package:edificion247/src/models/pqr.dart';
import 'package:edificion247/src/pages/admin/drawer_admin.dart';
import 'package:edificion247/src/pages/residente/misvisitas.dart';
import 'package:edificion247/src/providers/pqrProvider.dart';
import 'package:edificion247/src/widgets/alerts.dart';
import 'package:flutter/material.dart'  as prefix ;
import 'package:flutter/material.dart' ;
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SoportePages extends StatefulWidget {

  @override
  _SoportePagesState createState() => _SoportePagesState();
}



class _SoportePagesState extends State<SoportePages> {
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
  prefix.Widget build(BuildContext context) {
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
          children:<prefix.Widget>[
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
                  children: <prefix.Widget>[
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <prefix.Widget>[
                         
                          SizedBox(height: 10.0),
                          descripcion
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <prefix.Widget>[
                          Container(
                            width: 100.0,
                            height: 100.0,
                            color: Colors.grey.shade200,
                            child: _image == null
                                ? Center(
                                    child: Icon(Icons.add),
                                  )
                                : Image.file(_image),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <prefix.Widget>[
                              Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Row(
                                    children: <prefix.Widget>[
                                      FloatingActionButton(
                                        heroTag: 'cam',
                                        onPressed: getImageFromCam,
                                        backgroundColor:
                                            Color.fromRGBO(255, 153, 29, 0.9),
                                        tooltip: 'Elija una imagen',
                                        child: Icon(
                                          Icons.add_a_photo,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                        width: 20.0,
                                      ),
                                      FloatingActionButton(
                                          backgroundColor:
                                              Color.fromRGBO(255, 153, 29, 0.9),
                                          onPressed: getImageFromGallery,
                                          heroTag: 'gallery',
                                          tooltip: 'Elija una imagen',
                                          child: Icon(Icons.wallpaper)),
                                    ],
                                  )),
                            ],
                          )
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
                              child: Text('GENERAR PQR',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'CenturyGothic',
                                      fontSize: 17.0)),
                              onPressed: () {
                                if (descripcionController.text.isEmpty) {
                                  ValidacionLoginAlert(context);
                                } else {
                                  pr.show();
                                  pqrProvider.generarPqr(context, descripcionController.text, _image).then((val){
                                    
                                    setState(() {
                                     _image =null;
                                     descripcionController.clear();
                                     pr.dismiss();
                                     pqrGeneradaAlert(context);
                                      
                                      
                                    });
                                  });
                                  
                                }
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
    maxHeight: 160.0,
  ),

  child: Container(
    decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.orange,width: 3,),
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
    padding:  EdgeInsets.all(10.0),
    child: Scrollbar(
        
        child: FutureBuilder(
          future: pqrProvider.getAllPqrs() ,
          
          builder: (BuildContext context, AsyncSnapshot<List<Pqr>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done)
              return snapshot.data!=null?ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
              return  
         Card(
           color: Colors.grey.shade300,
           child: Container(
             padding: EdgeInsets.all(10.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <prefix.Widget>[
                 Text(snapshot.data[index].fechaCreacion, style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold, fontFamily: 'CenturyGothic'),),
                 Text('DESCRIPCION', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 15.0, fontFamily: 'CenturyGothic'),),
                 
                 Text(snapshot.data[index].descripcion, maxLines: 3,
                 style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold, fontFamily: 'CenturyGothic'),),
                 Text('ESTADO', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 15.0, fontFamily: 'CenturyGothic'),),
                 Text(snapshot.data[index].estado.toString(), maxLines: 3,
                 style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold, fontFamily: 'CenturyGothic'),),
                
               ],
             ),
           ),
         );
             },
            ): Container();
            else 
              return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),));
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
              context, MaterialPageRoute(builder: (context) => DrawerAdminItem())); 
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
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    )


   
     
     
          ],
        ),
      ),
    );
  }

}