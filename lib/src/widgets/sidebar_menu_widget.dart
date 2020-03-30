import 'dart:math';

import 'package:flutter/material.dart';

class SidebarMenuWidget extends StatelessWidget {
  const SidebarMenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return _drawer();
  }
}


Widget _drawer(){

  return Container(
    
    child: Drawer(
          
          child:Stack(
              children:<Widget>[

                
                contenedor(),
                listaItems()
                

              ],
          )
    )
  );
      
}


Widget listaItems(){

 return ListView(
                children: <Widget> [
                  SizedBox(height: 5.0,),
                  Container(
                      child: Center(
                        child: CircleAvatar(
                          radius: 80.0,
                          backgroundColor: Colors.grey.shade300,
                        ),
                      ),
                      
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      
                      child: Text(
                        'Nombre Usuario',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                          
                        )
                      )
                    ),
                  ),
                  new Divider(color: Colors.white),
                  new ListTile(
                    title: new Text('Mis facturas',
                    style: TextStyle(
                        
                          fontSize: 17.5
                          
                        )
                    ),
                    leading: Icon(Icons.monetization_on,),
                    onTap: () {},
                  ),
                  new Divider(color: Colors.white),
                  new ListTile(
                    title: new Text('Mis reservas',
                    style: TextStyle(           
                        fontSize: 17.5                        
                        )),
                    leading: Icon(Icons.room_service),
                    onTap: () {},
                  ),
                  new Divider(color: Colors.white),
                  new ListTile(
                    title: new Text('PQR',
                    style: TextStyle(           
                        fontSize: 17.5                        
                        )),
                    leading: Icon(Icons.question_answer),
                    onTap: () {},
                  ),
                  new Divider(color: Colors.white),
                  new ListTile(
                    title: new Text('Visitas',
                    style: TextStyle(           
                        fontSize: 17.5                        
                        )),
                    leading: Icon(Icons.people),
                    onTap: () {},
                  ),
                  new Divider(color: Colors.white),
                  new ListTile(
                    title: new Text('Chat',
                    style: TextStyle(           
                        fontSize: 17.5                        
                        )),
                    leading: Icon(Icons.chat),
                    onTap: () {},
                  ),
                  new Divider(color: Colors.white),
                  new ListTile(
                    title: new Text('Mi buzón',
                    style: TextStyle(           
                        fontSize: 17.5                        
                        )),
                    leading: Icon(Icons.email),
                    onTap: () {},
                  ),
                  new Divider(color: Colors.white),
                  new ListTile(
                    title: new Text('Mi unidad',
                    style: TextStyle(           
                        fontSize: 17.5                        
                        )),
                    leading: Icon(Icons.business),
                    onTap: () {},
                  ),
                 new Divider(color: Colors.white),
                  new ListTile(
                    title: new Text('Mi perfil',
                    style: TextStyle(           
                        fontSize: 17.5                        
                        )
                    ),
                    leading: Icon(Icons.person),
                    onTap: () {},
                  ),
                  new Divider(color: Colors.white),
                  new ListTile(
                    title: new Text(
                      'Cerrar sesión',
                      style: TextStyle(           
                        fontSize: 17.5                        
                        )
                      ),
                    leading: Icon(Icons.exit_to_app),
                    onTap: () {},
                  ),
                 
                ],
              );


}


Widget contenedor(){

  return Container(

              decoration: BoxDecoration(
        
        color:  Colors.yellowAccent,
        gradient: LinearGradient(
          colors: [
            //Color.fromRGBO(205, 105, 55,1.0),
            Color.fromRGBO(255, 153, 29, 1.0),
            Color.fromRGBO(255, 135, 5,1.0),
            Color.fromRGBO(242, 84, 12,1.0),
           
            
            
            
          ]
        )
      ),
              
              );


}

