import 'package:onicent/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import './screens/splash_screen.dart';
import './theming/theme_manager.dart';
import 'package:provider/provider.dart';

import 'utilities/locales/flutter_locales.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Locales.init(['en', 'vi']); // get last saved language

  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => LocaleBuilder(
        builder: (locale) => GetMaterialApp(
          // smartManagement: SmartManagement.keepFactory,
          title: 'Onicent',
          localizationsDelegates: Locales.delegates,
          supportedLocales: Locales.supportedLocales,
          locale: locale,
          theme: theme.getTheme(),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
