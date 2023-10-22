import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_strings.dart';

class CustomTextFormField extends ConsumerWidget {
  const CustomTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      // validator: (value) {
      //   if (value!.trim().isEmpty) {
      //     return AppStrings.pleaseEnterYourPhoneErr;
      //   }
      //   if (value.trim().length < 11) {
      //     return AppStrings.phoneNumberDigitErr;
      //   }
      //   return null;
      // },
      // onSaved: (phoneNumber) {
      //   provider.phoneNumber = phoneNumber!.trim();
      // },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14.h,
          ),
          hintText: AppStrings.enterMobileNumber,
          border: const OutlineInputBorder()),
    );
  }
}
