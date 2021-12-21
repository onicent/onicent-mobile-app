import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../utilities/locales/flutter_locales.dart';
import '../../widgets/widgets.dart';

// Screen
import 'notifications.dart';
import 'account_information.dart';
import 'bank_link.dart';
import 'identify_verification/account_verification.dart';
import 'refer_friends.dart';
import 'setting/setting.dart';
import 'contact_and_feedback.dart';
import 'trading_guide.dart';
import 'statement_and_agreement.dart';
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

  SizedBox SpaceHeight = const SizedBox(height: 13.0);
  // automaticallyImplyLeading: false,
  late final AudioCache _audioCache;

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
      prefix: 'assets/audios/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
    Timer(const Duration(seconds: 2), (){
      _audioCache.play('ringtone.mp3');
      setState(() {
        isNotification =true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: Locales.string(context, 'individual'),
      titleFontWeight: FontWeight.w600,
      iconBack: false,
      body: ListView(
        children: <Widget>[
          MenuItem(
            height: 70,
            borderTop: true,
            borderBottom: true,
            leading: Image.asset(
              avatar,
              width: 50.0,
            ),
            title: userName,
            subTitle: '0372788066',
            onTap: () {
              Navigator.of(context)
                  .push(createRoute(const AccountInformationScreen()));
            },
          ),
          SpaceHeight,
          if (isVerify) ...[
            MenuItem(
              borderTop: true,
              borderBottom: true,
              onTap: () {
                Navigator.of(context)
                    .push(createRoute(const AccountVerificationScreen()));
              },
              leading: Image.asset(
                'assets/icons/ic_kyc.png',
                width: 30.0,
              ),
              title: Locales.string(context, 'identity_verification'),
              trailing: Container(
                margin: const EdgeInsets.only(right: 15.0),
                child: const Icon(
                  Icons.gpp_maybe,
                  color: Colors.redAccent,
                  size: 18,
                ),
              ),
            ),
            SpaceHeight,
          ],
          MenuItem(
            borderTop: true,
            onTap: () {
              Navigator.of(context)
                  .push(createRoute(const NotificationScreen()));
            },
            leading: Image.asset(
              'assets/icons/ic_notify_ring.png',
              width: 30.0,
            ),
            title: Locales.string(context, 'account_notification'),
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
          MenuItem(
            onTap: () {
              Navigator.of(context)
                  .push(createRoute(const BankLinkScreen()));
            },
            leading: Image.asset(
              'assets/icons/ic_credit_card.png',
              width: 30.0,
            ),
            title: Locales.string(context, 'bank_account_link'),
          ),
          MenuItem(
            borderBottom: true,
            onTap: () {
              Navigator.of(context)
                  .push(createRoute(const ReferFriendsScreen()));
            },
            leading: Image.asset(
              'assets/icons/ic_egift.png',
              width: 30.0,
            ),
            title: Locales.string(context, 'refer_friends'),
          ),
          SpaceHeight,
          MenuItem(
            borderTop: true,
            borderBottom: true,
            onTap: () {
              Navigator.of(context)
                  .push(createRoute(const SettingScreen()));
            },
            leading:
            Image.asset('assets/icons/ic_setting.png', width: 30.0),
            title: Locales.string(context, 'setting'),
          ),
          SpaceHeight,
          MenuItem(
            borderTop: true,
            onTap: () {
              Navigator.of(context)
                  .push(createRoute(const ContactAndFeedbackScreen()));
            },
            leading: Image.asset(
              'assets/icons/ic_support_center.png',
              width: 30.0,
            ),
            title: Locales.string(context, 'contact_and_feedback'),
          ),
          MenuItem(
            onTap: () {
              Navigator.of(context)
                  .push(createRoute(const TradingGuideScreen()));
            },
            leading: Image.asset(
              'assets/icons/ic_link.png',
              width: 30.0,
            ),
            title: Locales.string(context, 'trading_guide'),
            trailing: Container(
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFFF6D36),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, spreadRadius: 0.1),
                ],
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Row(
                children: const [
                  Text(
                    'Video',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          MenuItem(
            borderBottom: true,
            onTap: () {
              Navigator.of(context)
                  .push(createRoute(const AboutUsScreen()));
            },
            leading: Image.asset(
              'assets/icons/ic_info.png',
              width: 30.0,
            ),
            title: Locales.string(context, 'about_us'),
          ),
        ],
      ),
    );
  }
}
