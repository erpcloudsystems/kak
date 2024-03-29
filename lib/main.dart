import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mumo/core/utils/splash_screen.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
import 'core/utils/enums.dart';
import 'core/resources/routes.dart';
import 'core/global/bloc_observer.dart';
import 'core/resources/localizations.dart';
import 'core/global/state_management.dart';
import 'core/resources/theme_manager.dart';
import 'core/resources/strings_manager.dart';
import 'core/global/dependencies_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        builder: (context, orientation, deviceType) => ValueListenableBuilder(
          valueListenable: AppLocal.languageNotifier,
          builder: (context, value, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: UnTranslatedStrings.appName,
            theme: AppTheme.getApplicationLightTheme(),
            home: const SplashScreen(),
            locale: value == DeviceLanguage.arabic
                ? const Locale('ar')
                : const Locale('en'),
            routes: Routes.routes,
            localizationsDelegates: AppLocal.localizationsDelegates,
            supportedLocales: AppLocal.supportLocals,
          ),
        ),
      ),
    );
  }
}