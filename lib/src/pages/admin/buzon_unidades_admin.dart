import 'package:edificion247/src/search/search_delegate_factura.dart';
import 'package:flutter/material.dart';

class BuzonUnidadesAdmin extends StatelessWidget {

final _pageController = new PageController(
          initialPage: 1,
          viewportFraction: 1.0,
          
        );

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener((){
      if(_pageController.position.pixels>= _pageController.position.maxScrollExtent -200){
        
      }
    });



    return SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              child: IconButton(
                color: Colors.orangeAccent,
                icon: Icon(Icons.search, color: Colors.orangeAccent,),
                onPressed: (){
                  showSearch(
                    context: context,
                    delegate: DataSearch()

                  );
                },
              ),
            ),
          Container(
            width: _screenSize.width , 
            height: _screenSize.height * 0.7,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              controller: _pageController,
              itemCount: 5,
              itemBuilder: (context , i){

                return _tarjeta(context);

              },
            ),

          ),
        ],
      ),
    );
  }

  List<Widget> _tarjetas(BuildContext context) {

   /* return peliculas.map((pelicula){
      
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
              image: NetworkImage(pelicula.getPosterImg()),
              placeholder: AssetImage('assets/img/no-image.jpg'),
              fit: BoxFit.cover,
              height: 160.0,
              
            ),
            ),
            SizedBox(height: 5.0),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )   
          ],
        ),
      );

    }).toList();*/

  }


  Widget _tarjeta( BuildContext context){

      
       final tarjeta = SingleChildScrollView(
                child: Container(
          
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

           


          Card(
                        child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.message),
                                title: Text('Fecha:'),
                                subtitle: Text('05/08/2020'),

                              ),
                              ListTile(
                                leading: Text(''),
                                title: Text('Titulo:'),
                                subtitle: Text('Titulo mensaje'),

                              ),
                              ListTile(
                                leading: Text(''),
                                title: Text('Texto:'),
                                subtitle: Text('Texto mensaje'),

                              ),
                              ListTile(
                                leading: Text(''),
                                title: Text('Detalle:'),
                                subtitle: Text('Detalle mensaje'),

                              ),
                              ListTile(
                                leading: Text(''),
                                title: Text('Estado:'),
                                subtitle: Text('Estado mensaje'),

                              ),
                              
                              


                            ],
                          ),
                      ),
            ],
          ),
      ),
       );

    return GestureDetector(

      child:  tarjeta,
      onTap: (){
         
      },

    );

  }



}





