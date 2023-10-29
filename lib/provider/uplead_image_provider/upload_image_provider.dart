import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_image_state.dart';

final uploadImageProvider =
    StateNotifierProvider<UploadImageProvider, UploadImageState>(
        (ref) => UploadImageProvider());

class UploadImageProvider extends StateNotifier<UploadImageState> {
  UploadImageProvider() : super(UploadImageInitial());
  File? file;
  String? imageUrl;
  Future<void> fiendImage(ImageSource source) async {
    try {
      state = UploadImageLoading();
      final ImagePicker picker = ImagePicker();
      final image = await picker.pickImage(source: source);
      if (image == null) {
        state = NotSelectedImage();
        return;
      }

      file = File(image.path);
      await uploadImage();
    } catch (e) {
      state = UploadImageError(e.toString());
    }
  }

  Future<void> uploadImage() async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref("users_images")
          .child(FirebaseAuth.instance.currentUser!.uid);

      await storageRef.putFile(file!);
      imageUrl = await storageRef.getDownloadURL();
      state = UploadImageSuccess();
    } on FirebaseException catch (e) {
      log(e.toString());

      state = UploadImageError(e.toString());
    }
  }
}
