import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryCodeProvider = ChangeNotifierProvider<CountryCodeNotifier>((ref) {
  return CountryCodeNotifier();
});

class CountryCodeNotifier extends ChangeNotifier {
  final countryPicker = const FlCountryCodePicker();
  CountryCode countryCode =
      const CountryCode(name: "Palestine", code: "Ps", dialCode: "+970");

  Future<void> selectCountry(BuildContext context) async {
    // Show the country code picker when tapped.
    final code = await countryPicker.showPicker(context: context);
    // Null check
    if (code != null) countryCode = code;
    notifyListeners();
  }
}
