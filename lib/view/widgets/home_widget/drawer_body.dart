import 'package:flutter/material.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/view/widgets/home_widget/drawer_item.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerItem(title: AppStrings.paymentHistory, onTap: () {}),
        DrawerItem(title: AppStrings.rideHistory, onTap: () {}, title2: "2"),
        DrawerItem(title: AppStrings.inviteFriends, onTap: () {}),
        DrawerItem(title: AppStrings.promoCodes, onTap: () {}),
        DrawerItem(title: AppStrings.settings, onTap: () {}),
        DrawerItem(title: AppStrings.support, onTap: () {}),
        DrawerItem(title: AppStrings.logOut, onTap: () {}),
      ],
    );
  }
}
