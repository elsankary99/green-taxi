import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/view/widgets/login_widget/enter_number_widget.dart';
import 'package:green_taxi/view/widgets/login_widget/login_green_mask.dart';
import 'package:green_taxi/view/widgets/login_widget/terms_privecy_text_widget.dart';
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
          const SliverToBoxAdapter(child: EnterNumberWidget()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
          const SliverToBoxAdapter(child: TermsPrivacyTextWidget()),
        ],
      ),
    );
  }
}
