import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/view/widgets/home_widget/drawer_header_widget.dart';

class HomeDrawerWidget extends ConsumerWidget {
  const HomeDrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Drawer(
      child: Column(children: [
        DrawerHeaderWidget(),
        Divider(
          color: AppColors.light,
          thickness: 1,
        )
      ]),
    );
  }
}
