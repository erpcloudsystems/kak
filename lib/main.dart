import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'core/resources/routes.dart';
import 'core/utils/splash_screen.dart';
import 'core/global/bloc_observer.dart';
import 'core/resources/fonts_manager.dart';
import 'core/resources/theme_manager.dart';
import 'core/resources/colors_manager.dart';
import 'core/resources/strings_manager.dart';
import 'core/global/dependencies_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // MultiBlocProvider(
        //   providers: StateManagement.providers,
        // child:
        Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        title: StringsManager.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getApplicationLightTheme(),
        routes: Routes.routes,
        home: const SplashScreen(),
      ),
      // ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: ColorsManager.mainColor),
            ),
            Text(
              ' اختبار نص عربي لاكاديمية المستقبل وشركتنا الموقرة',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorsManager.mainColor, fontSize: FontsSize.s20),
            ),
            Text(
              '$_counter',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: ColorsManager.mainColor),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: ColorsManager.mainColor,
        child: const Icon(
          Icons.add,
          color: ColorsManager.secondaryColor,
        ),
      ),
    );
  }
}
