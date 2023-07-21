import 'package:flutter/material.dart';
import 'package:movie_review_app/firebase_services/auth_services/auth_services.dart';
import 'package:movie_review_app/res/routes/route_names.dart';
import 'package:movie_review_app/utils/components/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: 'Enter email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.signUpRoute);
              },
              child: const Text("Don't have an account? Sign up")),
          RoundButton(
              title: 'Login',
              onPress: () {
                AuthServices.loginAccount(_emailController.text.toString(),
                    _passwordController.text.toString(), context);
              }),
        ],
      ),
    );
  }
}
