import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/view/widgets/profile_widget/custom_text_field.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const CustomTextField(
                icon: FontAwesomeIcons.solidUser, title: AppStrings.name),
            const CustomTextField(
                icon: FontAwesomeIcons.house, title: AppStrings.homeAddress),
            const CustomTextField(
                icon: FontAwesomeIcons.briefcase,
                title: AppStrings.businessAddress),
            const CustomTextField(
                icon: FontAwesomeIcons.cartShopping,
                title: AppStrings.shoppingCenter),
            SizedBox(height: context.height * 0.045)
          ],
        ));
  }
}
