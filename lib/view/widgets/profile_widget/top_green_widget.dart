import 'package:flutter/material.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_images.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/view/widgets/profile_widget/profile_image.dart';

class TopGreenWidget extends StatelessWidget {
  const TopGreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.35,
      child: Stack(
        children: [
          Container(
            height: context.height * 0.25,
            width: context.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.assetsImagesMask),
                    fit: BoxFit.fill)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                AppStrings.profileSettings,
                style:
                    AppTextStyle.poppinsBold24.copyWith(color: AppColors.white),
              )
            ]),
          ),
          const ProfileImage()
        ],
      ),
    );
  }
}
