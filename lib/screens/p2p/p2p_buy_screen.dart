import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'p2p_item_list.dart';

class P2PBuyScreen extends StatefulWidget {
  const P2PBuyScreen({Key? key}) : super(key: key);

  @override
  State<P2PBuyScreen> createState() => _P2PBuyScreenState();
}

class _P2PBuyScreenState extends State<P2PBuyScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          const Duration(seconds: 1),
              () {
            print('hello');
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 10.0),
            P2PItemList(
              isOnline: false,
              userName: 'Lê Hoàng Đại',
              starRating: 4.5,
              isKYC: true,
              isBuy: true,
              cryptoPrice: 98000000,
              basicMoney: 'VND',
              cryptoName: 'ETH',
              methodPayment: 0,
              cryptoAmount: 7.5,
            ),
            P2PItemList(
              isOnline: false,
              userName: 'Lê Hoàng Đại',
              starRating: 4.5,
              isKYC: true,
              isBuy: true,
              cryptoPrice: 98000000,
              basicMoney: 'VND',
              cryptoName: 'ETH',
              methodPayment: 0,
              cryptoAmount: 7.5,
            ),
            P2PItemList(
              isOnline: false,
              userName: 'Lê Hoàng Đại',
              starRating: 4.5,
              isKYC: true,
              isBuy: true,
              cryptoPrice: 98000000,
              basicMoney: 'VND',
              cryptoName: 'ETH',
              methodPayment: 0,
              cryptoAmount: 7.5,
            ),
            P2PItemList(
              isOnline: false,
              userName: 'Lê Hoàng Đại',
              starRating: 4.5,
              isKYC: true,
              isBuy: true,
              cryptoPrice: 98000000,
              basicMoney: 'VND',
              cryptoName: 'ETH',
              methodPayment: 0,
              cryptoAmount: 7.5,
            ),
            P2PItemList(
              isOnline: false,
              userName: 'Lê Hoàng Đại',
              starRating: 4.5,
              isKYC: true,
              isBuy: true,
              cryptoPrice: 98000000,
              basicMoney: 'VND',
              cryptoName: 'ETH',
              methodPayment: 0,
              cryptoAmount: 7.5,
            ),
            P2PItemList(
              isOnline: false,
              userName: 'Lê Hoàng Đại',
              starRating: 4.5,
              isKYC: true,
              isBuy: true,
              cryptoPrice: 98000000,
              basicMoney: 'VND',
              cryptoName: 'ETH',
              methodPayment: 0,
              cryptoAmount: 7.5,
            ),
            P2PItemList(
              isOnline: false,
              userName: 'Lê Hoàng Đại',
              starRating: 4.5,
              isKYC: true,
              isBuy: true,
              cryptoPrice: 98000000,
              basicMoney: 'VND',
              cryptoName: 'ETH',
              methodPayment: 0,
              cryptoAmount: 7.5,
            ),
            P2PItemList(
              isOnline: false,
              userName: 'Lê Hoàng Đại',
              starRating: 4.5,
              isKYC: true,
              isBuy: true,
              cryptoPrice: 98000000,
              basicMoney: 'VND',
              cryptoName: 'ETH',
              methodPayment: 0,
              cryptoAmount: 7.5,
            ),
            P2PItemList(
              isOnline: false,
              userName: 'Lê Hoàng Đại',
              starRating: 4.5,
              isKYC: true,
              isBuy: true,
              cryptoPrice: 98000000,
              basicMoney: 'VND',
              cryptoName: 'ETH',
              methodPayment: 0,
              cryptoAmount: 7.5,
            ),
          ],
        ),
      ),
    );
  }
}
