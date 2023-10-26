import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    this.onTap,
    required this.title,
    this.title2,
  });
  final void Function()? onTap;
  final String title;
  final String? title2;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
            title,
            style: AppTextStyle.poppinsBold24.copyWith(fontSize: 20.sp),
          ),
          SizedBox(width: 10.w),
          title2 == null
              ? const SizedBox()
              : CircleAvatar(
                  backgroundColor: AppColors.green,
                  radius: 12.r,
                  child: Text(
                    title2!,
                    style: AppTextStyle.poppinsBold12
                        .copyWith(color: AppColors.white),
                  ),
                )
        ],
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.only(left: 24.w),
    );
  }
}
