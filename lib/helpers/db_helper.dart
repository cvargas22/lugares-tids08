

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  Database db;

  Future<Database> initDB() async{
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, 'lugares.db'); //ruta completa donde estara almacenada la BD
    db = await openDatabase(
      path,
      onCreate: (db, version){
        db.execute(
          'CREATE TABLE mis_lugares(id TEXT PRIMARY KEY, titulo TEXT, imagen TEXT, ub_lat REAL, ub_lng REAL, direccion TEXT)'
        );
      },
      version: 1
    );
    return db;
  }

  Future<void> insertar(String tabla, Map<String, Object> data) async{
    final db = await initDB();
    db.insert(
      tabla,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace //reemplaza el registro si existe uno con el mismo id a ingresar
    );
  }

  Future<List<Map<String,dynamic>>> obtenerDatos(String tabla)async{
    final db = await initDB();
    return db.query(tabla);
  }

  Future<void> eliminar(String tabla, String id)async{
    final db = await initDB();
    db.delete(tabla, where: 'id = ?', whereArgs: [id]);
  }
}