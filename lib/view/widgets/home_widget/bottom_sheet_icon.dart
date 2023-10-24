import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';

class BottomSheetIcon extends StatelessWidget {
  const BottomSheetIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: context.height * 0.02,
        width: context.width * 0.65,
        decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: const [
              BoxShadow(
                color: AppColors.grey,
                blurRadius: 2,
                blurStyle: BlurStyle.outer,
              )
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r))),
        child: Center(
            child: Container(
          height: context.height * 0.005,
          width: context.width * 0.3,
          color: AppColors.light,
        )),
      ),
    );
  }
}
