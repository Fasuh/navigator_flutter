import 'package:flutter/material.dart';
import 'package:navigator_test/core/app/navigator/navigator.dart';
import 'package:navigator_test/features/navigation_feature/presentation/screens/first_screen.dart';
import 'package:navigator_test/injection_container.dart';
import 'package:navigator_test/app_config.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer().init();
  AppConfig.init;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirstScreen().setAsBaseScreen();
    return MaterialApp(
      onGenerateRoute: (routeSettings) => CustomNavigator.router.generator(routeSettings),
      navigatorKey: CustomNavigator.navigatorKey,
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(),
    );
  }
}
