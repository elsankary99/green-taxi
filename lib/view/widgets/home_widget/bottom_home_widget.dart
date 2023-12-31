import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/provider/map_provider/map_provider.dart';

class BottomHomeWidget extends ConsumerWidget {
  const BottomHomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(mapProvider.notifier);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 22.r,
              backgroundColor: AppColors.white,
              child: const Icon(
                Icons.notifications,
                color: AppColors.green,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await provider.moveToMyCurrentLocation();
            },
            child: CircleAvatar(
              radius: 22.r,
              backgroundColor: AppColors.green,
              child: const Icon(
                Icons.my_location_outlined,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
