import 'package:flutter/material.dart';
import 'package:movie_review_app/firebase_services/auth_services/auth_services.dart';
import 'package:movie_review_app/res/routes/route_names.dart';
import 'package:movie_review_app/utils/components/round_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'Enter email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.loginRoute);
              },
              child: Text("Already have an account? Login")),
          RoundButton(
              title: 'Sign up',
              onPress: () {
                AuthServices.signUpAccount(_emailController.text.toString(),
                    _passwordController.text.toString(), context);
              }),
        ],
      ),
    );
  }
}
