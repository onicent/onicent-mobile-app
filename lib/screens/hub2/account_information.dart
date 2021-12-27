import 'package:flutter/material.dart';
import 'package:onicent/widgets/empty_screen.dart';
import 'package:onicent/widgets/menu_item.dart';

class AccountInformationScreen extends StatefulWidget {
  const AccountInformationScreen({Key? key}) : super(key: key);

  @override
  _AccountInformationScreenState createState() =>
      _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  BoxDecoration borderBottom = BoxDecoration(
    border: Border(
      bottom: BorderSide(width: 0.0, color: Color(0xFFF5F8FD)),
    ),
  );
  Icon iconArrow = Icon(
    Icons.arrow_forward_ios,
    color: Color(0xFF8D8C8C),
    size: 14,
  );

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: "Account info",
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFFF6D36),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, spreadRadius: 0.1),
                  ],
                ),
                margin: EdgeInsets.only(top: 10.0, bottom: 8.0),
                // padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Center(
                  child: ClipOval(
                    child: Image.network(
                      "https://mcnewsmd1.keeng.net/netnews/archive/images/2021/02/20/tinngan_080110_7085894_3.jpg",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ProfileItem(
            title: 'Tên',
            child: Text(
              'Y DŨNG KUAN',
              style: TextStyle(fontSize: 15),
            ),
            decoration: borderBottom,
          ),
          ProfileItem(
            title: 'Tên đăng nhập',
            child: Text(
              '305056408',
              style: TextStyle(fontSize: 15),
            ),
            decoration: borderBottom,
          ),
          ProfileItem(
            title: 'Xác thực',
            child: Text(
              'Đã xác thực',
              style: TextStyle(fontSize: 15),
            ),
            decoration: borderBottom,
            icon: Icon(
              Icons.verified,
              size: 15,
              color: Colors.green,
            ),
          ),
          ProfileItem(
            title: 'Email',
            child: Text(
              'ydugkuan@gmail.com',
              style: TextStyle(fontSize: 15),
            ),
            decoration: borderBottom,
          ),
          ProfileItem(
            title: 'Số điện thoại',
            child: Text(
              '0372788066',
              style: TextStyle(fontSize: 15),
            ),
            decoration: borderBottom,
            icon: Icon(
              Icons.check_circle,
              size: 15,
              color: Colors.green,
            ),
          ),
          ProfileItem(
            title: 'Ngày sinh',
            child: Text(
              '03-01-1997',
              style: TextStyle(fontSize: 15),
            ),
            decoration: borderBottom,
            icon: iconArrow,
          ),
          ProfileItem(
            title: 'Địa chỉ',
            child: Text(
              'Cali',
              style: TextStyle(fontSize: 15),
            ),
            decoration: borderBottom,
            icon: iconArrow,
          ),
          ProfileItem(
            title: 'Ngày gia nhập',
            child: Text(
              '07-09-2020',
              style: TextStyle(fontSize: 15),
            ),
            icon: Icon(
              Icons.check_circle,
              size: 15,
              color: Colors.green,
            ),
          ),
          ProfileItem(
            title: 'Zalo',
            child: Text(
              'Zalo',
              style: TextStyle(fontSize: 15),
            ),
            icon: iconArrow,
          ),
          ProfileItem(
            title: 'Facebook',
            child: Text(
              '305056408',
              style: TextStyle(fontSize: 15),
            ),
            icon: iconArrow,
          ),
          ProfileItem(
            title: 'Telegram',
            child: Text(
              'Đã xác thực',
              style: TextStyle(fontSize: 15),
            ),
            icon: iconArrow,
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatefulWidget {
  final String title;
  final Widget? child;
  final Widget? icon;
  final Function()? onTab;
  final BoxDecoration? decoration;

  const ProfileItem(
      {Key? key,
      required this.title,
      this.child,
      this.icon,
      this.onTab,
      this.decoration})
      : super(key: key);

  @override
  _ProfileItemState createState() => _ProfileItemState(
      title: this.title,
      child: this.child,
      icon: this.icon,
      onTab: this.onTab,
      decoration: this.decoration);
}

class _ProfileItemState extends State<ProfileItem> {
  String title;
  Widget? child;
  Widget? icon;
  Function()? onTab;
  BoxDecoration? decoration;

  _ProfileItemState(
      {required this.title,
      this.child,
      this.icon,
      this.onTab,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: decoration,
      child: InkWell(
        onTap: onTab,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: child,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: icon,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
