import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';

class TopHomeWidget extends ConsumerWidget {
  const TopHomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width,
      height: context.height * 0.35,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white,
            Colors.white.withOpacity(0.9),
            Colors.white.withOpacity(0.0),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(children: [
          SizedBox(height: context.height * 0.1),
          Row(
            children: [
              Container(
                height: context.height * 0.07,
                width: context.height * 0.07,
                decoration: const BoxDecoration(
                    color: AppColors.green, shape: BoxShape.circle),
              ),
              SizedBox(width: context.width * 0.07),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          style: AppTextStyle.poppinsRegular12,
                          text: AppStrings.goodMorning,
                          children: [
                        TextSpan(
                            text: "Ahmed", style: AppTextStyle.poppinsBold12)
                      ])),
                  Text(AppStrings.whereAreYouGoing,
                      style: AppTextStyle.poppinsBold20),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
