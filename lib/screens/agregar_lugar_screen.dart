import 'dart:io';

import 'package:app_lugares/widgets/image_input.dart';
import 'package:flutter/material.dart';


class AgregarLugarScreen extends StatefulWidget {
  static const routeName = 'agregar_lugar';
  @override
  _AgregarLugarScreenState createState() => _AgregarLugarScreenState();
}

class _AgregarLugarScreenState extends State<AgregarLugarScreen> {
  final tituloController = TextEditingController();
  File _imagenSeleccionada;
  void seleccionarImagen(File imagenSeleccionada){
    _imagenSeleccionada = imagenSeleccionada;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir un lugar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Título'
                    ),
                    controller: tituloController,
                  ),
                  SizedBox(height: 10),
                  ImageInput(seleccionarImagen),
                  SizedBox(height:10),
                  //LocationInput
                ],
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            onPressed: (){},
            label: Text('Agregar Lugar'),
            color: Theme.of(context).accentColor,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )
        ],
      ),
    );
  }
}