import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/constant/app_strings.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/core/widget/custom_circle_indicator.dart';
import 'package:green_taxi/core/widget/custom_toast.dart';
import 'package:green_taxi/data/model/user_model/user_model.dart';
import 'package:green_taxi/provider/profile_provider/profile_provider.dart';
import 'package:green_taxi/provider/uplead_image_provider/upload_image_provider.dart';
import 'package:green_taxi/view/widgets/my_profile_widget/my_profile_form.dart';
import 'package:green_taxi/view/widgets/my_profile_widget/top_green_profile.dart';
import 'package:green_taxi/view/widgets/profile_widget/custom_button.dart';

@RoutePage()
class MyProfilePage extends ConsumerWidget {
  const MyProfilePage({this.data, super.key});
  final UserModel? data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);
    final provider = ref.read(profileProvider.notifier);
    final imageProvider = ref.read(uploadImageProvider.notifier);

    ref.listen(
      profileProvider,
      (previous, next) {
        if (next is UpdateProfileError) {
          Toast.errorToast(context, message: next.message);
        }
        if (next is NullImage) {
          Toast.errorToast(context, message: "Please Enter Your Profile Image");
        }
        if (next is UpdateProfileSuccessfully) {
          ref.invalidate(getUserDataProvider);
          Toast.successToast(context, message: "Update Successfully");
        }
      },
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: TopGreenProfile(imageUrl: data!.imageUrl!)),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
          SliverToBoxAdapter(child: MyProfileForm(data: data!)),
          SliverToBoxAdapter(
              child: state is UpdateProfileLoading
                  ? const CustomCircleIndicator(
                      color: AppColors.green,
                    )
                  : CustomButton(
                      title: AppStrings.update,
                      onPressed: () async {
                        provider.imageUrl =
                            imageProvider.imageUrl ?? data!.imageUrl;
                        await provider.updatingUserData();
                      },
                    )),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.04))
        ],
      ),
    );
  }
}
