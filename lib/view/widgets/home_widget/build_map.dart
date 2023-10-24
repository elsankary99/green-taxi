import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:green_taxi/provider/map_provider/map_provider.dart';

class BuildMap extends ConsumerStatefulWidget {
  const BuildMap({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuildMapState();
}

class _BuildMapState extends ConsumerState<BuildMap> {
  String? _mapStyle;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(mapProvider.notifier);

    return GoogleMap(
      zoomControlsEnabled: false,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        provider.mapController.complete(controller);
        controller.setMapStyle(_mapStyle);
      },
    );
  }
}
