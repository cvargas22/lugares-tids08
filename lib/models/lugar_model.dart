


import 'dart:io';

import 'package:flutter/foundation.dart';


class Ubicacion{
  final double latitud;
  final double longitud;
  final String direccion;

  const Ubicacion({
    @required this.latitud,
    @required this.longitud,
    this.direccion
  });
}

class Lugar{
  final String id;
  final String titulo;
  final Ubicacion ubicacion;
  final File imagen;

  Lugar({
    @required this.id,
    @required this.titulo,
    @required this.ubicacion,
    @required this.imagen
  });
}