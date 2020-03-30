import 'package:edificion247/src/pages/admin/home_admin_pages.dart';
import 'package:flutter/material.dart';

class HomeButtonWidget extends StatelessWidget {
  const HomeButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        child: Icon(Icons.home) ,
        onPressed: (){
          Navigator.push(
                context,null
                //MaterialPageRoute(builder: (context) => HomePage()),
              );
        },
        backgroundColor:Color.fromRGBO(255, 153, 29, 0.9) ,
      ),
    );
  }
}

class HomeButtonAdminWidget extends StatelessWidget {
  const HomeButtonAdminWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        child: Icon(Icons.home) ,
        onPressed: (){
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeAdminPages()),
              );
        },
        backgroundColor:Color.fromRGBO(255, 153, 29, 0.9) ,
      ),
    );
  }
}