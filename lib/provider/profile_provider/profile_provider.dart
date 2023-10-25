import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_taxi/data/model/user_model/user_model.dart';

part 'profile_state.dart';

final getUserDataProvider = FutureProvider<UserModel>((ref) async {
  //TODO: add uid
  // final uid = FirebaseAuth.instance.currentUser!.uid;
  final user = await FirebaseFirestore.instance
      .collection('users')
      .doc("wVUePRhgfdctKXZNjJrB4c020P83")
      .get();
  final data = user.data();
  return UserModel.fromJson(data!);
});

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
      if (imageUrl != null) {
        profileFormKey.currentState!.save();
        state = ProfileLoading();
        log("ProfileLoading");
        try {
          await users.doc(FirebaseAuth.instance.currentUser!.uid).set(
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
      } else {
        state = NullImage();
      }
    }
  }
}
