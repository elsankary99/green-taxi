import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/provider/profile_provider/profile_provider.dart';
import 'package:green_taxi/view/widgets/profile_widget/custom_button.dart';
import 'package:green_taxi/view/widgets/profile_widget/profile_form.dart';
import 'package:green_taxi/view/widgets/profile_widget/top_green_widget.dart';

@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(profileProvider.notifier);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: TopGreenWidget()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
          const SliverToBoxAdapter(child: ProfileForm()),
          SliverToBoxAdapter(child: CustomButton(
            onPressed: () {
              provider.addingUserData();
            },
          )),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.04))
        ],
      ),
    );
  }
}
