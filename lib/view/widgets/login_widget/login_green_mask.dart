import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_taxi/core/constant/app_images.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';

class LoginGreenMask extends StatelessWidget {
  const LoginGreenMask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.assetsImagesMask), fit: BoxFit.cover)),
        height: context.height * 0.64,
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.assetsImagesLeafIcon),
            SizedBox(height: context.height * 0.04),
            SvgPicture.asset(Assets.assetsImagesGreenTaxi),
          ],
        ));
  }
}
