import 'package:flutter/material.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';

class TermsPrivacyTextWidget extends StatelessWidget {
  const TermsPrivacyTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
            textAlign: TextAlign.center,
            text:
                TextSpan(style: AppTextStyle.poppinsRegular12, children: const [
              TextSpan(text: "${AppStrings.byCreating}\n"),
              TextSpan(
                  text: AppStrings.termsOfService,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: AppStrings.and),
              TextSpan(
                  text: AppStrings.privacyPolicy,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ])),
        SizedBox(height: context.height * 0.02),
      ],
    );
  }
}
