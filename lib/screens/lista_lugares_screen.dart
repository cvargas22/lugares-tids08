import 'package:app_lugares/screens/agregar_lugar_screen.dart';
import 'package:flutter/material.dart';

class ListaLugaresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Lugares'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: (){
              Navigator.of(context).pushNamed(AgregarLugarScreen.routeName);
            }
          )
        ],
      ),
    );
  }
}