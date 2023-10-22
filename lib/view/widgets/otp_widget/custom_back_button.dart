import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.router.pop();
        },
        child: CircleAvatar(
          radius: 22.r,
          backgroundColor: AppColors.white,
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.green,
          ),
        ));
  }
}
