import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "Login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        body: Image.asset(
      "assets/images/login_background.png",
      width: mediaQuery.width,
      height: mediaQuery.height,
      fit: BoxFit.cover,
    ));
  }
}
