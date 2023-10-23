import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'profile_state.dart';

final profileProvider = StateNotifierProvider<ProfileProvider, ProfileState>(
    (ref) => ProfileProvider());

class ProfileProvider extends StateNotifier<ProfileState> {
  ProfileProvider() : super(ProfileInitial());
  String? imageUrl;
  String? name;
  String? homeAddress;
  String? businessAddress;
  String? shoppingCenter;
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addingUserData() async {
    if (profileFormKey.currentState!.validate()) {
      profileFormKey.currentState!.save();
      state = ProfileLoading();
      log("ProfileLoading");
      try {
        await users.doc().set(
          {
            "image_url": imageUrl,
            "name": name,
            "home_address": homeAddress,
            "business_address": businessAddress,
            "shopping_center": shoppingCenter,
          },
        );
        log("ProfileAddedSuccessfully");
        state = ProfileAddedSuccessfully();
      } catch (e) {
        state = ProfileError(e.toString());
        log("Profile ${e.toString()}");
      }
    }
  }
}