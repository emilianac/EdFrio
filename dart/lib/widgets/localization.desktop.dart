import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocalizationDesktop extends StatefulWidget {
  const LocalizationDesktop({super.key});

  @override
  State<LocalizationDesktop> createState() => _LocalizationDesktopState();
}

class _LocalizationDesktopState extends State<LocalizationDesktop> {
  @override
  Widget build(BuildContext context) {
    return const MapSample();
  }
}

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-22.4139, -43.5601); // Exemplo: Santos Dumont - MG

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa com Google Maps'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('local'),
            position: _center,
            infoWindow: const InfoWindow(
              title: 'Minha Localização',
              snippet: 'Santos Dumont - MG',
            ),
          )
        },
      ),
    );
  }
}