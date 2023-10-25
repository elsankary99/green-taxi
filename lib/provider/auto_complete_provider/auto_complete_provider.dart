import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_taxi/data/model/auto_complete_model/auto_complete_model.dart';
import 'package:green_taxi/data/reopsitory/map_repository.dart';
import 'package:uuid/uuid.dart';

final inputProvider = StateProvider<String>((ref) => "");
final autoCompleteProvider =
    FutureProvider<List<AutoCompleteModel>>((ref) async {
  final repo = ref.read(mapRepositoryProvider);
  final sessiontoken = const Uuid().v4();
  log("sessiontoken : $sessiontoken");
  final input = ref.watch(inputProvider);
  log("input : $input");

  return await repo.autoCompletePlaces(
      input: input, sessiontoken: sessiontoken);
});
