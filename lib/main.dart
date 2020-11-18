import 'package:app_lugares/providers/mis_lugares.dart';
import 'package:app_lugares/screens/agregar_lugar_screen.dart';
import 'package:app_lugares/screens/lista_lugares_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MisLugares(),
      child: MaterialApp(
        title: 'Mis Lugares',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber
        ),
        home: ListaLugaresScreen(),
        routes: {
          AgregarLugarScreen.routeName : (context) => AgregarLugarScreen()
        },

      ),
    );
  }
}