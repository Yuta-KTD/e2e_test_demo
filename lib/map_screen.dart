import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'location/location_provider.dart';

class MapScreen extends HookConsumerWidget {
  const MapScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationAsyncValue = ref.watch(locationProvider);
    const tokyoStation = LatLng(35.681236, 139.767125);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: switch (locationAsyncValue) {
              AsyncData(:final value) => value != null
                  ? LatLng(value.latitude, value.longitude)
                  : tokyoStation,
              AsyncError() => tokyoStation,
              _ => tokyoStation,
            },
            zoom: 15,
          ),
          myLocationEnabled: true,
        ),
      ),
    );
  }
}
