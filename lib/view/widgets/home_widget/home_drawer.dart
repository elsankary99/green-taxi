import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/core/router/app_router.dart';

class HomeDrawerWidget extends ConsumerWidget {
  const HomeDrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(children: [
        InkWell(
          onTap: () {
            context.router.push(const MyProfileRoute());
          },
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, top: 50.h, bottom: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    Text(AppStrings.goodMorning,
                        style: AppTextStyle.poppinsRegular12),
                    Text("Ahmed Ebrahim", style: AppTextStyle.poppinsBold20),
                  ],
                )
              ],
            ),
          ),
        ),
        const Divider(
          color: AppColors.light,
          thickness: 1,
        )
      ]),
    );
  }
}
