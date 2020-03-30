import 'package:flutter/material.dart';


class  DataSearch extends SearchDelegate {



  @override
  List<Widget> buildActions(BuildContext context) {
    
    //  Acciones del appbar

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    
    // Icono a la izquierda del appbar

    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed:(){
        close(context, null);
      } ,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //Crea los resultados que se mostraran

    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

   
            return Center(
              child: CircularProgressIndicator(),
            );

        }

      
    
}
    // Sugerencias que aparecen cuando la persona escribe

