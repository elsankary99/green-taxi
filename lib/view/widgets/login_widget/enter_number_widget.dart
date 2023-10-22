import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/view/widgets/login_widget/country_code.dart';
import 'package:green_taxi/view/widgets/login_widget/custom_text_field.dart';

class EnterNumberWidget extends StatelessWidget {
  const EnterNumberWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: CountryCodeWidget()),
          Expanded(flex: 3, child: CustomTextFormField()),
        ],
      ),
    );
  }
}
