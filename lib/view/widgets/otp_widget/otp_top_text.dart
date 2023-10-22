import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/view/widgets/login_widget/welcome_text.dart';

class OTPTopText extends StatelessWidget {
  const OTPTopText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const WelcomeText(
          title1: AppStrings.phoneVerification, title2: AppStrings.enterOtp),
    );
  }
}
