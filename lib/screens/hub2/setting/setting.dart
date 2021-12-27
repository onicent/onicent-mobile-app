import 'package:flutter/material.dart';
import '../../../widgets/widgets.dart';
import '../../../utilities/locales/flutter_locales.dart';

import '../../sign_in_screen.dart';
import 'language.dart';
import 'security_settings.dart';
import 'notifications_settings.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {


  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: Locales.string(context, 'setting'),
      body: Column(
        children: <Widget>[
          MenuItem(
            title: Locales.string(context, 'language'),
            onTap: () {
              Navigator.of(context).push(
                createRoute(const LanguageScreen()),
              );
            },
            trailing: Text(
              Locales.string(context, 'location_language'),
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          MenuItem(
            title: Locales.string(context, 'security_Settings'),
            onTap: () {
              Navigator.of(context).push(
                createRoute(const SecuritySettingsScreen()),
              );
            },
          ),
          MenuItem(
            title: Locales.string(context, 'notification_settings'),
            onTap: () {
              Navigator.of(context).push(
                createRoute(const NotificationsSettingsScreen()),
              );
            },
          ),
          MenuItem(
            title: Locales.string(context, 'clear_cache'),
            trailing: Text(
              '13.21 MB',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          MenuItem(
            borderBottom: true,
            arrow: false,
            title: Locales.string(context, 'version_number'),
            trailing: Text(
              'Bitnet v1.0.0',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: const Text(
                      'Bạn có chắc chắn bạn muốn đăng xuất?.',
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Hủy bỏ', style: TextStyle(color: Color(0xFF272728), fontSize: 16),),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
                            },
                            child: const Text('Xác nhận', style: TextStyle(color: Color(0xFF286DEA), fontSize: 16),),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              child: SizedBox(
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Locales.string(context, 'log_out'),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
