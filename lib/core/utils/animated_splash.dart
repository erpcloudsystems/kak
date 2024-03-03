import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'splash_screen.dart';
import '../resources/assetss_path.dart';

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
