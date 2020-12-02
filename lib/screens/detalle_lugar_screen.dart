import 'package:app_lugares/providers/mis_lugares.dart';
import 'package:app_lugares/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DetalleLugarScreen extends StatelessWidget {
  static const routeName = 'detalle_lugar';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final lugarSeleccionado = Provider.of<MisLugares>(context, listen: false).encontrarConId(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(lugarSeleccionado.titulo),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              lugarSeleccionado.imagen,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height:10),
          Text(
            lugarSeleccionado.ubicacion.direccion,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey
            ),
          ),
          SizedBox(height:10),
          FlatButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => MapScreen(
                    ubicacionInicial: lugarSeleccionado.ubicacion,
                  )
                )
              );
            }, 
            child: Text('Ver en Mapa'),
            textColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}