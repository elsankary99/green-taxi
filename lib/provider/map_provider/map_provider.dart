import 'dart:async';
import 'dart:developer';
import 'dart:ui' as ui;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_images.dart';
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

  Set<Polyline> polylines = <Polyline>{};
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

//*==================GetPlaceDirection==================
  Future<void> getPlaceDirection(LatLng destination) async {
    final origin = await LocationHelper.myCurrentLocation();

    final data = await repo.placeDirection(
        destination: destination,
        origin: LatLng(origin.latitude, origin.longitude));

    List<PointLatLng> result =
        PolylinePoints().decodePolyline(data.overviewPolyline!.points!);
    List<LatLng> placeDirection =
        result.map((e) => LatLng(e.latitude, e.longitude)).toList();
    createPolyLine(placeDirection);

    log("PolyPoints: $result");
  }

//*==================GetPlaceDetails==================
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
      await moveCameraPosition(target: target);

      await addMarker(
          placeName: placeName, markerId: "marker1", position: target);
      await getPlaceDirection(target);

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

  Future<void> addMarker(
      {required String placeName,
      required String markerId,
      required LatLng position}) async {
    final Uint8List markIcons =
        await getImages(Assets.assetsImagesDestMarker, 100);

    markers.add(Marker(
        markerId: MarkerId(markerId),
        position: position,
        icon: BitmapDescriptor.fromBytes(markIcons),
        infoWindow: InfoWindow(title: placeName)));
    log("MarkerAdded");
    state = MarkerAdded();
  }

//!(Create Custom Marker)
  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  //*========Draw Polyline=======
  void createPolyLine(List<LatLng> placeDirection) async {
    polylines.add(Polyline(
        polylineId: const PolylineId("Polyline1"),
        color: AppColors.green,
        width: 5,
        points: placeDirection));
  }
}
