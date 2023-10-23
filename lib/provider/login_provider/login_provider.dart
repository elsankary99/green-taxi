import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'login_state.dart';

final loginProvider =
    StateNotifierProvider<LoginProvider, LoginState>((ref) => LoginProvider());

class LoginProvider extends StateNotifier<LoginState> {
  LoginProvider() : super(LoginInitial());
  String? phoneNumber;
  String? countryCode;
  late String verificationId;
  String? smsCode;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  Future<void> verifyPhoneNumber() async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      log(countryCode! + phoneNumber!);
      state = LoginLoading();
      // await FirebaseAuth.instance.verifyPhoneNumber(
      //   phoneNumber: countryCode! + phoneNumber!,
      //   verificationCompleted: (PhoneAuthCredential credential) {},
      //   verificationFailed: verificationFailed,
      //   codeSent: codeSent,
      //   codeAutoRetrievalTimeout: (String verificationId) {},
      // );
    }
  }

//!Error
  void verificationFailed(FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      log('The provided phone number is not valid.');
      state = const LoginError('The provided phone number is not valid.');
    } else {
      state = LoginError(e.toString());
    }
  }

//* Code Sent
  void codeSent(String verificationId, int? resendToken) {
    state = PhoneNumberSubmitted();
    log('PhoneNumberSubmitted');

    this.verificationId = verificationId;
  }

  Future<void> submitOtpCode() async {
    state = OtpLoading();
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode!);

      await FirebaseAuth.instance.signInWithCredential(credential);
      state = OtpCodeSubmitted();
    } catch (e) {
      state = LoginError(e.toString());
    }
  }
}
