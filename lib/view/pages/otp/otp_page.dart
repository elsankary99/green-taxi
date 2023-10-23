import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/core/router/app_router.dart';
import 'package:green_taxi/core/widget/custom_circle_indicator.dart';
import 'package:green_taxi/core/widget/custom_toast.dart';
import 'package:green_taxi/provider/login_provider/login_provider.dart';
import 'package:green_taxi/view/widgets/login_widget/login_green_mask.dart';
import 'package:green_taxi/view/widgets/otp_widget/custom_back_button.dart';
import 'package:green_taxi/view/widgets/otp_widget/otp_buttom_text.dart';
import 'package:green_taxi/view/widgets/otp_widget/otp_field_widget.dart';
import 'package:green_taxi/view/widgets/otp_widget/otp_top_text.dart';

@RoutePage()
class OTPPage extends ConsumerWidget {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);
    ref.listen(
      loginProvider,
      (previous, next) {
        if (next is LoginError) {
          customToast(title: next.message, color: Colors.red);
        }
        if (next is OtpCodeSubmitted) {
          customToast(title: "Your Number Added Successfully");
          context.router.replaceAll([const ProfileRoute()]);
        }
      },
    );
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
                  child: state is OtpLoading
                      ? const SizedBox()
                      : const CustomBackButton())
            ],
          )),
          const SliverToBoxAdapter(child: OTPTopText()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
          SliverToBoxAdapter(
              child: state is OtpLoading
                  ? const CustomCircleIndicator(
                      color: AppColors.green,
                    )
                  : const OtpFieldWidget()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
          const SliverToBoxAdapter(child: OTPBottomText()),
        ],
      ),
    );
  }
}
