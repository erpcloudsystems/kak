import 'dart:async';

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/assetss_path.dart';
import '../resources/values_manager.dart';
import '../../../../core/resources/routes.dart';

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

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _visible = false;

  void _initializeVideoController() async {
    _controller = VideoPlayerController.asset(VideosPaths.splashPath);
    await _controller.initialize();
    _controller.setLooping(false);

    Timer(
        const Duration(milliseconds: IntManager.i_200),
        () => setState(() {
              _controller.play();
              _visible = true;
            }));
  }

  void _navigateToHomeScreen() =>
      Navigator.of(context).pushReplacementNamed(Routes.navigationBarScreenKey);

  void _whenVideoIntroEnd() {
    if (_controller.value.position >= _controller.value.duration) {
      _navigateToHomeScreen();
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _initializeVideoController();
    _controller.addListener(_whenVideoIntroEnd);
  }

  Widget _buildVideoPlayer() => AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 1000),
        child: VideoPlayer(_controller),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Stack(
            children: [_buildVideoPlayer()],
          ),
        ),
      );
}
