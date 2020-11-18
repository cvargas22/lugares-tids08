import 'package:app_lugares/helpers/location_helper.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectLugar;
  LocationInput(this.onSelectLugar);
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  Location location = new Location();
  String urlImagenPrevia;

  void mostrarPrevia(double lat, double lng) {
    final staticMapUrl = LocationHelper.generarImagenPreviaUbicacion(lat, lng);
    setState(() {
      urlImagenPrevia = staticMapUrl;
    });
  }

  Future<void> obtenerUbicacionActual() async {
    try {
      final locData = await location.getLocation();
      mostrarPrevia(locData.latitude, locData.longitude);
      widget.onSelectLugar(locData.latitude, locData.longitude);
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Colors.grey
            )
          ),
          child: urlImagenPrevia == null
          ? Text('Ninguna ubicación seleccionada')
          : Image.network(
            urlImagenPrevia,
            fit: BoxFit.cover,
            width: double.infinity,
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
              onPressed: obtenerUbicacionActual,
              icon: Icon(Icons.location_on),
              label: Text('Ubicación actual'),
              textColor: Theme.of(context).primaryColor,
            ),
            FlatButton.icon(
              onPressed: (){},
              icon: Icon(Icons.map),
              label: Text('Sel. en Mapa'),
              textColor: Theme.of(context).primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
