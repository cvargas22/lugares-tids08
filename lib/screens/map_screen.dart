import 'package:app_lugares/models/lugar_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final Ubicacion ubicacionInicial;
  final bool estaSeleccionando;
  MapScreen({
    this.ubicacionInicial = const Ubicacion(
      latitud: -45.5796118, 
      longitud: -72.0521845
    ), 
    this.estaSeleccionando = false
  });
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  
  LatLng ubicacionSeleccionada;

  void seleccionarUbicacion(LatLng posicion){
    setState(() {
      ubicacionSeleccionada = posicion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Mapa'),
        actions: <Widget>[
          widget.estaSeleccionando? IconButton(
            icon: Icon(Icons.check),
            onPressed: ubicacionSeleccionada == null 
            ? null
            : (){
              Navigator.of(context).pop(ubicacionSeleccionada);
            }
          )
          :Container()
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          zoom: 13,
          target: LatLng(
            widget.ubicacionInicial.latitud,
            widget.ubicacionInicial.longitud
          )
        ),
        onTap: widget.estaSeleccionando?seleccionarUbicacion:null,
        markers: (ubicacionSeleccionada == null && widget.estaSeleccionando)
          ? null
          : {
            Marker(
              markerId: MarkerId('m1'),
              position: ubicacionSeleccionada?? LatLng(
                widget.ubicacionInicial.latitud, 
                widget.ubicacionInicial.longitud
              )
            ),
          },
      ),
    );
  }
}