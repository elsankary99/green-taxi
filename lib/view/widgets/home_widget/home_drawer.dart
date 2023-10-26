import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/view/widgets/home_widget/bottom_drawer.dart';
import 'package:green_taxi/view/widgets/home_widget/drawer_body.dart';
import 'package:green_taxi/view/widgets/home_widget/drawer_header_widget.dart';

class HomeDrawerWidget extends ConsumerWidget {
  const HomeDrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        const SliverToBoxAdapter(child: DrawerHeaderWidget()),
        const SliverToBoxAdapter(
            child: Divider(color: AppColors.light, thickness: 1)),
        const SliverToBoxAdapter(child: DrawerBody()),
        SliverToBoxAdapter(child: SizedBox(height: context.height * 0.08)),
        const SliverToBoxAdapter(
            child: Divider(color: AppColors.light, thickness: 1)),
        const SliverToBoxAdapter(child: BottomDrawer()),
      ]),
    );
  }
}
