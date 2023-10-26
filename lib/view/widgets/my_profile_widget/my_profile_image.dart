import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/core/widget/custom_dialog.dart';
import 'package:green_taxi/core/widget/custom_toast.dart';
import 'package:green_taxi/provider/uplead_image_provider/upload_image_provider.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileImage extends ConsumerWidget {
  const MyProfileImage({
    required this.imageUrl,
    super.key,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(uploadImageProvider.notifier);
    ref.listen(
      uploadImageProvider,
      (previous, next) {
        if (next is UploadImageError) {
          Toast.errorToast(context, message: next.message);
        }
        if (next is UploadImageSuccess) {
          Toast.successToast(context, message: "Image Added Successfully");
        }
        if (next is UploadImageLoading) {
          context.router.pop();
        }
      },
    );
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
          onTap: () {
            getImage(
              context,
              galleryBtn: () async {
                await provider.fiendImage(ImageSource.gallery);
              },
              cameraBtn: () async {
                await provider.fiendImage(ImageSource.camera);
              },
            );
          },
          child: Container(
            height: context.height * 0.2,
            width: context.width * 0.35,
            decoration: BoxDecoration(
                color: AppColors.grey,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.green,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 5,
                  )
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover)),
            // child: state is UploadImageLoading
            //     ? const CustomCircleIndicator(
            //         color: AppColors.green,
            //       )
            //     : provider.file == null
            //         ? Icon(
            //             Icons.camera_alt_outlined,
            //             color: AppColors.white,
            //             size: 35.sp,
            //           )
            //         : null,
          )),
    );
  }
}
