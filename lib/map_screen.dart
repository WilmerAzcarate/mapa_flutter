import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_flutter/models/route.dart' as api_route;
import 'package:map_flutter/services/open_route_service.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final OpenRouteService _routeService = OpenRouteService();
  List<LatLng> routePoints = [];

  Future<void> getRoute() async {
    List<List<double>> route =
        await _routeService.getRoute(8.681495, 49.41461, 8.687872, 49.420318);
    setState(() {
      routePoints =
          route.map((e) => LatLng(e[0].toDouble(), e[1].toDouble())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          options: const MapOptions(
              initialZoom: 15, initialCenter: LatLng(8.681495, 49.41461)),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              // Plenty of other options available!
            ),
            MarkerLayer(
              markers: [
                //primer marcador
                Marker(
                    point: const LatLng(8.681495,49.41461),
                    width: 80,
                    height: 80,
                    child: Builder(
                        builder: (context) => IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.location_on),
                            color: Colors.red,
                            iconSize: 45))),
                Marker(
                    point: const LatLng(8.687872, 49.420318),
                    width: 80,
                    height: 80,
                    child: Builder(
                        builder: (context) => IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.location_on),
                            color: Colors.blue,
                            iconSize: 45))),
              ],
            ),
            PolylineLayer(
              polylines: [
                Polyline(
                  points: routePoints,
                  color: Colors.blue,
                ),
              ],
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getRoute();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
