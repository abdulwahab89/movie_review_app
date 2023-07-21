import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_review_app/utils/utils.dart';
import 'package:movie_review_app/res/routes/route_names.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> signUpAccount(
      String email, String password, BuildContext context) async {
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Utils.messageBar("Successfully registered");
      Navigator.pushNamed(context, RouteNames.loginRoute);
    }).onError((error, stackTrace) {
      print(email);
      Utils.messageBar(error.toString());
    });
  }

  static Future<void> loginAccount(
      String email, String password, BuildContext context) async {
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Utils.messageBar("Successfully logged in!");

      Navigator.pushNamed(context, RouteNames.baseScreen);
    }).onError((error, stackTrace) {
      Utils.messageBar(error.toString());
    });
  }
}
