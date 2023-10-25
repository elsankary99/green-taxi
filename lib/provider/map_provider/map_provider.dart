import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:green_taxi/core/helper/location_helper.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

part 'map_state.dart';

final mapProvider =
    StateNotifierProvider<MapProvider, MapState>((ref) => MapProvider());

class MapProvider extends StateNotifier<MapState> {
  MapProvider() : super(MapInitial());
  String? mapStyle;
  FloatingSearchBarController controller = FloatingSearchBarController();

  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//?====================================
  Future<void> moveToMyCurrentLocation() async {
    final position = await LocationHelper.myCurrentLocation();
    GoogleMapController controller = await mapController.future;
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
}
