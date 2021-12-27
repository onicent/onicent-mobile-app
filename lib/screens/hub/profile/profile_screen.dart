import 'package:flutter/material.dart';
import '../../../widgets/empty_screen.dart';
import '../../../widgets/group_item.dart';
import '../../../widgets/item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      body: ListView(
        children: [

          Container(
            height: 180.0,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/cover_large.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Image.asset('assets/icons/crypto/Ripple-icon.png', width: 50.0),
          ),

          GroupItem(
            children: [
              Item(
                borderBottom: true,
                title: 'Họ tên',
                arrow: false,
                trailing: Row(
                  children: [
                    Text(
                      'Y Dũng Kuan',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
              ),
              Item(
                borderBottom: true,
                arrow: false,
                title: 'Tên đăng nhập',
                trailing: Row(
                  children: [
                    Text(
                      '852436505',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),

              ),
              Item(
                title: 'Xác thực KYC',
                arrow: false,
                borderBottom: true,
                trailing: Row(
                  children: [
                    Text(
                      'Đã xác thực',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Icon(Icons.check_circle, color: Colors.green, size: 18.0),
                    ),
                  ],
                ),
              ),

              Item(
                borderBottom: true,
                title: 'Loại tài khoản',
                arrow: false,
                trailing: Row(
                  children: [
                    Text(
                      'Cá nhân',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Icon(Icons.check_circle, color: Colors.green, size: 18.0),
                    ),
                  ],
                ),

              ),
              Item(
                borderBottom: true,
                title: 'Email',
                arrow: false,
                trailing: Row(
                  children: [
                    Text(
                      'ydungkuan@gmail.com',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Icon(Icons.check_circle, color: Colors.green, size: 18.0),
                    ),
                  ],
                ),

              ),
              Item(
                title: 'Số điện thoại',
                arrow: false,
                trailing: Row(
                  children: [
                    Text(
                      '0372788055',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Icon(Icons.check_circle, color: Colors.green, size: 18.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          GroupItem(
            children: [
              Item(
                borderBottom: true,
                title: 'Ngày sinh',
                arrow: false,
                trailing: Row(
                  children: [
                    Text(
                      '03-12-1999',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Icon(Icons.drive_file_rename_outline),
                    ),
                  ],
                ),

              ),
              Item(
                borderBottom: true,
                title: 'Giới tính',
                arrow: false,
                trailing: Row(
                  children: [
                    Text(
                      'Nam',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Icon(Icons.drive_file_rename_outline),
                    ),
                  ],
                ),

              ),

              Item(
                borderBottom: true,
                title: 'Địa chỉ',
                arrow: false,
                trailing: Row(
                  children: [
                    Text(
                      'HCM - Việt Nam',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Icon(Icons.drive_file_rename_outline),
                    ),
                  ],
                ),

              ),
              Item(
                borderBottom: true,
                title: 'Ngày tham gia',
                arrow: false,
                trailing: Row(
                  children: [
                    Text(
                      '20-12-2021',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Icon(Icons.check_circle, color: Colors.green, size: 18.0),
                    ),
                  ],
                ),

              ),
            ],
          ),
          GroupItem(
            children: [
              Item(
                borderBottom: true,
                title: 'Facebook',
                arrow: false,
                trailing: Row(
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Icon(Icons.drive_file_rename_outline),
                    ),
                  ],
                ),

              ),
              Item(
                borderBottom: true,
                title: 'Zalo',
                arrow: false,
                trailing: Row(
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Icon(Icons.drive_file_rename_outline),
                    ),
                  ],
                ),

              ),
              Item(
                borderBottom: true,
                title: 'Telegram',
                arrow: false,
                trailing: Row(
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Icon(Icons.drive_file_rename_outline),
                    ),
                  ],
                ),

              ),
            ],
          ),

        ],
      ),
    );
  }
}
