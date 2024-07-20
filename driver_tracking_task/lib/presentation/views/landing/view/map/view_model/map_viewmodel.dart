import 'package:driver_tracking_task/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_route_service/open_route_service.dart';

class MapViewModel extends BaseViewModel {
  final pageController = PageController();
  final mapController = MapController();
  Position? _position;
  Position? get position => _position;
  LatLng? selectedLocation;
  LatLng? focusedMarker;
  OpenRouteService client =
      OpenRouteService(apiKey: dotenv.env['API_KEY'].toString());
  void initialize(BuildContext context) {
    _determinePosition();
    _listenToLocationChanges();
    if (mounted) return;
    this.context = context;
  }

  Future<void> selectLocation(index) async {
    selectedLocation = locations[index];
    locations = [selectedLocation!];
    notifyListeners();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void _listenToLocationChanges() {
    Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
                distanceFilter: 10, accuracy: LocationAccuracy.high))
        .listen((Position position) {
      _position = position;
      notifyListeners();
    });
  }

  Future<void> fetchRoute(LatLng start, LatLng end) async {}
  void focusChanged(index) {
    mapController.move(locations[index], 15.0);
  }

  void handleCard(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}

List<Marker> buildMarkers() {
  final markerList = <Marker>[];
  for (var i = 0; i < locations.length; i++) {
    markerList.add(
      Marker(
        width: 30,
        height: 30,
        point: locations[i],
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
        ),
      ),
    );
  }
  return markerList;
}

List locations = [
  const LatLng(36.8052, 34.6153),
  const LatLng(36.7999, 34.6252),
  const LatLng(36.7944, 34.6140),
  const LatLng(36.7830, 34.6128),
];
const myLocation = LatLng(36.7798, 34.6044);
