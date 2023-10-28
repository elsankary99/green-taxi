import 'package:flutter/material.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_images.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/view/widgets/otp_widget/custom_back_button.dart';

class TopGreenMask extends StatelessWidget {
  const TopGreenMask({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.35,
      child: Stack(
        children: [
          Container(
            height: context.height * 0.27,
            width: context.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.assetsImagesMask),
                    fit: BoxFit.fill)),
            child: Column(children: [
              SizedBox(height: context.height * 0.08),
              Text(
                title,
                style:
                    AppTextStyle.poppinsBold24.copyWith(color: AppColors.white),
              )
            ]),
          ),
          Positioned(
              top: context.height * 0.075,
              left: context.width * 0.05,
              child: const CustomBackButton()),
        ],
      ),
    );
  }
}
