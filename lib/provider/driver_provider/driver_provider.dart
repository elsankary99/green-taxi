import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final driverProvider = ChangeNotifierProvider<DriverNotifier>((ref) {
  return DriverNotifier();
});

class DriverNotifier extends ChangeNotifier {
  int driverIndex = 0;
  String? selectedCard;
  selectDriver(int index) {
    driverIndex = index;
    notifyListeners();
  }

  selectPaymentCard(String value) {
    selectedCard = value;
    notifyListeners();
  }
}
