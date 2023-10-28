import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/provider/map_provider/map_provider.dart';
import 'package:green_taxi/view/widgets/home_widget/avilabel_driver_bottom_sheet.dart';

class BottomSheetIcon extends ConsumerWidget {
  const BottomSheetIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(mapProvider.notifier);
    ref.watch(mapProvider);
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          availableDriverBottomSheet(context);
        },
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
            color: provider.showRoad ? AppColors.green : AppColors.light,
          )),
        ),
      ),
    );
  }
}
