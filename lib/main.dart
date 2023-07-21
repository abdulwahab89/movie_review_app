import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_review_app/Screens/sign_up.dart';
import 'package:movie_review_app/Screens/splash_screen.dart';
import 'package:movie_review_app/res/routes/route.dart';
import 'package:movie_review_app/res/routes/route_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteClass.generateRoute,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: SplashScreen(),
    );
  }
}
