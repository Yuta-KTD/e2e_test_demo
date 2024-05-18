import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapScreen extends StatefulHookConsumerWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  @override
  Widget build(BuildContext context) {
    const tokyoStation = LatLng(35.681236, 139.767125);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
      ),
      body: const GoogleMap(
        initialCameraPosition: CameraPosition(
          target: tokyoStation,
          zoom: 15,
        ),
        // myLocationEnabled: true,
      ),
    );
  }
}
