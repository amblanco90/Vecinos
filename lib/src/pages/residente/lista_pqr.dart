import 'package:flutter/material.dart';

class ListaPQRPage extends StatelessWidget {
 

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



    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: _screenSize.width , 
          height: _screenSize.height * 0.7,
          child: Scrollbar(
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

        ),
      ],
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

      
      final tarjeta =  Container(
        
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Card(
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
                child: SingleChildScrollView(
                                child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.message),
                        title: Text('ID:'),
                        subtitle: Text('1'),

                      ),
                      ListTile(
                        leading: Text(''),
                        title: Text('Título:'),
                        subtitle: Text('Titulo pqr'),

                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(15.0),
                        leading: Text(''),
                        title: Text('Descripcion:'),
                        subtitle: Text('Descripcion Pqr Descripcion Pqr Descripcion Pqr Descripcion Pqr Descripcion Pqr'+
                        'Descripcion Pqr Descripcion Pqr Descripcion Pqr Descripcion Pqr Descripcion Pqr Descripcion Pqr Descripcion Pqr',
                        maxLines: null, ),

                      ),


                    ],
                  ),
                ),
              ),
            ),

           
          ],
        ),
      );

    return GestureDetector(

      child:  tarjeta,
      onTap: (){
         
      },

    );

  }


}