import 'dart:async';

// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'enums.dart';
import 'error_dialog.dart';
import '../resources/assetss_path.dart';
import '../global/global_varibles.dart';
import '../resources/values_manager.dart';
import '../../../../core/resources/routes.dart';
import '../../modules/authentication/domain/entities/user.dart';
import '../../modules/authentication/domain/entities/user_caching_data_entity.dart';
import '../../modules/authentication/presentation/bloc/caching_user_data/caching_user_data_bloc.dart';
import '../../modules/authentication/presentation/bloc/regular_sign/authentication_bloc.dart';

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

  void _whenVideoIntroEnd() {
    if (_controller.value.position >= _controller.value.duration) {
      getDeviceLanguage();
      BlocProvider.of<CachingUserDataBloc>(context)
          .add(GetCachedUserDataEvent());
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
        duration: const Duration(milliseconds: IntManager.i_200),
        child: VideoPlayer(_controller),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<AuthenticationBloc, AuthenticationState>(
        listenWhen: (previous, current) =>
            previous.signInState != current.signInState,
        listener: (context, state) {
          if (state.signInState == RequestState.success) {
            final globalVariables = GlobalVariables();
            globalVariables.setSid = state.loggedInUser.sid!;
            _navigateToHomeScreen();
          } else if (state.signInState == RequestState.error) {
            _handleSignInError(state.signInMessage);
          }
        },
        child: Scaffold(
          body: BlocListener<CachingUserDataBloc, CachingUserDataState>(
            listener: (context, state) {
              if (state.getCacheUserDataState == RequestState.success) {
                _handleCacheSuccess(state.userCachedData);
              }
              if (state.getCacheUserDataState == RequestState.error) {
                _navigateToSignInScreen();
              }
            },
            child: Center(
              child: Stack(
                children: [_buildVideoPlayer()],
              ),
            ),
          ),
        ),
      );

  //_______________ This is the logic for handling the auto login _______________
  void _handleCacheSuccess(UserCachingDataEntity cachedUser) {
    BlocProvider.of<AuthenticationBloc>(context).add(
      SignInEvent(
        user: UserEntity(
          password: cachedUser.password,
          email: cachedUser.email,
        ),
      ),
    );
  }

  void _navigateToHomeScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.navigationBarScreenKey, (route) => false);
  }

  void _handleSignInError(String errorMessage) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.signInScreenKey, (route) => false);
    showDialog(
      context: context,
      builder: (context) => ErrorDialog(errorMessage: errorMessage),
    );
  }

  void _navigateToSignInScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.navigationBarScreenKey, (route) => false);
  }
  //_____________________________________________________________________________

  // Get the device
  void getDeviceLanguage() {
    final gv = GlobalVariables();
    final currentLocale = Intl.getCurrentLocale();
    debugPrint(currentLocale);
    if (currentLocale == 'ar_EG') {
      gv.setDeviceLanguage = DeviceLanguage.arabic;
    } else {
      gv.setDeviceLanguage = DeviceLanguage.english;
    }
  }
}
