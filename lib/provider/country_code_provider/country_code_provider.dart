import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryCodeProvider = ChangeNotifierProvider<CountryCodeNotifier>((ref) {
  return CountryCodeNotifier();
});

class CountryCodeNotifier extends ChangeNotifier {}
