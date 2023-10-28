import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_images.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/provider/driver_provider/driver_provider.dart';

class DriverCard extends ConsumerWidget {
  const DriverCard({super.key, this.index = 0});
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(driverProvider);
    final provider = ref.read(driverProvider.notifier);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      width: context.width * 0.42,
      decoration: BoxDecoration(
          color:
              provider.driverIndex != index ? AppColors.grey : AppColors.green,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: provider.driverIndex != index
              ? [
                  BoxShadow(
                      blurRadius: 10.h,
                      color: AppColors.grey,
                      blurStyle: BlurStyle.outer)
                ]
              : [
                  BoxShadow(
                      blurRadius: 10.h,
                      color: AppColors.green,
                      blurStyle: BlurStyle.outer)
                ]),
      child: Stack(children: [
        Positioned(
          left: 0,
          child: Padding(
            padding: EdgeInsets.only(left: 8.w, top: 8.h),
            child: RichText(
                text: TextSpan(
                    style: AppTextStyle.poppinsRegular12
                        .copyWith(color: AppColors.white),
                    children: [
                  TextSpan(
                      text: "Standard \n",
                      style: AppTextStyle.poppinsBold12
                          .copyWith(color: AppColors.white)),
                  const TextSpan(text: r"$9,90 " '\n'),
                  const TextSpan(text: "3 MIN"),
                ])),
          ),
        ),
        Positioned(
          right: 0,
          top: 8.h,
          child: Image.asset(
            Assets.assetsImagesCar,
            width: context.width * 0.4,
          ),
        ),
      ]),
    );
  }
}
