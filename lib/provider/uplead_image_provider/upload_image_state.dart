part of 'upload_image_provider.dart';

abstract class UploadImageState {
  const UploadImageState();
}

class UploadImageInitial extends UploadImageState {}

class UploadImageLoading extends UploadImageState {}

class UploadImageSuccess extends UploadImageState {}

class UploadImageError extends UploadImageState {
  final String message;
  const UploadImageError(this.message);
}
