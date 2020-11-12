



import 'dart:io';

import 'package:app_lugares/helpers/db_helper.dart';
import 'package:app_lugares/models/lugar_model.dart';
import 'package:flutter/foundation.dart';

class MisLugares extends ChangeNotifier{

  DBHelper dbHelper = DBHelper();
  List<Lugar> _items = [];

  List<Lugar> get items{ //esto es un getter en Dart
    return [..._items]; //spread operator sirve para realizar una copia de una lista y poder agregarla a otra
  }

  
  Lugar encontrarConId(String id){
    return _items.firstWhere((lugar) => lugar.id == id); //metodo que obtiene el primer elemento que cumple una determinado condicion en una lista
  }
  
  Future<void> eliminarLugar(String id) async{
    final lugarBuscado = encontrarConId(id);
    _items.remove(lugarBuscado);
    notifyListeners();
    dbHelper.eliminar('mis_lugares ',lugarBuscado.id);
  }

  Future<void> traerLugares() async{
    final listaData = await dbHelper.obtenerDatos('mis_lugares'); //traemos lugares desde la BD
    _items = listaData.map((item) => Lugar(
      id: item['id'],
      titulo: item['titulo'],
      imagen: item['imagen'],
      ubicacion: Ubicacion(
        latitud: item['ub_lat'],
        longitud: item['ub_lng'],
        direccion: item['direccion']
      )
    )).toList();
    notifyListeners();
  }

  Future<void> agregarLugar(String tituloSelec, File imagenSelec, Ubicacion ubicacionSelec) async{

    final ubicacion = Ubicacion(
      latitud: ubicacionSelec.latitud,
      longitud: ubicacionSelec.longitud,
      direccion: '' //por ahora la direccion la dejamos vacia, hasta que usemos la API de Google
    );
    final nuevoLugar = Lugar(
      id: DateTime.now().toString(),
      imagen: imagenSelec,
      titulo: tituloSelec,
      ubicacion: ubicacion
    );
    _items.add(nuevoLugar);
    notifyListeners(); //notificamos que se realizo una modificacion a la lista de lugares(modelo)
    dbHelper.insertar(
      'mis_lugares', 
      {
        'id': nuevoLugar.id,
        'titulo': nuevoLugar.titulo,
        'imagen': nuevoLugar.imagen,
        'ub_lat': nuevoLugar.ubicacion.latitud,
        'ub_lng': nuevoLugar.ubicacion.longitud,
        'direccion': nuevoLugar.ubicacion.direccion
      }
    );

  }


}