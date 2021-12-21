import 'package:flutter/material.dart';
import 'package:onicent/widgets/empty_screen.dart';

class NotificationsSettingsScreen extends StatefulWidget {
  const NotificationsSettingsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsSettingsScreenState createState() =>
      _NotificationsSettingsScreenState();
}

class _NotificationsSettingsScreenState
    extends State<NotificationsSettingsScreen> {
  BoxDecoration borderBottom = const BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: Color(0xFFF1F1F8),
        width: 1.0,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: "Cài đặt thông báo",
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Nhắc nhở',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                ButtonSelect(
                  title: 'APP',
                  decoration: borderBottom,
                ),
                const ButtonSelect(
                  title: 'Email',
                )
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Lưu ý quan trọng',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                ButtonSelect(
                  title: 'APP',
                  decoration: borderBottom,
                ),
                const ButtonSelect(
                  title: 'Email',
                )
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Mở vị thế',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                ButtonSelect(
                  title: 'APP',
                  decoration: borderBottom,
                ),
                const ButtonSelect(
                  title: 'Email',
                )
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Tin tức',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                ButtonSelect(
                  title: 'APP',
                  decoration: borderBottom,
                ),
                const ButtonSelect(
                  title: 'Email',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonSelect extends StatefulWidget {
  final String title;
  final BoxDecoration? decoration;
  const ButtonSelect({Key? key, required this.title, this.decoration})
      : super(key: key);

  @override
  State<ButtonSelect> createState() => _ButtonSelectState();
}

class _ButtonSelectState extends State<ButtonSelect> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.decoration,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 16),
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            activeTrackColor: Colors.blue[600],
            activeColor: const Color(0xFF223CC6),
          )
        ],
      ),
    );
  }
}
