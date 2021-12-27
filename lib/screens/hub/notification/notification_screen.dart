import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../widgets/widgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _setSwitch = false;

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      // tabBarAction: [
      //   IconButton(onPressed: (){}, icon: Icon(
      //     Icons.delete,
      //   ),)
      // ],
      appBar: AppBar(
        title: Text('Thông báo'),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            const Duration(seconds: 1),
            () {
              print('hello');
            },
          );
        },
        child: ListView(
          children: [
            GroupItem(

              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [

                Row(
                  children: [
                    Badge(
                      // showBadge: false,
                      position: BadgePosition.topEnd(top: -4, end: -4),
                      badgeContent: Container(),
                      child: Image.asset(
                        'assets/icons/crypto/Ripple-icon.png',
                        width: 40.0,
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thông báo hệ thống',
                            style: TextStyle(
                              height: 1.3,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.query_builder,
                                size: 14.0,
                              ),
                              SizedBox(width: 3.0),
                              Text(
                                '22-12-2021 08:54:14',
                                style: TextStyle(
                                  height: 1.3,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Kích hoạt kyc ngay để tăng trải lo nghiêm người dùng hệ thống',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Icon(Icons.brightness_1, size: 10.0),
                        Icon(Icons.check_box_outline_blank),
                        // Icon(Icons.delete, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            GroupItem(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [

                Row(
                  children: [
                    Badge(
                      // showBadge: false,
                      position: BadgePosition.topEnd(top: -4, end: -4),
                      badgeContent: Container(),
                      child: Image.asset(
                        'assets/icons/crypto/Ripple-icon.png',
                        width: 40.0,
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thông báo hệ thống',
                            style: TextStyle(
                              height: 1.3,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.query_builder,
                                size: 14.0,
                              ),
                              SizedBox(width: 3.0),
                              Text(
                                '22-12-2021 08:54:14',
                                style: TextStyle(
                                  height: 1.3,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Kích hoạt kyc ngay để tăng trải lo nghiêm người dùng hệ thống',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Icon(Icons.brightness_1, size: 10.0),
                        Icon(Icons.check_box_outline_blank),
                        // Icon(Icons.delete, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            GroupItem(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [

                Row(
                  children: [
                    Badge(
                      // showBadge: false,
                      position: BadgePosition.topEnd(top: -4, end: -4),
                      badgeContent: Container(),
                      child: Image.asset(
                        'assets/icons/crypto/Ripple-icon.png',
                        width: 40.0,
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thông báo hệ thống',
                            style: TextStyle(
                              height: 1.3,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.query_builder,
                                size: 14.0,
                              ),
                              SizedBox(width: 3.0),
                              Text(
                                '22-12-2021 08:54:14',
                                style: TextStyle(
                                  height: 1.3,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Kích hoạt kyc ngay để tăng trải lo nghiêm người dùng hệ thống',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Icon(Icons.brightness_1, size: 10.0),
                        Icon(Icons.check_box_outline_blank),
                        // Icon(Icons.delete, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            GroupItem(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [

                Row(
                  children: [
                    Badge(
                      // showBadge: false,
                      position: BadgePosition.topEnd(top: -4, end: -4),
                      badgeContent: Container(),
                      child: Image.asset(
                        'assets/icons/crypto/Ripple-icon.png',
                        width: 40.0,
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thông báo hệ thống',
                            style: TextStyle(
                              height: 1.3,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.query_builder,
                                size: 14.0,
                              ),
                              SizedBox(width: 3.0),
                              Text(
                                '22-12-2021 08:54:14',
                                style: TextStyle(
                                  height: 1.3,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Kích hoạt kyc ngay để tăng trải lo nghiêm người dùng hệ thống',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Icon(Icons.brightness_1, size: 10.0),
                        Icon(Icons.check_box_outline_blank),
                        // Icon(Icons.delete, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            GroupItem(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [

                Row(
                  children: [
                    Badge(
                      // showBadge: false,
                      position: BadgePosition.topEnd(top: -4, end: -4),
                      badgeContent: Container(),
                      child: Image.asset(
                        'assets/icons/crypto/Ripple-icon.png',
                        width: 40.0,
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thông báo hệ thống',
                            style: TextStyle(
                              height: 1.3,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.query_builder,
                                size: 14.0,
                              ),
                              SizedBox(width: 3.0),
                              Text(
                                '22-12-2021 08:54:14',
                                style: TextStyle(
                                  height: 1.3,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Kích hoạt kyc ngay để tăng trải lo nghiêm người dùng hệ thống',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Icon(Icons.brightness_1, size: 10.0),
                        Icon(Icons.check_box_outline_blank),
                        // Icon(Icons.delete, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            GroupItem(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [

                Row(
                  children: [
                    Badge(
                      // showBadge: false,
                      position: BadgePosition.topEnd(top: -4, end: -4),
                      badgeContent: Container(),
                      child: Image.asset(
                        'assets/icons/crypto/Ripple-icon.png',
                        width: 40.0,
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thông báo hệ thống',
                            style: TextStyle(
                              height: 1.3,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.query_builder,
                                size: 14.0,
                              ),
                              SizedBox(width: 3.0),
                              Text(
                                '22-12-2021 08:54:14',
                                style: TextStyle(
                                  height: 1.3,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Kích hoạt kyc ngay để tăng trải lo nghiêm người dùng hệ thống',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Icon(Icons.brightness_1, size: 10.0),
                        Icon(Icons.check_box_outline_blank),
                        // Icon(Icons.delete, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            GroupItem(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [

                Row(
                  children: [
                    Badge(
                      // showBadge: false,
                      position: BadgePosition.topEnd(top: -4, end: -4),
                      badgeContent: Container(),
                      child: Image.asset(
                        'assets/icons/crypto/Ripple-icon.png',
                        width: 40.0,
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thông báo hệ thống',
                            style: TextStyle(
                              height: 1.3,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.query_builder,
                                size: 14.0,
                              ),
                              SizedBox(width: 3.0),
                              Text(
                                '22-12-2021 08:54:14',
                                style: TextStyle(
                                  height: 1.3,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Kích hoạt kyc ngay để tăng trải lo nghiêm người dùng hệ thống',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Icon(Icons.brightness_1, size: 10.0),
                        Icon(Icons.check_box_outline_blank),
                        // Icon(Icons.delete, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }


}

// SizedBox(
// child: PopupMenuButton<int>(
// onSelected: (result) {
// if (result == 0) {
// Navigator.of(context).push(createRoute(DepositWalletScreen(
// cryptoName: cryptoName!, address: walletAddress!)));
// } else if (result == 1) {
// Navigator.of(context)
//     .push(createRoute(const WithdrawWalletScreen()));
// } else if (result == 2) {
// Navigator.of(context)
//     .push(createRoute(const SwapScreen()));
// } else if (result == 3) {
// Navigator.of(context)
//     .push(createRoute(const TransactionHistoryScreen()));
// }
// },
// itemBuilder: (context) => [
// const PopupMenuItem(
// child: Text('Deposit'),
// value: 0,
// ),
// const PopupMenuItem(
// child: Text('Withdraw'),
// value: 1,
// ),
// const PopupMenuItem(
// child: Text('Swap'),
// value: 2,
// ),
// const PopupMenuItem(
// child: Text('Lịch sử giao dịch'),
// value: 3,
// ),
// ],
// icon: const Icon(Icons.more_vert),
// ),
// ),
void doNothing(BuildContext context) {}
