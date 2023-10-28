import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/provider/map_provider/map_provider.dart';
import 'package:green_taxi/view/widgets/home_widget/availabel_drivers_list.dart';
import 'package:green_taxi/view/widgets/home_widget/select_payment_card.dart';

class DriverBottomSheet extends ConsumerWidget {
  const DriverBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider1 = ref.read(mapProvider.notifier);

    return Container(
      height: context.height * 0.4,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r))),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
              child: Container(
            margin: EdgeInsets.only(top: 14.h),
            height: context.height * 0.005,
            width: context.width * 0.3,
            color: provider1.showRoad ? AppColors.green : AppColors.light,
          )),
          provider1.showRoad
              ? const Column(
                  children: [
                    AvailableDriverList(),
                    SelectPaymentCard(),
                  ],
                )
              : SizedBox(
                  height: 200.h,
                  child: Center(
                    child: Text(
                      "Search For a Place First",
                      style: AppTextStyle.poppinsBold20,
                    ),
                  ),
                )
        ]),
      ),
    );
  }
}
