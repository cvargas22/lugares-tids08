import 'package:app_lugares/providers/mis_lugares.dart';
import 'package:app_lugares/screens/agregar_lugar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detalle_lugar_screen.dart';

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
      body: FutureBuilder(
        future: Provider.of<MisLugares>(context, listen: false).traerLugares(),
        builder: (context,snapshot) => snapshot.connectionState == ConnectionState.waiting
        ? Center(
          child: CircularProgressIndicator(),
        )
        : Consumer<MisLugares>(
          child: Center(
            child: Text('No existen lugares, agrega algunos!'),
          ),
          builder: (context, misLugares, ch) => misLugares.items.length <=0
          ? ch
          : ListView.builder(
            itemCount: misLugares.items.length,
            itemBuilder: (context, i) => Dismissible(
              key: UniqueKey(),
              onDismissed: (direction){
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Se elimino ${misLugares.items[i].titulo}')
                  )
                );
                Provider.of<MisLugares>(context, listen: false).eliminarLugar(
                  misLugares.items[i].id
                );
                
              },
              background: Container(
                child: Center(
                  child: Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                color: Colors.red,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(
                    misLugares.items[i].imagen
                  ),
                ),
                title: Text(misLugares.items[i].titulo),
                subtitle: Text(misLugares.items[i].ubicacion.direccion),
                onTap: () => Navigator.of(context).pushNamed(
                  DetalleLugarScreen.routeName
                ),
              ),
            )
          )
        )
      ),
    );
  }
}