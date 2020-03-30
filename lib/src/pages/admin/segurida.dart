import 'package:flutter/material.dart';

class SeguridaPages extends StatefulWidget {

  @override
  _SeguridaPagesState createState() => _SeguridaPagesState();
}

class _SeguridaPagesState extends State<SeguridaPages> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:_botonesRedondeados() ,
    );
  }

  Widget _botonesRedondeados() {
   return Column(
     children: <Widget>[
       Row(
         children: <Widget>[
             _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0),Icons.people,'Personal seguridad',context, (){showAlertDialogPersonal(context);}),

              _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0), Icons.book ,'Minuta digital',context, (){showAlertDialogMinuta(context);} ),
              _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0),Icons.list,'Contrato vigilante', context,(){showAlertDialogContrato(context);}),
         ],
       )
     ],
   );
 }

  Widget _crearBotonRedondeado(Color color, IconData icon, String texto, BuildContext context,Function function ) {
    return Column(
      children: <Widget>[
        Container(
          width: 100.0,
          height: 90.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          
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
          child: IconButton(
            icon: Icon(icon, size: 70.0,),
            onPressed: function
          ),
        ),
        Center(
          child: Text(texto,
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'CenturyGothic')),
        )
      ],
    );
  }

  showAlertDialogPersonal(BuildContext context) {
  Widget cancelButton = FlatButton(
    child: Text("Cancelar",style: TextStyle(fontSize: 18.0)),
    onPressed:  () {
      
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Agregar",style: TextStyle(fontSize: 18.0),),
    onPressed:  () {
    },
  );

  AlertDialog alert = AlertDialog(
    title: Center(child: Text("Agregar personal seguridad",style: TextStyle(fontSize: 16.0),),),
    content:SingleChildScrollView(
      child:  Container(
      width: 250.0,
        child: Column(
      children: <Widget>[
       _idSeguridad(),
       Padding(padding:EdgeInsets.fromLTRB(0, 10, 0, 10)),
       _cedulaSeguridad(),
       Padding(padding:EdgeInsets.fromLTRB(0, 10, 0, 10)),
       _nombreSeguridad('Edgar','Nombre',Icon(Icons.people,)),
       Padding(padding:EdgeInsets.fromLTRB(0, 10, 0, 10)),
       _nombreSeguridad('Morrillo','Apellido',Icon(Icons.people,)),
       Padding(padding:EdgeInsets.fromLTRB(0, 10, 0, 10)),
       _telefonoSeguridad(),
       Padding(padding:EdgeInsets.fromLTRB(0, 10, 0, 10)),
       _nombreSeguridad('Calle 75 #34-32','Direcion',Icon(Icons.home,)),
        Padding(padding:EdgeInsets.fromLTRB(0, 10, 0, 10)),
       // _crear_campo_nombre_visitante(bloc_visita)
      ],
    ),
    ),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogMinuta(BuildContext context) {
  Widget continueButton = FlatButton(
    child: Text("Aceptar",style: TextStyle(fontSize: 18.0),),
    onPressed:  () {
    },
  );

  AlertDialog alert = AlertDialog(
    title: Center(child: Text("Minuta digital",style: TextStyle(fontSize: 16.0),),),
    content:SingleChildScrollView(
      child:  Container(
      child: _crearTabla(),
    ),
    ),
    actions: [
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogContrato(BuildContext context) {
  Widget continueButton = FlatButton(
    child: Text("Subir",style: TextStyle(fontSize: 18.0),),
    onPressed:  () {
    },
  );

  AlertDialog alert = AlertDialog(
    title: Center(child: Text("Contrato",style: TextStyle(fontSize: 16.0),),),
    content:SingleChildScrollView(
      child:  Container(
      child: IconButton(icon: Icon(Icons.picture_as_pdf),iconSize: 100, onPressed: () {},)
    ),
    ),
    actions: [
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget _idSeguridad(){
  return Container(
        child: Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.confirmation_number,color:Colors.black),
            Padding(padding: EdgeInsets.all(10.0),),
            Text('Id',style:TextStyle(fontSize: 18.0))
          ],
        ),
        TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: '12345',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 0, 
                style: BorderStyle.none,
            ),
            
            
        ),
         filled: true,
        contentPadding: EdgeInsets.all(16),
      )
    ),
      ],
    )
  ),
      );
}
Widget _cedulaSeguridad(){
  return Container(
        child: Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.confirmation_number,color:Colors.black),
            Padding(padding: EdgeInsets.all(10.0),),
            Text('Cedula',style:TextStyle(fontSize: 18.0))
          ],
        ),
        TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: '123456789',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 0, 
                style: BorderStyle.none,
            ),
            
            
        ),
         filled: true,
        contentPadding: EdgeInsets.all(16),
      )
    ),
      ],
    )
  ),
      );
}

Widget _nombreSeguridad(String hint,String nombre,Icon icon){
  return Container(
        child: Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            icon,
            Padding(padding: EdgeInsets.all(10.0),),
            Text(nombre,style:TextStyle(fontSize: 18.0))
          ],
        ),
        TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 0, 
                style: BorderStyle.none,
            ),
            
            
        ),
         filled: true,
        contentPadding: EdgeInsets.all(16),
      )
    ),
      ],
    )
  ),
      );
}
Widget _telefonoSeguridad(){
  return Container(
        child: Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.phone,color:Colors.black),
            Padding(padding: EdgeInsets.all(10.0),),
            Text('Celular',style:TextStyle(fontSize: 18.0))
          ],
        ),
        TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: '3000000000',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 0, 
                style: BorderStyle.none,
            ),
            
            
        ),
         filled: true,
        contentPadding: EdgeInsets.all(16),
      )
    ),
      ],
    )
  ),
      );
}

Widget _crearTabla(){
  final titulo = TextStyle( 
      color:  Colors.grey.shade500,
      fontSize: 16.0
      );
  return Column(
        children: <Widget>[
          
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              sortAscending: true,
              sortColumnIndex: 1,
              columns: [
                DataColumn(
                  label: Text('Visitante', style: titulo,),
                  numeric: true
                  ),
                DataColumn(label: Text('Fecha', style: titulo,)),
                DataColumn(
                  numeric: true,
                  label: Text('Detalles', style: titulo,)
                ),

              ],

              rows:[
                DataRow(
                  cells: [
                    DataCell(Text('Andres')),
                    DataCell(Text('20/09/2019')),
                    DataCell(Text('Entro en carro ...')),

                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Maicol')),
                    DataCell(Text('21/09/2019')),
                    DataCell(Text('Entro en moto'))

                  ],
                ),
                DataRow(
                  cells: [
                     DataCell(Text('Martin')),
                    DataCell(Text('21/09/2019')),
                    DataCell(Text('Entro en bicicleta'))

                  ],
                )
              ]
            ),
          )
        ],
      );
}
}