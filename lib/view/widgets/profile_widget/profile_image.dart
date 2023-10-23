import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CircleAvatar(
        radius: 65.r,
        backgroundColor: AppColors.grey,
        child: Icon(
          Icons.camera_alt_outlined,
          color: AppColors.white,
          size: 35.sp,
        ),
      ),
    );
  }
}
