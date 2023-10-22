import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';

class OTPBottomText extends StatelessWidget {
  const OTPBottomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: AppTextStyle.poppinsRegular12,
                  children: const [
                    TextSpan(text: AppStrings.resendCode),
                    TextSpan(
                        text: " 10 ${AppStrings.seconds}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ])),
          SizedBox(height: context.height * 0.02),
        ],
      ),
    );
  }
}
