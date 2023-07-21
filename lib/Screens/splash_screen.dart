import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_review_app/Screens/login_screen.dart';
import 'package:movie_review_app/splash_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices sp = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      sp.isLogin(context);
    });
  }

  List<String> movieQoutes = [
    "May the Force be with you.” -Star Wars, 1977",
    " “There's no place like home.” -The Wizard of Oz, 1939",
    "“I'm the king of the world!” -Titanic, 1997",
    "“Carpe diem. Seize the day, boys. Make your lives extraordinary.” -Dead Poets Society, 1989",
    "Elementary, my dear Watson.” -The Adventures of Sherlock Holmes, 1939",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 300,
              width: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/logo.png'),
              )),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {});
            },
            child: Text(
              movieQoutes[DateTime.now().second % 4],
              style: const TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
