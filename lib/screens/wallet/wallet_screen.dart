import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/widgets.dart';

import 'crypto_deposit_screen.dart';
import 'crypto_swap_screen.dart';
import 'crypto_withdraw_screen.dart';
import 'wallet_settings_screen.dart';
import 'wallet_deposit_screen.dart';
import 'wallet_withdraw_screen.dart';
import 'transaction_history_screen.dart';
import 'crypto_screen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      // appBar: AppBar(
      //   title: Text('WALLET'),
      //   automaticallyImplyLeading: false,
      // ),
      padding: EdgeInsets.all(10.0),
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
              // height: 120,
              // width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(5.0),
              //   // border: Border.all(width: 1.0, color: const Color(0xFFEBEBEF)),
              //   // border: const Border(
              //   //   bottom: BorderSide(width: 1.0, color: Color(0xFFEBEBEF)),
              //   // ),
              //
              //   boxShadow: const [
              //     BoxShadow(color: Color(0xFFF5F1FA), spreadRadius: 0.5),
              //   ],
              //   // image: const DecorationImage(
              //   //   image: AssetImage('assets/images/cover_large.jpg'),
              //   //   fit: BoxFit.fitWidth,
              //   //   alignment: Alignment.bottomLeft,
              //   // ),
              // ),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tài sản ước tính (\$)',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(createRoute(const WalletSettingsScreen()));
                        },
                        child: Icon(Icons.tune, size: 25.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: const [
                      Text(
                        '5 000 000 000 000,0',
                        style: TextStyle(
                          fontSize: 24.0,
                          // color: Color(0xFF0F1F5C),
                          color: Color(0xff227b18),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: const [
                      Text(
                        'Số dư VNDT',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: const [
                      Text(
                        '35 000 000,0',
                        style: TextStyle(
                          fontSize: 16,
                          // color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _itemCard(
                        icon: const Icon(
                          Icons.file_download,
                          // color: Color(0xFF21599C),
                        ),
                        title: 'Nạp tiền',
                        onTap: () {
                          Navigator.of(context)
                              .push(createRoute( CryptoDepositScreen(address: '0xb8bA36E591FAceE901FfD3d5D82dF491551AD7eF',cryptoName: 'BTC',)));
                        },
                      ),
                      _itemCard(
                        icon: const Icon(
                          Icons.file_upload,
                          // color: Color(0xFF21599C),
                        ),
                        title: 'Rút tiền',
                        onTap: () {
                          Navigator.of(context)
                              .push(createRoute(const CryptoWithdrawScreen()));
                        },
                      ),
                      _itemCard(
                        icon: const Icon(
                          Icons.history,
                          // color: Colors.black54,
                        ),
                        title: 'Lịch sử',
                        onTap: () {
                          Navigator.of(context).push(
                              createRoute(const CryptoSwapScreen()));
                        },
                      ),
                    ],
                  ),
                ],
            ),

            // SizedBox(
            //   height: 10.0,
            // ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Column(
                children: [
                  Item(
                    height: 65.0,
                    borderBottom: true,
                    leading: Icon(
                      Icons.play_circle_filled,
                      size: 40.0,
                      color: Color(0xFF4ACAF3),
                    ),
                    title: 'Bộ video hướng dẫn Bộ video hướng dẫn',
                    subTitle: 'Dành cho người mới bắt đầu.',
                  ),
                  Item(
                    height: 65.0,
                    borderBottom: true,
                    leading: Icon(Icons.savings, size: 40.0, color: Colors.blue[700]),
                    title: 'Nạp VNDT',
                    subTitle: 'Lãi kép 12% APR.',
                    onTap: (){
                      Get.to(WalletDepositScreen());
                    },
                  ),
                  // Item(
                  //   borderBottom: true,
                  //
                  //   leading: Icon(Icons.swap_horizontal_circle_outlined, size: 40.0, color: Color(0xFF181e7b)),
                  //   title: 'Quy đổi',
                  //   subTitle: 'Chuyển tới địa chỉ ví khác.',
                  // ),
                  Item(
                    height: 65.0,
                    leading: Image.asset('assets/icons/ic_bank.png', width: 40.0),
                    title: 'Rút VNDT về ngân hàng',
                    subTitle: 'Chuyển tới địa chỉ ví khác.',
                    onTap: (){
                      Get.to(WalletWithdrawScreen());
                    },
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 10.0,
            // ),

            GroupItem(
              children: [
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Coin Balance',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                            color: Color(0xFF181e7b),
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          'Bộ sưu tập',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                            color: Color(0xff227b18),
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.control_point,
                        ),
                        // Switch(
                        //   value: _setSwitch,
                        //   onChanged: (bool newValue) {
                        //     setState(() {
                        //       _setSwitch = newValue;
                        //     });
                        //   },
                        //   activeColor: Colors.amber,
                        // ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15.0),

                Item(
                  height: 70,
                  title: 'VNDT',
                  subTitle: 'Prax',
                  leading: Image.asset('assets/icons/crypto/btc.png', width: 40),
                  trailing: Text('25000000.02',
                    style: const TextStyle(
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      // color: Color(0xFF181e7b),
                    ),
                  ),
                  borderBottom: true,
                ),
                Item(
                  height: 70,
                  title: 'OIC',
                  subTitle: 'Onicent coin',
                  leading: Image.asset('assets/icons/crypto/xrp.png', width: 40),
                  trailing: Text('2950.02',
                    style: const TextStyle(
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      // color: Color(0xFF181e7b),
                    ),
                  ),
                  borderBottom: true,
                ),
                Item(
                  height: 70,
                  title: 'ETH',
                  subTitle: 'Etherium',
                  leading: Image.asset('assets/icons/crypto/eth.png', width: 40),
                  trailing: Text('12.02',
                    style: const TextStyle(
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      // color: Color(0xFF181e7b),
                    ),
                  ),
                  borderBottom: true,
                ),
                Item(
                  height: 70,
                  title: 'BTC',
                  subTitle: 'Bitcoin',
                  leading: Image.asset('assets/icons/crypto/usdt.png', width: 40),
                  trailing: Text('0.02005',
                    style: const TextStyle(
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      // color: Color(0xFF181e7b),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemCard({
    Widget? icon,
    String? title,
    Function()? onTap,
  }) {
    return Container(
      // margin: const EdgeInsets.only(right: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(6.0),
          // color: Colors.white,
          child: Center(
            child: Column(
              children: [
                Container(child: icon),
                Text(
                  '$title',
                  style: const TextStyle(
                    // color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listCryptoItem({
    String? icon,
    double amount = 0,
    String? walletAddress,
    String? cryptoName,
    String? cryptoShortName,
    Widget? child,
    Function()? deposit,
    Function()? withdraw,
    BoxDecoration? decoration,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(createRoute(CryptoScreen()));
      },
      child: Ink(
        padding:
            const EdgeInsets.only(left: 15, right: 5.0, top: 8.0, bottom: 8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              width: 0.2,
              color: Color(0xFFE8E8E8),
            ),
            bottom: BorderSide(
              width: 0.2,
              color: Color(0xFFE8E8E8),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              icon!,
              width: 40,
              height: 55,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$cryptoName',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  Container(
                    height: 7.0,
                  ),
                  Text(
                    '$amount $cryptoShortName',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_drop_down_circle, size: 16.0),
            SizedBox(
              width: 15.0,
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
