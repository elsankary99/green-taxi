import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';

class AppTextStyle {
  static TextStyle get poppinsBold24 {
    return TextStyle(
      fontSize: 23.sp,
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle get poppinsRegular12 {
    return TextStyle(
      fontSize: 12.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }

  static TextStyle get poppinsRegular14 {
    return TextStyle(
      fontSize: 14.sp,
      color: AppColors.darkGrey,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }
}
