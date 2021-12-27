import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:badges/badges.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../screens/sign_in_screen.dart';
import '../../theming/theme_manager.dart';
import '../../utilities/locales/locales.dart';
import 'package:provider/provider.dart';

// import '../../utilities/locales/flutter_locales.dart';
import '../../widgets/widgets.dart';

// Screen
import 'bank_link/bank_link_screen.dart';
import 'base_currency.dart';
import 'choose_country_screen.dart';
import 'notification/notification_screen.dart';
import 'profile/account_information.dart';
import 'identify_verification/account_verification.dart';
import 'profile/profile_screen.dart';
import 'refer_friends.dart';
import 'ChangePasswordScreen.dart';
import 'language.dart';
import 'contact_and_feedback.dart';
import 'about_us.dart';

class HubScreen extends StatefulWidget {
  const HubScreen({Key? key}) : super(key: key);

  @override
  _HubScreenState createState() => _HubScreenState();
}

class _HubScreenState extends State<HubScreen> {
  bool isVerify = true;
  bool isNotification = false;
  final avatar = 'assets/icons/ic_vector_gift_box.png';
  final userName = 'JOE NATA SA';
  final accountID = '8587895005';

  late final AudioCache _audioCache;
  bool _setSwitch = false;

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
      prefix: 'assets/audios/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
    Timer(const Duration(seconds: 2), () {
      _audioCache.play('ringtone.mp3');
      setState(() {
        isNotification = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final thmode = Provider.of<ThemeNotifier>(context);

    return EmptyScreen(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      // appBar: AppBar(
      //   title: Text('Cá nhân'),
      //   automaticallyImplyLeading: false,
      // ),
      body: ListView(
        children: <Widget>[
          GroupItem(children: [
            Item(
              height: 80,
              onTap: () {
                Navigator.of(context).push(createRoute(const ProfileScreen()));
              },
              leading: Image.asset(
                avatar,
                width: 55.0,
              ),
              titleStyle:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
              title: userName,
              subTitle: accountID,
            ),
          ]),
          _titleGroup(title: 'Thông tin chung'),
          GroupItem(children: [
            if (isVerify) ...[
              Item(
                borderBottom: true,
                onTap: () {
                  Navigator.of(context)
                      .push(createRoute(const NotificationScreen()));
                },
                leading: Image.asset(
                  'assets/icons/ic_kyc.png',
                  width: 30.0,
                ),
                title: Locales.string(context, 'identity_verification'),
                subTitle: 'Định danh tài khoản',
                trailing: Container(
                  child: const Icon(
                    Icons.gpp_maybe,
                    color: Colors.redAccent,
                    size: 18,
                  ),
                ),
              ),
            ],
            Item(
              borderBottom: true,
              onTap: () {
                Navigator.of(context)
                    .push(createRoute(const NotificationScreen()));
              },
              leading: Image.asset(
                'assets/icons/ic_notify_ring.png',
                width: 30.0,
              ),
              title: Locales.string(context, 'account_notification'),
              subTitle: 'Tin nhắn hoặc thông báo đến',
              trailing: (() {
                if (isNotification) {
                  return Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    child: const Icon(
                      Icons.circle_notifications,
                      color: Colors.red,
                      size: 16,
                    ),
                  );
                }
              }()),
            ),
            Item(
              borderBottom: true,
              onTap: () {
                Navigator.of(context).push(createRoute(const BaseCurrency()));
              },
              leading: Image.asset(
                'assets/icons/ic_bank.png',
                width: 30.0,
              ),
              title: 'Đồng tiền cở',
              trailing: Text('VNDT'),
            ),
            Item(
              borderBottom: true,
              onTap: () {
                Navigator.of(context).push(createRoute(const BankLinkScreen()));
              },
              leading: Image.asset(
                'assets/icons/ic_vector_ic_add_money.png',
                width: 30.0,
              ),
              title: 'Tài khoản ngân hàng',
              subTitle: 'Thêm tài khoản ngân hàng',
            ),
            Item(
              onTap: () {
                Navigator.of(context)
                    .push(createRoute(const ReferFriendsScreen()));
              },
              leading: Image.asset(
                'assets/icons/ic_egift.png',
                width: 30.0,
              ),
              title: Locales.string(context, 'refer_friends'),
              subTitle: 'Giới thiệu bạn bè để nhận thưởng',
            ),
          ]),
          _titleGroup(title: 'Cài đặt'),
          GroupItem(
            children: [
              Item(
                borderBottom: true,
                onTap: () {
                  Navigator.of(context)
                      .push(createRoute(const LanguageScreen()));
                },
                leading: Icon(Icons.translate),
                title: Locales.string(context, 'language'),
                trailing: Text(
                  Locales.string(context, 'location_language'),
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Item(
                borderBottom: true,
                onTap: () {
                  Navigator.of(context)
                      .push(createRoute(const ChangePasswordScreen()));
                },
                leading: Icon(Icons.lock),
                title: Locales.string(context, 'change_password'),
                subTitle: Locales.string(context, 'change_the_login_password'),
              ),
              Item(
                borderBottom: true,
                onTap: () {},
                leading: Icon(Icons.notifications_active),
                trailing: Switch(
                  value: _setSwitch,
                  onChanged: (bool newValue) {
                    setState(() {
                      _setSwitch = newValue;
                    });
                  },
                  activeColor: Colors.amber,
                ),
                title: 'Thông báo',
                subTitle: 'Tắt hoặc mở thông báo',
              ),
              Item(
                borderBottom: true,
                onTap: () {},
                leading: Icon(Icons.fingerprint),
                trailing: Switch(
                  value: _setSwitch,
                  onChanged: (bool newValue) {
                    setState(() {
                      _setSwitch = newValue;
                    });
                  },
                  activeColor: Colors.amber,
                ),
                title: 'Touch ID/Face ID',
                subTitle: 'Nâng cao bảo mật',
              ),
              Item(
                borderBottom: false,
                onTap: () {},
                leading: Icon(Icons.security),
                trailing: Switch(
                  value: _setSwitch,
                  onChanged: (bool newValue) {
                    setState(() {
                      _setSwitch = newValue;
                    });
                  },
                  activeColor: Colors.amber,
                ),
                title: 'Smart OTP',
                subTitle: 'Nâng cao bảo mật',
              ),
              Item(
                borderBottom: false,
                onTap: () {},
                leading: Icon(Icons.dark_mode),
                trailing: Switch(
                  value: _setSwitch,
                  onChanged: (bool newValue) {
                    setState(() {
                      _setSwitch = newValue;
                      thmode.setLightMode();
                    });
                  },
                  activeColor: Colors.amber,
                ),
                title: 'Giao diện',
                subTitle: 'Nâng cao bảo mật',
              ),
            ],
          ),
          _titleGroup(title: 'khác'), // Help and feedback
          GroupItem(children: [
            Item(
              borderBottom: true,
              onTap: () {
                Navigator.of(context)
                    .push(createRoute(const ChooseCountryScreen()));
              },
              leading: Icon(Icons.location_on),
              title: 'Quốc gia',
              subTitle: '',
            ),
            Item(
              borderBottom: true,
              onTap: () {
                Navigator.of(context)
                    .push(createRoute(const ContactAndFeedbackScreen()));
              },
              leading: const Icon(Icons.confirmation_number),
              title: Locales.string(context, 'contact_and_feedback'),
              subTitle: 'Giải đáp thắc mắc và hỗ trợ',
            ),
            Item(
              borderBottom: true,
              onTap: () {
                Navigator.of(context).push(createRoute(const AboutUsScreen()));
              },
              leading: Icon(Icons.info),
              title: Locales.string(context, 'about_us'),
            ),
            Item(
              onTap: () {
                Navigator.of(context)
                    .push(createRoute(const ContactAndFeedbackScreen()));
              },
              leading: Icon(Icons.call),
              title: 'Đường dây nóng: 1900512562',
            ),
          ]),

          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Icon(Icons.facebook, color: Colors.white),
                ),
                SizedBox(width: 15.0),
                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Icon(
                    Icons.smart_display,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 15.0),
                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
          GroupItem(
            children: [
              InkWell(
                onTap: () => Get.offAll(SignInScreen()),
                child: Ink(
                  height: 55.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.logout, size: 22.0),
                      SizedBox(width: 5.0),
                      Text(
                        'Đăng xuất',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Phiên bản ',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                Text(
                  '1.0.0',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleGroup({String? title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Text(
        '$title',
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
