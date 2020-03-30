
import 'package:flutter/material.dart';

class MisFacturas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return _tarjeta(context);
      },
    );
  }

  Widget _tarjeta(BuildContext context) {
    final tarjeta = SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Numero factura:'),
                    subtitle: Text('3456576'),
                  ),
                  ListTile(
                    leading: Text(''),
                    title: Text('Fecha:'),
                    subtitle: Text('12/02/2020'),
                  ),
                  ListTile(
                    leading: Text(''),
                    title: Text('Valor:'),
                    subtitle: Text('10.000'),
                  ),
                  ListTile(
                    leading: Text(''),
                    title: Text('Estado:'),
                    subtitle: Text('Cancelada'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: () {},
    );
  }
}
