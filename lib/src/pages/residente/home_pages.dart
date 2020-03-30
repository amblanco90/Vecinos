import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Stack(
          children: <Widget>[
            
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 35.0,),
                  cardBienvenida(context),
                  _botonesRedondeados(context),
                  botonPanico(context)
                ]
              ),
            )
          ],
        ),
    );
  }

   Widget cardBienvenida(context){

  final head = TextStyle( 
      color:  Colors.grey.shade700,
      fontSize: 12.0
      );

  final head2 = TextStyle( 
      color:  Colors.grey.shade700,
      fontSize: 16.0, 
      fontWeight: FontWeight.bold,
      
      
      );

  final titulo = Theme.of(context).textTheme.title;
  final subtitulo = Theme.of(context).textTheme.subhead;
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    elevation: 5.0,
    child: Center(
      child: Container(

        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text('Bienvenido(a) Usuario', overflow: TextOverflow.ellipsis, style: titulo),
            ),

            SizedBox(height: 20.0,),

            Table(

              children: [

                TableRow(

                  children: [

                    Container(

                      padding: EdgeInsets.all(10.0),
                      child: Card(
                        color: Color.fromRGBO(255, 228, 169, 1.0),
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                                         children: <Widget>[

                              Center(
                                child: Text('Saldo pendiente:' , style: head2,),
                              ),
                              SizedBox(height: 10.0,),

                              Icon(Icons.monetization_on),
                              SizedBox(height: 10.0,),
                              Center(
                                child: Text('15000', style: head2,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                   

                  ],

                

                )

              ],

            ),

            SizedBox(height:20.0),

              Center(

                    child:Text('Facturas pendientes', style: head2),

                  ),

              DataTable(
                columns: [
                  DataColumn(
                    label:Text('Fecha de generacion',overflow: TextOverflow.ellipsis, style: head),
                  ),
                  DataColumn(
                    label:Text('Saldo pendiente', overflow: TextOverflow.ellipsis, style: head),
                  )
                ],

                rows: [
                  DataRow(

                    cells: [

                      DataCell(

                        Text('05/01/2020'),
                        

                      ),

                      DataCell(

                        Text('50000')

                      )

                    ]
                    
                  ),

                   DataRow(

                    cells: [

                      DataCell(

                        Text('05/01/2020'),
                        

                      ),

                      DataCell(

                        Text('50000')

                      )

                    ]
                    
                  ),

                   DataRow(

                    cells: [

                      DataCell(

                        Text('05/01/2020'),
                        

                      ),

                      DataCell(

                        Text('50000')

                      )

                    ]
                    
                  ),
                  
                ],
              ),
              
          ],
        ),
      ),
    ),


  );

}

Widget botonPanico(BuildContext context){

  return Container(
    child: Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.red,Icons.error_outline,'PANICO', context, null)
          ]
        )
      ] ,
    ),
  );

}


Widget _botonesRedondeados(context) {


   return Table(

      children: [
        TableRow(
          
          children: [

              _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0),Icons.chat,'Chat', context,null),
              botonPanico(context)

          ]
          
          ),
        TableRow(
                  
                  children: [

                    _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0),Icons.card_giftcard,'Mi casillero', context, null),
                    _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0), Icons.room_service ,'Mis reservas', context, null)

                  ]
                  
                  ),

        TableRow(
          
          children: [

            _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0),Icons.people,'Mis visitas', context,null),
            _crearBotonRedondeado(Color.fromRGBO(255, 153, 29, 1.0), Icons.business, 'Mi unidad', context,null)
          ]
          
          ),


      ],

   );

   

 }

Widget _crearBotonRedondeado(Color color, IconData icon, String texto, BuildContext context, Widget route ) {

    return Container(

      height: 140.0,
      margin: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 6), // changes position of shadow
          ),
    ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 5.0),
          CircleAvatar(
            backgroundColor: color,
            radius: 35.0,
            child: IconButton(
            icon:Icon(icon),
            color: Colors.white ,
            onPressed: (){
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => route),
              );
            },
            ),
          ),
          
          Text(
            
            texto,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.bold,
              fontSize: 16.0
              ),
            
          
          ),
          SizedBox(height: 5.0,),
        ],
      ),
    );

  }

  Widget _crearBotonRedondeado2(Color color, IconData icon, String texto, BuildContext context, Widget route ) {

    return Container(
      width: double.infinity,
      height: 140,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
    ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 5.0),
          CircleAvatar(
            backgroundColor: color,
            radius: 35.0,
            child: IconButton(
            icon:Icon(icon),
            color: Colors.white ,
            onPressed: (){
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => route),
              );
            },
            ),
          ),
          
          Text(
            
            texto,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.bold,
              fontSize: 16.0
              ),
            
          
          ),
          SizedBox(height: 5.0,),
        ],
      ),
    );

  }
}