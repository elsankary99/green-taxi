import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/view/widgets/login_widget/login_green_mask.dart';
import 'package:green_taxi/view/widgets/otp_widget/custom_back_button.dart';
import 'package:green_taxi/view/widgets/otp_widget/otp_buttom_text.dart';
import 'package:green_taxi/view/widgets/otp_widget/otp_field_widget.dart';
import 'package:green_taxi/view/widgets/otp_widget/otp_top_text.dart';

@RoutePage()
class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: Stack(
            children: [
              const LoginGreenMask(),
              Positioned(
                  top: context.height * 0.075,
                  left: context.width * 0.05,
                  child: const CustomBackButton())
            ],
          )),
          const SliverToBoxAdapter(child: OTPTopText()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
          const SliverToBoxAdapter(child: OtpFieldWidget()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
          const SliverToBoxAdapter(child: OTPBottomText()),
        ],
      ),
    );
  }
}
