import 'package:flutter/cupertino.dart';
import 'flutter_locales.dart';

extension LocalesExtension on BuildContext {
  Locales? get locales => Locales.of(this);
  changeLocale(String lang) => Locales.change(this, lang);
  Locale? get currentLocale => Locales.currentLocale(this);
  String localeString(String key) => Locales.string(this, key);
}
