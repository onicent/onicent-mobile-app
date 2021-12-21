import 'package:flutter/material.dart';
import '../../../widgets/widgets.dart';
import '../../../utilities/locales/flutter_locales.dart';

class SecuritySettingsScreen extends StatefulWidget {
  const SecuritySettingsScreen({Key? key}) : super(key: key);

  @override
  _SecuritySettingsScreenState createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
  Icon iconArrow = const Icon(
    Icons.arrow_forward_ios,
    color: Color(0xFF8D8C8C),
    size: 14,
  );

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: Locales.string(context, 'setting'),
      body: ListView(
        children: [
          MenuItem(
            borderBottom: true,
            borderTop: true,
            title: Locales.string(context, 'change_password'),
            subTitle: Locales.string(context, 'change_the_login_password'),
            onTap: () {
              Navigator.of(context).push(
                createRoute(const ChangePasswordScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: Locales.string(context, 'change_password'),
      body: ListView(
        children: <Widget>[
          _TextInput(
            title: Locales.string(context, 'current_password'),
          ),
          _TextInput(
            title: Locales.string(context, 'new_password'),
          ),
          _TextInput(
            title: Locales.string(context, 're_enter_new_password'),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Text(
              Locales.string(context, 'change_password_note'),
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 35),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: const Text(
                      'Bạn có chắc chắn bạn muốn đăng xuất?.',
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            textColor: const Color(0xFF272728),
                            onPressed: () {},
                            child: const Text('Hủy bỏ'),
                          ),
                          FlatButton(
                            textColor: const Color(0xFF286DEA),
                            onPressed: () {},
                            child: const Text('Xác nhận'),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              child: Container(
                height: 45,
                child: FractionallySizedBox(
                  widthFactor:
                      1, // means 100%, you can change this to 0.8 (80%)
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF286DEA),
                      primary: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Thêm',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _TextInput({
    String title = '',
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1.0, color: Color(0xFFF5F8FD)),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          const Flexible(
            child: TextField(
              obscureText: true,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
