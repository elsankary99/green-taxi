import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';

class CountryCodeWidget extends ConsumerStatefulWidget {
  const CountryCodeWidget({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CountryCodeState();
}

class _CountryCodeState extends ConsumerState<CountryCodeWidget> {
  final countryPicker = const FlCountryCodePicker();
  CountryCode countryCode =
      const CountryCode(name: "Palestine", code: "Ps", dialCode: "+970");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Show the country code picker when tapped.
        final code = await countryPicker.showPicker(context: context);
        // Null check
        if (code != null) countryCode = code;
      },
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey)),
        child: Row(children: [
          SizedBox(width: context.width * 0.01),
          SizedBox(
            width: context.width * 0.07,
            child: Image.asset(countryCode.flagUri,
                package: countryCode.flagImagePackage),
          ),
          SizedBox(width: context.width * 0.01),
          Expanded(
            child: Text(
              countryCode.dialCode,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
            ),
          ),
          const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.blueGrey)
        ]),
      ),
    );
  }
}
