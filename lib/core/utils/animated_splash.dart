import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mumo/core/resources/assetss_path.dart';
import 'package:mumo/core/utils/splash_screen.dart';

class AnimatedSplash extends StatelessWidget {
  const AnimatedSplash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: ImagesPath.splashIconPath,
      nextScreen: const SplashScreen(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Colors.white,
      splashIconSize: 300,
    );
  }
}
