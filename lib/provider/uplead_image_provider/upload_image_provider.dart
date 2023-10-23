import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_image_state.dart';

final uploadImageProvider =
    StateNotifierProvider<UploadImageProvider, UploadImageState>(
        (ref) => UploadImageProvider());

class UploadImageProvider extends StateNotifier<UploadImageState> {
  UploadImageProvider() : super(UploadImageInitial());
  File? file;
  Future<void> fiendImage(ImageSource source) async {
    try {
      state = UploadImageLoading();
      final ImagePicker picker = ImagePicker();
      final image = await picker.pickImage(source: source);
      if (image == null) return;

      file = File(image.path);
      log(image.path);
      state = UploadImageSuccess();
    } catch (e) {
      state = UploadImageError(e.toString());
    }
  }
}
