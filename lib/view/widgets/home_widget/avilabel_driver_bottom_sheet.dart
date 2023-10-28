import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_images.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/view/widgets/home_widget/driver_card.dart';

availableDriverBottomSheet(BuildContext context) {
  List<String> cards = [
    "**** **** **** 4645",
    "**** **** **** 5465",
    "**** **** **** 1356",
    "**** **** **** 6354",
  ];
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r))),
    builder: (context) {
      return Container(
        height: context.height * 0.4,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r))),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
                child: Container(
              margin: EdgeInsets.only(top: 14.h),
              height: context.height * 0.005,
              width: context.width * 0.3,
              color: AppColors.light,
            )),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h),
              child: Text(
                AppStrings.selectAnOption,
                style: AppTextStyle.poppinsBold18,
              ),
            ),
            SizedBox(
              height: context.height * 0.16,
              width: double.infinity,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {}, child: const DriverCard());
                },
              ),
            ),
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
                ))
          ]),
        ),
      );
    },
  );
}
