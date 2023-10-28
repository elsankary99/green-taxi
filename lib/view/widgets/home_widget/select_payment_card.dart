import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_images.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';

class SelectPaymentCard extends StatelessWidget {
  const SelectPaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> cards = [
      "**** **** **** 4645",
      "**** **** **** 5465",
      "**** **** **** 1356",
      "**** **** **** 6354",
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: const Divider(thickness: 1),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  Assets.assetsImagesVisa,
                  height: context.height * 0.065,
                ),
                DropdownButton(
                  value: cards[0],
                  items: cards
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: AppColors.green),
                  child: const Text(AppStrings.confirm),
                )
              ],
            )),
      ],
    );
  }
}
