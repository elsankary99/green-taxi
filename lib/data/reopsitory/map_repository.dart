import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/data/model/auto_complete_model/auto_complete_model.dart';
import 'package:green_taxi/data/model/place_details_model/place_details_model.dart';
import 'package:green_taxi/data/model/place_direction_model/place_direction_model.dart';

final mapRepositoryProvider = Provider<MapRepository>((ref) {
  return MapRepository();
});

class MapRepository {
  final dio = Dio();

//? Auto Complete(1)
  Future<List<AutoCompleteModel>> autoCompletePlaces(
      {required String input, required String sessiontoken}) async {
    final response = await dio.get(
      AppStrings.autoCompleteUrl,
      queryParameters: {
        "input": input,
        "components": "country:eg",
        "sessiontoken": sessiontoken,
        "key": AppStrings.apiKey
      },
    );
    final data = response.data["predictions"] as List;
    return data.map((e) => AutoCompleteModel.fromJson(e)).toList();
  }

  //?  placeDetails(2)
  Future<PlaceDetailsModel> placeDetails(
      {required String placeId, required String sessiontoken}) async {
    final response = await dio.get(
      AppStrings.placeDetailsUrl,
      queryParameters: {
        "place_id": placeId,
        "fields": "geometry",
        "sessiontoken": sessiontoken,
        "key": AppStrings.apiKey
      },
    );
    final data = response.data["result"] as Map<String, dynamic>;
    return PlaceDetailsModel.fromJson(data);
  }

  //?  placeDirection(3)
  Future<PlaceDirectionModel> placeDirection(
      {required LatLng destination, required LatLng origin}) async {
    final response = await dio.get(
      AppStrings.placeDirectionUrl,
      queryParameters: {
        "destination": "${destination.latitude},${destination.longitude}",
        "origin": "${origin.latitude},${origin.longitude}",
        "key": AppStrings.apiKey
      },
    );
    final data = response.data["routes"][0] as Map<String, dynamic>;
    return PlaceDirectionModel.fromJson(data);
  }
}
