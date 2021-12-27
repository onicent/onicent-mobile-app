import 'package:flutter/material.dart';
import '../../../widgets/widgets.dart';
import '../../../utilities/locales/locales.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  Icon done = const Icon(
    Icons.done,
    color: Color(0xFF608AF5),
    size: 18,
  );

  @override
  Widget build(BuildContext context) {
    final String locationLanguage = Locales.string(context, 'localization');
    return EmptyScreen(
      title: Locales.string(context, 'select_language'),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Locales.change(context, 'vi');
            },
            child: MenuItem(
              borderTop: true,
              title: "Tiếng việt",
              trailing: locationLanguage == 'vi' ? done: null,
              arrow: false,
            ),
          ),
          InkWell(
            onTap: () {
              Locales.change(context, 'en');
            },
            child: MenuItem(
              borderBottom: true,
              title: "English",
              trailing: locationLanguage == 'en' ? done: null,
              arrow: false,
            ),
          ),
        ],
      ),
    );
  }
}
