import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_taxi/app.dart';
import 'package:green_taxi/core/function/auth_state_changes.dart';
import 'package:green_taxi/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  authStateChanges();
  runApp(const ProviderScope(child: MyApp()));
}
