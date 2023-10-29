part of 'login_provider.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class UserLogOut extends LoginState {}

class LoginLoading extends LoginState {}

class OtpLoading extends LoginState {}

class PhoneNumberSubmitted extends LoginState {}

class OtpCodeSubmitted extends LoginState {}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);
}
