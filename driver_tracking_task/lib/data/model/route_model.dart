import 'package:latlong2/latlong.dart';

class RouteModel {
  List<LatLng> coordinates;

  RouteModel({required this.coordinates});
  factory RouteModel.fromJson(Map<String, dynamic> json) {
    List<LatLng> coords = [];
    for (var coord in json['features']['geometry']['coordinates']) {
      coords.add(LatLng(coord[1], coord[0]));
    }
    return RouteModel(coordinates: coords);
  }
}
