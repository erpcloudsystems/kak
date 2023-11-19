import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kak/modules/authentication/presentation/pages/sign_up_screen.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
import 'core/resources/routes.dart';
import 'core/utils/splash_screen.dart';
import 'core/global/bloc_observer.dart';
import 'core/resources/theme_manager.dart';
import 'core/global/state_management.dart';
import 'core/resources/strings_manager.dart';
import 'core/global/dependencies_container.dart' as di;
import 'modules/authentication/presentation/pages/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: StateManagement.providers,
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          title: StringsManager.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getApplicationLightTheme(),
          routes: Routes.routes,
          // home: const SplashScreen(),
          home: const SignInScreen(),
        ),
      ),
    );
  }
}
