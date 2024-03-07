import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:homey/core/services/loading_service.dart';
import 'package:homey/core/theme/application_theme.dart';
import 'package:homey/layout/home_layout.dart';
import 'package:homey/pages/login_screen/login_screen.dart';
import 'package:homey/pages/onBoarding_screens/onboarding_screens.dart';
import 'package:homey/pages/register_screen/register_screen.dart';
import 'package:homey/pages/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  configLoading();
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
        HomeLayout.routeName: (context) => const HomeLayout(),
      },
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
      theme: ApplicationTheme.appTheme,
    );
  }
}
