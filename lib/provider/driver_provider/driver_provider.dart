import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final driverProvider = ChangeNotifierProvider<DriverNotifier>((ref) {
  return DriverNotifier();
});

class DriverNotifier extends ChangeNotifier {
  int driverIndex = 0;

  d(int index) {
    driverIndex = index;
    notifyListeners();
  }
}
