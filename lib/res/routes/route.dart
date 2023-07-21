import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_review_app/Screens/base_screen.dart';
import 'package:movie_review_app/Screens/login_screen.dart';
import 'package:movie_review_app/Screens/sign_up.dart';
import 'package:movie_review_app/Screens/splash_screen.dart';
import 'route_names.dart';

class RouteClass {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loginRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RouteNames.signUpRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUp());
      case RouteNames.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RouteNames.baseScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const BaseScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
