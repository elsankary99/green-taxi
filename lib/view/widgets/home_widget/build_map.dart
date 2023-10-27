import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/helper/location_helper.dart';
import 'package:green_taxi/core/widget/custom_circle_indicator.dart';
import 'package:green_taxi/provider/map_provider/map_provider.dart';

final myLocationProvider = FutureProvider<Position>((ref) async {
  ref.read(mapProvider.notifier).changeMapStyle();
  return LocationHelper.myCurrentLocation();
});

class BuildMap extends ConsumerWidget {
  const BuildMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(mapProvider.notifier);
    ref.watch(mapProvider);
    return ref.watch(myLocationProvider).when(
          data: (data) => GoogleMap(
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            polylines: provider.polylines,
            markers: provider.markers,
            initialCameraPosition: CameraPosition(
                target: LatLng(data.latitude, data.longitude), zoom: 17),
            onMapCreated: (GoogleMapController controller) {
              provider.mapController.complete(controller);
              controller.setMapStyle(provider.mapStyle);
            },
          ),
          loading: () => const CustomCircleIndicator(color: AppColors.green),
          error: (error, _) => Center(
            child: Text(
              error.toString(),
              style: AppTextStyle.poppinsRegular14.copyWith(color: Colors.red),
            ),
          ),
        );
  }
}
