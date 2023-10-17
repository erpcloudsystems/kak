// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// import 'request_state.dart';
// import '../global/global_varibles.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/resources/images_path.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: IntManager.i_6)).whenComplete(() =>
        // BlocProvider.of<CachingBloc>(context).add(GetCachedApiKeysEvent()),
       Navigator.of(context)
            .pushNamedAndRemoveUntil(Routes.signInScreenKey, (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return
        // BlocListener<CachingBloc, CachingState>(
        //   listener: (context, state) {
        //     if (state.getCachedApiKeysState == RequestState.success) {
        //       final globalVariables = GlobalVariables();
        //       globalVariables.setApiSecret = state.apiKeys.apiSecret;
        //       globalVariables.setApiKey = state.apiKeys.apiKey;
        //       Navigator.of(context)
        //           .pushNamedAndRemoveUntil(Routes.homeScreenKey, (route) => false);
        //     }
        //     if (state.getCachedApiKeysState == RequestState.error) {
        //       Navigator.of(context)
        //           .pushNamedAndRemoveUntil(Routes.loginScreenKey, (route) => false);
        //     }
        //   },
        //   child:
        Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image(
            image: const AssetImage(ImagesPath.logoPath),
            height: DoubleManager.d_50.h,
            width: DoubleManager.d_70.w,
          )),
          const LoadingIndicatorUtil(),
        ],
      ),
      // ),
    );
  }
}
