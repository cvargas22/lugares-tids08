
import 'package:dio/dio.dart';

const GOOGLE_API_KEY = 'AIzaSyARz1i8CTRkipxVtcWmBfA9aUXiFIL-fHQ';
class LocationHelper{

  static String generarImagenPreviaUbicacion(double latitud, double longitud){
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitud,$longitud&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitud,$longitud&key=$GOOGLE_API_KEY';
  }

  static Future<String> obtenerDireccionLugar(double lat, double lng) async{
    final url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY";
    final response = await Dio().get(url);
    return response.data['results'][0]['formatted_address'];
  }
}