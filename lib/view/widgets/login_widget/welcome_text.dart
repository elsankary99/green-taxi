import 'package:flutter/material.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
    required this.title1,
    required this.title2,
  });
  final String title1;
  final String title2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.height * 0.04),
        Text(title1, style: AppTextStyle.poppinsRegular12),
        Text(title2, style: AppTextStyle.poppinsBold24)
      ],
    );
  }
}
