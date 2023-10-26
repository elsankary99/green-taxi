import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';

class BottomDrawer extends StatelessWidget {
  const BottomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              AppStrings.doMore,
              style:
                  AppTextStyle.poppinsBold12.copyWith(color: AppColors.light),
            ),
          ),
          Text(
            AppStrings.getFoodDelivery,
            style: AppTextStyle.poppinsBold12.copyWith(color: AppColors.light),
          ),
          Text(
            AppStrings.makeMoneyDriving,
            style: AppTextStyle.poppinsBold12.copyWith(color: AppColors.light),
          ),
          Text(
            AppStrings.rateUsOnStore,
            style: AppTextStyle.poppinsBold12.copyWith(color: AppColors.light),
          ),
        ],
      ),
    );
  }
}
