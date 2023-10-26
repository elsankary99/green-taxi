import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/data/model/user_model/user_model.dart';
import 'package:green_taxi/provider/profile_provider/profile_provider.dart';
import 'package:green_taxi/view/widgets/profile_widget/custom_text_field.dart';

class MyProfileForm extends ConsumerWidget {
  const MyProfileForm({
    required this.data,
    super.key,
  });
  final UserModel data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(profileProvider.notifier);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: provider.profileFormKey,
          child: Column(
            children: [
              CustomTextField(
                  controller: TextEditingController(text: data.name),
                  onSaved: (name) {
                    provider.name = name;
                  },
                  icon: FontAwesomeIcons.solidUser,
                  title: AppStrings.name),
              CustomTextField(
                  controller: TextEditingController(text: data.homeAddress),
                  onSaved: (homeAddress) {
                    provider.homeAddress = homeAddress;
                  },
                  icon: FontAwesomeIcons.house,
                  title: AppStrings.homeAddress),
              CustomTextField(
                  controller: TextEditingController(text: data.businessAddress),
                  onSaved: (businessAddress) {
                    provider.businessAddress = businessAddress;
                  },
                  icon: FontAwesomeIcons.briefcase,
                  title: AppStrings.businessAddress),
              CustomTextField(
                  controller: TextEditingController(text: data.shoppingCenter),
                  onSaved: (shoppingCenter) {
                    provider.shoppingCenter = shoppingCenter;
                  },
                  icon: FontAwesomeIcons.cartShopping,
                  title: AppStrings.shoppingCenter),
              SizedBox(height: context.height * 0.045)
            ],
          ),
        ));
  }
}
