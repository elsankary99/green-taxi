import 'package:dio/dio.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/data/model/auto_complete_model/auto_complete_model.dart';

class MapRepository {
  final dio = Dio();

//?(1)
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
}
