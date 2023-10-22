import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/constant/app_text_style.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/view/widgets/login_widget/country_code.dart';
import 'package:green_taxi/view/widgets/login_widget/custom_text_field.dart';
import 'package:green_taxi/view/widgets/login_widget/login_green_mask.dart';
import 'package:green_taxi/view/widgets/login_widget/top_text.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: LoginGreenMask()),
          const SliverToBoxAdapter(child: TopText()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1, child: CountryCodeWidget()),
                  // SizedBox(width: context.width * 0.02),
                  Expanded(flex: 3, child: CustomTextFormField()),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
          SliverToBoxAdapter(
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: AppTextStyle.poppinsRegular12,
                    children: const [
                      TextSpan(text: "${AppStrings.byCreating}\n"),
                      TextSpan(
                          text: AppStrings.termsOfService,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: AppStrings.and),
                      TextSpan(
                          text: AppStrings.privacyPolicy,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ])),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: context.height * 0.02),
          ),
        ],
      ),
    );
  }
}
