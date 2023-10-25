import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_images.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/core/router/app_router.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      if (FirebaseAuth.instance.currentUser != null) {
        final user = FirebaseAuth.instance.currentUser;
        final profile = await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get();
        if (profile.exists) {
          router.replace(const HomeRoute());
        } else {
          router.replace(const ProfileSettingRoute());
        }
      } else {
        router.replace(const LoginRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(
          Assets.assetsImagesSplash,
          height: context.height * 0.45,
        ),
      ),
    );
  }
}
