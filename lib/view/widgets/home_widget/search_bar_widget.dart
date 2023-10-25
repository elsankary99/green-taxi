import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    this.onTap,
    required this.title,
  });
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.height * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: const [
              BoxShadow(color: AppColors.light, blurRadius: 4)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Row(children: [
            Expanded(
                child: Text(
              title,
              style: AppTextStyle.poppinsBold16,
            )),
            const Icon(
              Icons.search,
              color: AppColors.light,
            )
          ]),
        ),
      ),
    );
  }
}
