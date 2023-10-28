import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_images.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      width: context.width * 0.42,
      decoration: BoxDecoration(
          // color: AppColors.grey,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
                blurRadius: 10.h,
                color: AppColors.green,
                blurStyle: BlurStyle.outer)
          ]),
      child: Row(children: [
        const Column(
          children: [],
        ),
        Image.asset(Assets.assetsImagesCar)
      ]),
    );
  }
}
