import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.icon,
    this.onSaved,
  });
  final String title;
  final IconData icon;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.poppinsRegular14,
        ),
        SizedBox(height: 2.h),
        TextFormField(
          validator: (value) {
            if (value!.trim().isEmpty) {
              return AppStrings.fieldRequired;
            }
            return null;
          },
          onSaved: onSaved,
          cursorColor: AppColors.green,
          style: AppTextStyle.poppinsRegular14,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(),
              hintText: title,
              hintStyle: AppTextStyle.poppinsRegular14,
              prefixIcon: Icon(
                icon,
                color: AppColors.green,
                size: 20.sp,
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey, width: 2)),
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.green, width: 2))),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
