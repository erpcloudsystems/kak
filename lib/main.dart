import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
import 'core/resources/routes.dart';
import 'core/utils/splash_screen.dart';
import 'core/global/bloc_observer.dart';
import 'core/resources/theme_manager.dart';
import 'core/global/state_management.dart';
import 'core/resources/localizations.dart';
import 'core/resources/strings_manager.dart';
import 'core/global/dependencies_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: AppLocal.supportLocals,
      path: AppLocal.path,
      child: MultiBlocProvider(
        providers: StateManagement.providers,
        child: Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: UnTranslatedStrings.appName,
            theme: AppTheme.getApplicationLightTheme(),
            home: const SplashScreen(),
            routes: Routes.routes,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          ),
        ),
      ),
    );
  }
}
