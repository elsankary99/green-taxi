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
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: countryCode! + phoneNumber!,
        timeout: const Duration(seconds: 15),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    }
  }

//!Error
  void verificationFailed(FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      log('The provided phone number is not valid.');
      state = const LoginError('The provided phone number is not valid.');
    } else {
      log(e.toString());

      state = LoginError(e.toString());
    }
  }

//* Code Sent
  void codeSent(String verificationId, int? resendToken) {
    state = PhoneNumberSubmitted();
    log('PhoneNumberSubmitted');

    this.verificationId = verificationId;
  }

  Future<void> verificationCompleted(PhoneAuthCredential credential) async {
    log("verificationCompleted==");
    await signIn(credential);
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    log("codeAutoRetrievalTimeout");
  }

  Future<void> submitOtpCode() async {
    state = OtpLoading();
    log(smsCode!);
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode!);

      await signIn(credential);
    } catch (e) {
      state = LoginError(e.toString());
    }
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    log("signIn *&*&");

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      state = OtpCodeSubmitted();
    } catch (e) {
      state = LoginError(e.toString());
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    state = UserLogOut();
  }

  User get getLoggedInUser {
    return FirebaseAuth.instance.currentUser!;
  }
}
