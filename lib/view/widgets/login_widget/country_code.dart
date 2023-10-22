import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/provider/country_code_provider/country_code_provider.dart';

class CountryCodeWidget extends ConsumerWidget {
  const CountryCodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(countryCodeProvider.notifier);
    ref.watch(countryCodeProvider);
    return GestureDetector(
      onTap: () async {
        provider.selectCountry(context);
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
            child: Image.asset(provider.countryCode.flagUri,
                package: provider.countryCode.flagImagePackage),
          ),
          SizedBox(width: context.width * 0.01),
          Expanded(
            child: Text(
              provider.countryCode.dialCode,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
            ),
          ),
          const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.blueGrey)
        ]),
      ),
    );
  }
}
