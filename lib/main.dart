import 'package:flutter/material.dart';
import 'package:homey/core/theme/application_theme.dart';
import 'package:homey/pages/login_screen/login_screen.dart';
import 'package:homey/pages/onBoarding_screens/onboarding_screens.dart';
import 'package:homey/pages/register_screen/register_screen.dart';
import 'package:homey/pages/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        OnBoarding.routeName: (context) => const OnBoarding(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
      },
      theme: ApplicationTheme.appTheme,
    );
  }
}
