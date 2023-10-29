import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/router/app_router.dart';
import 'package:green_taxi/core/widget/custom_dialog.dart';
import 'package:green_taxi/core/widget/custom_toast.dart';
import 'package:green_taxi/provider/login_provider/login_provider.dart';
import 'package:green_taxi/view/widgets/home_widget/drawer_item.dart';

class DrawerBody extends ConsumerWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(loginProvider.notifier);
    ref.listen(
      loginProvider,
      (previous, next) {
        if (next is UserLogOut) {
          context.router.replaceAll([const LoginRoute()]);
          Toast.successToast(context, message: "Successfully LogOut");
        }
      },
    );
    return Column(
      children: [
        DrawerItem(
            title: AppStrings.paymentHistory,
            onTap: () {
              context.router.push(const MyCardsRoute());
            }),
        DrawerItem(title: AppStrings.rideHistory, onTap: () {}, title2: "2"),
        DrawerItem(title: AppStrings.inviteFriends, onTap: () {}),
        DrawerItem(title: AppStrings.promoCodes, onTap: () {}),
        DrawerItem(title: AppStrings.settings, onTap: () {}),
        DrawerItem(title: AppStrings.support, onTap: () {}),
        DrawerItem(
            title: AppStrings.logOut,
            onTap: () {
              showMyDialog(context,
                  btnTitle: AppStrings.logOut,
                  header: AppStrings.logOut,
                  title: AppStrings.sureLogOut, onPressed: () async {
                await provider.logOut();
              });
            }),
      ],
    );
  }
}
