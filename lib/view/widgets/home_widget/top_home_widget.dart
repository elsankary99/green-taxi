import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/core/widget/custom_circle_indicator.dart';
import 'package:green_taxi/provider/profile_provider/profile_provider.dart';

class TopHomeWidget extends ConsumerWidget {
  const TopHomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width,
      height: context.height * 0.25,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white.withOpacity(0.9),
            Colors.white.withOpacity(0.6),
            Colors.white.withOpacity(0.0),
          ],
        ),
      ),
      child: ref.watch(getUserDataProvider).when(
            data: (data) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(children: [
                SizedBox(height: context.height * 0.07),
                Row(
                  children: [
                    Container(
                      height: context.height * 0.07,
                      width: context.height * 0.07,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(data.imageUrl!),
                              fit: BoxFit.cover),
                          color: AppColors.green,
                          shape: BoxShape.circle),
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
                                  text: data.name,
                                  style: AppTextStyle.poppinsBold12)
                            ])),
                        Text(AppStrings.whereAreYouGoing,
                            style: AppTextStyle.poppinsBold20),
                      ],
                    )
                  ],
                )
              ]),
            ),
            loading: () => const CustomCircleIndicator(color: AppColors.green),
            error: (error, _) => Center(
                child: Text(
              error.toString(),
              style: AppTextStyle.poppinsBold12.copyWith(color: Colors.red),
            )),
          ),
    );
  }
}
