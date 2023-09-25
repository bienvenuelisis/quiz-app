import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../welcome/welcome_screen.dart';
import 'gradient_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4)).then((_) => {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()))
        });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(
          child: Lottie.asset("assets/lottiesfiles/tropheea.json"),
          /*child: Image.asset(
            "assets/images/logo",
          ),*/
        ),
      ),
    );
  }
}
