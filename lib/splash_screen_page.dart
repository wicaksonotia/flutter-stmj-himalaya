import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:stmjhimalaya/login_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Lottie.asset(
        'assets/images/splash_screen.json',
        // fit: BoxFit.cover,
      ),
      nextScreen: const LoginPage(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
      splashIconSize: 150,
    );
  }
}
