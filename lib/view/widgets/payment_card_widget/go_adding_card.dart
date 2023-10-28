import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/core/router/app_router.dart';

class GoAddingCard extends StatelessWidget {
  const GoAddingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.08,
      padding: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.white,
            blurRadius: 20.h,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          context.router.push(const AddCardRoute());
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            AppStrings.addNewCard,
            style: AppTextStyle.poppinsBold12.copyWith(fontSize: 18.sp),
          ),
          SizedBox(width: 20.w),
          const CircleAvatar(
            backgroundColor: AppColors.green,
            child: Icon(
              Icons.arrow_forward,
              color: AppColors.white,
            ),
          )
        ]),
      ),
    );
  }
}
