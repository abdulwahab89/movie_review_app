import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_review_app/Screens/base_screen.dart';
import 'package:movie_review_app/Screens/login_screen.dart';
import 'package:movie_review_app/Screens/sign_up.dart';

class SplashServices {
  final _auth = FirebaseAuth.instance;
  Future<void> isLogin(BuildContext context) async {
    if (_auth.currentUser != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const BaseScreen()));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }
}
