import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:green_taxi/core/helper/location_helper.dart';
import 'package:green_taxi/data/reopsitory/map_repository.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:uuid/uuid.dart';

part 'map_state.dart';

final mapProvider = StateNotifierProvider<MapProvider, MapState>((ref) {
  final repo = ref.read(mapRepositoryProvider);
  return MapProvider(repo);
});

class MapProvider extends StateNotifier<MapState> {
  MapProvider(this.repo) : super(MapInitial());
  final MapRepository repo;
  String? mapStyle;
  Set<Marker> markers = <Marker>{};
  FloatingSearchBarController controller = FloatingSearchBarController();

  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

//?====================================
  Future<void> moveToMyCurrentLocation() async {
    final position = await LocationHelper.myCurrentLocation();
    GoogleMapController controller = await mapController.future;
    // addMarker(
    //     markerId: "marker2",
    //     position: LatLng(position.latitude, position.longitude));
    state = MoveToMyLocation();
    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 17)));
  }

//! Change Map Style
  Future<void> changeMapStyle() async {
    await rootBundle.loadString('assets/map_style.txt').then((string) {
      mapStyle = string;
    });
  }

//*====================================
  Future<void> getPlaceDetails(
      {required String placeId, required String placeName}) async {
    state = PlaceDetailsLoading();
    try {
      final sessiontoken = const Uuid().v4();
      log("PlaceId :$placeId");
      final data =
          await repo.placeDetails(placeId: placeId, sessiontoken: sessiontoken);
      final position = data.geometry!.location!;
      final target = LatLng(position.lat!, position.lng!);
      addMarker(placeName: placeName, markerId: "marker1", position: target);
      await moveCameraPosition(target: target);
      state = PlaceDetailsSuccess();
    } catch (e) {
      log("Error :${e.toString()}");
      state = PlaceDetailsError(e.toString());
    }
  }

  Future<void> moveCameraPosition({required LatLng target}) async {
    log("moveCameraPosition");
    GoogleMapController controller = await mapController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: target, zoom: 17),
      ),
    );
  }

  void addMarker(
      {required String placeName,
      required String markerId,
      required LatLng position}) {
    markers.add(Marker(
        markerId: MarkerId(markerId),
        position: position,
        infoWindow: InfoWindow(title: placeName)));
    log("MarkerAdded");
    state = MarkerAdded();
  }
}
