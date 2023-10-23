import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/core/widget/custom_circle_indicator.dart';
import 'package:green_taxi/core/widget/custom_toast.dart';
import 'package:green_taxi/provider/profile_provider/profile_provider.dart';
import 'package:green_taxi/provider/uplead_image_provider/upload_image_provider.dart';
import 'package:green_taxi/view/widgets/profile_widget/custom_button.dart';
import 'package:green_taxi/view/widgets/profile_widget/profile_form.dart';
import 'package:green_taxi/view/widgets/profile_widget/top_green_widget.dart';

@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageProvider = ref.read(uploadImageProvider.notifier);
    final provider = ref.read(profileProvider.notifier);
    final state = ref.watch(profileProvider);
    ref.listen(
      profileProvider,
      (previous, next) {
        if (next is ProfileError) {
          customToast(title: next.message, color: Colors.red);
        }
        if (next is ProfileAddedSuccessfully) {
          customToast(title: "Successfully Added");
        }
      },
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: TopGreenWidget()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
          const SliverToBoxAdapter(child: ProfileForm()),
          SliverToBoxAdapter(
              child: state is ProfileLoading
                  ? const CustomCircleIndicator(
                      color: AppColors.green,
                    )
                  : CustomButton(
                      onPressed: () async {
                        provider.imageUrl = imageProvider.imageUrl;
                        await provider.addingUserData();
                      },
                    )),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.04))
        ],
      ),
    );
  }
}
