import 'package:firebase_core/firebase_core.dart';
import 'package:first_app_with_auth/login.dart';
import 'package:first_app_with_auth/sign_up.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: SignUpView(),
    home: LoginView(),
  ));
}
