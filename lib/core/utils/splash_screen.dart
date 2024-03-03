import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'enums.dart';
import 'error_dialog.dart';
import 'general_background.dart';
import 'loading_indicator_util.dart';
import '../resources/assetss_path.dart';
import '../global/global_varibles.dart';
import '../resources/localizations.dart';
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
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<CachingUserDataBloc>(context).add(GetCachedLanguageEvent());
    BlocProvider.of<CachingUserDataBloc>(context).add(GetCachedUserDataEvent());
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
              if (state.getCachedLanguageState == RequestState.success) {
                _handleLanguageCaching(state.language);
              }
              if (state.getCacheUserDataState == RequestState.success) {
                _handleCacheSuccess(state.userCachedData);
              }
              if (state.getCacheUserDataState == RequestState.error) {
                _navigateToSignInScreen();
              }
            },
            child: GeneralBackground(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(child: Image.asset(ImagesPath.splashIconPath)),
                  SizedBox(
                    height: DoubleManager.d_20.h,
                    child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: LoadingIndicatorUtil(),
                    ),
                  ),
                ],
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

  /// this method to handle cached language to determine the language of the endpoints.
  void _handleLanguageCaching(DeviceLanguage language) {
    GlobalVariables().setDeviceLanguage = language;
    AppLocal.languageNotifier.value = language;
  }
}
