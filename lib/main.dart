import 'package:bitnet/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import './utilities/locales/flutter_locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'vi']); // get last saved language
  // remove await async (to get system language as default)

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        title: 'Bitnet',
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Typography',
          colorScheme: colorScheme,
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 66.0, fontStyle: FontStyle.italic),
            headline3: TextStyle(fontSize: 56.0, fontStyle: FontStyle.italic),
            headline4: TextStyle(fontSize: 46.0, fontStyle: FontStyle.italic),
            headline5: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            headline6: TextStyle(fontSize: 36.0),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}

const ColorScheme colorScheme = ColorScheme(
  primary: Color(0xFF3771D5), // Appbar Background
  onPrimary: Colors.white, // Appbar text color
  primaryVariant: Color(0xFF117378),
  secondary: Color(0xFF3771D5),
  secondaryVariant: Color(0xFFFAFBFB),
  background: Colors.white,
  surface: Color(0xFF808080),
  onBackground: Colors.white,
  error: Colors.redAccent,
  onError: Colors.redAccent,
  onSecondary: Color(0xFF221F26), //body color
  onSurface: Color(0xFF241E30),
  brightness: Brightness.light, // Body background color
);
