part of 'profile_provider.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileAddedSuccessfully extends ProfileState {}

class NullImage extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;
  const ProfileError(this.message);
}

//? update
class UpdateProfileLoading extends ProfileState {}

class UpdateProfileSuccessfully extends ProfileState {}

class UpdateProfileError extends ProfileState {
  final String message;
  const UpdateProfileError(this.message);
}
