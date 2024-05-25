import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'location/location_provider.dart';
import 'login_form.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(locationProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Permission Handler'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            switch (location) {
              AsyncError(:final error) => Text('Error: $error'),
              AsyncData(:final value) => _CurrntLocationText(location: value),
              _ => const CircularProgressIndicator(),
            },
            const SizedBox(height: 40),
            const LoginForm()
          ],
        ),
      ),
    );
  }
}

class _CurrntLocationText extends StatelessWidget {
  final Position? location;
  const _CurrntLocationText({super.key, required this.location});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('現在地'),
        Text('緯度: ${location?.latitude}'),
        Text('経度: ${location?.longitude}'),
      ],
    );
  }
}
