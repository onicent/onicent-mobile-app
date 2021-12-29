import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/storage_manager.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xff141621),
      ),
      backgroundColor: Color(0xff090d18),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
      elevation: 0.0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Color(0xff090d18),
    backgroundColor: Color(0xff1b212d),
    buttonColor: Color(0xFF1273fe),
    dividerColor: Color(0xff222a39),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff141621),
      selectedItemColor: Color(0xFF303e9f),
      unselectedLabelStyle: TextStyle(
        height: 1.3,
        fontWeight: FontWeight.w400,
      ),
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        height: 1.4,
      ),
      type: BottomNavigationBarType.fixed,
    ),
    inputDecorationTheme: const InputDecorationTheme(
        // fillColor: Color(0xffffffff),
        fillColor: Color(0xff2a374b),

        filled: true),
  );

  final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFFFFF),
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(
        color: Colors.black87,
      ),
      elevation: 0.0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xFF303E9F),
      ),
    ),
    scaffoldBackgroundColor: Color(0xFFf6f7fb),
    backgroundColor: Color(0xFFFFFFFF),
    buttonColor: Color(0xFF1273FE),
    dividerColor: Color(0xffedf1ff),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFFFFFFF),
      selectedItemColor: Color(0xFF303e9f),
      unselectedLabelStyle: TextStyle(
        height: 1.3,
        fontWeight: FontWeight.w400,
      ),
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        height: 1.4,
      ),
      type: BottomNavigationBarType.fixed,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      // fillColor: Color(0xFFD3D6D9),
      fillColor: Color(0xFFFFFFFF),
      filled: true,
      hintStyle: TextStyle(
        fontSize: 16.0
      )
    ),
  );

  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
    return 0;
  }

  setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
    return 1;
  }
}
