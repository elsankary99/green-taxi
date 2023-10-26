import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/core/router/app_router.dart';
import 'package:green_taxi/core/widget/custom_circle_indicator.dart';
import 'package:green_taxi/provider/profile_provider/profile_provider.dart';

class DrawerHeaderWidget extends ConsumerWidget {
  const DrawerHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getUserDataProvider).when(
          data: (data) => InkWell(
            onTap: () {
              context.router.push(MyProfileRoute(data: data));
            },
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, top: 50.h, bottom: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: context.height * 0.07,
                    width: context.height * 0.07,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(data.imageUrl!),
                            fit: BoxFit.cover),
                        color: AppColors.green,
                        shape: BoxShape.circle),
                  ),
                  SizedBox(width: context.width * 0.07),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.goodMorning,
                          style: AppTextStyle.poppinsRegular12),
                      Text(data.name!, style: AppTextStyle.poppinsBold20),
                    ],
                  )
                ],
              ),
            ),
          ),
          loading: () => const CustomCircleIndicator(color: AppColors.green),
          error: (error, _) => Center(
              child: Text(
            error.toString(),
            style: AppTextStyle.poppinsBold12.copyWith(color: Colors.red),
          )),
        );
  }
}
