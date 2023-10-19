import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/resources/images_path.dart';
import '../../../../core/resources/routes.dart';
import '../resources/values_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: IntManager.i_3),
    )..forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacementNamed(Routes.homeScreenKey);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: _animationController,
          child: Image.asset(
            ImagesPath.splashLogoPath,
            width: DoubleManager.d_50.w,
            height: DoubleManager.d_25.h,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

/// We refactor this code to handle auth and caching.

// @override
//   // void initState() {
//   //   super.initState();
//   //   Future.delayed(const Duration(seconds: IntManager.i_6)).whenComplete(() =>
//   //       // BlocProvider.of<CachingBloc>(context).add(GetCachedApiKeysEvent()),
//   //       Navigator.of(context)
//   //           .pushNamedAndRemoveUntil(Routes.signInScreenKey, (route) => false));
//   // }

 // BlocListener<CachingBloc, CachingState>(
//         //   listener: (context, state) {
//         //     if (state.getCachedApiKeysState == RequestState.success) {
//         //       final globalVariables = GlobalVariables();
//         //       globalVariables.setApiSecret = state.apiKeys.apiSecret;
//         //       globalVariables.setApiKey = state.apiKeys.apiKey;
//         //       Navigator.of(context)
//         //           .pushNamedAndRemoveUntil(Routes.homeScreenKey, (route) => false);
//         //     }
//         //     if (state.getCachedApiKeysState == RequestState.error) {
//         //       Navigator.of(context)
//         //           .pushNamedAndRemoveUntil(Routes.loginScreenKey, (route) => false);
//         //     }
//         //   },