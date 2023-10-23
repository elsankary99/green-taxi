import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_taxi/core/constant/app_colors.dart';
import 'package:green_taxi/core/extension/emdia_query.dart';
import 'package:green_taxi/core/widget/custom_dialog.dart';
import 'package:green_taxi/provider/uplead_image_provider/upload_image_provider.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends ConsumerWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(uploadImageProvider.notifier);
    ref.listen(
      uploadImageProvider,
      (previous, next) {},
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
                shape: BoxShape.circle,
                image: provider.file != null
                    ? DecorationImage(
                        image: FileImage(provider.file!), fit: BoxFit.fill)
                    : null),
            child: provider.file == null
                ? Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.white,
                    size: 35.sp,
                  )
                : null,
          )),
    );
  }
}
