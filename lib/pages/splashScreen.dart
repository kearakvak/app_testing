import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app_tesing/services/auth/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset(
                "assets/Lottie/Animation - 1722078128804.json"),
          )
        ],
      ),
      nextScreen: LoginOrRegister(),
      splashIconSize: 400,
      backgroundColor: Color.fromARGB(255, 226, 207, 131),
    );
  }
}
