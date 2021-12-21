import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'p2p_item_list.dart';

class P2PSellScreen extends StatefulWidget {
  const P2PSellScreen({Key? key}) : super(key: key);

  @override
  State<P2PSellScreen> createState() => _P2PSellScreenState();
}

class _P2PSellScreenState extends State<P2PSellScreen> {
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
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          P2PItemList(
            isOnline: false,
            userName: 'Lê Hoàng Đại',
            starRating: 4.5,
            isKYC: true,
            isBuy: false,
            cryptoPrice: 98000000,
            basicMoney: 'VND',
            cryptoName: 'ETH',
            methodPayment: 0,
            cryptoAmount: 4.5,
          ),
          P2PItemList(
            isOnline: false,
            userName: 'Lê Hoàng Đại',
            starRating: 4.5,
            isKYC: true,
            isBuy: false,
            cryptoPrice: 98000000,
            basicMoney: 'VND',
            cryptoName: 'ETH',
            methodPayment: 0,
            cryptoAmount: 4.5,
          ),
          P2PItemList(
            isOnline: false,
            userName: 'Lê Hoàng Đại',
            starRating: 4.5,
            isKYC: true,
            isBuy: false,
            cryptoPrice: 98000000,
            basicMoney: 'VND',
            cryptoName: 'ETH',
            methodPayment: 0,
            cryptoAmount: 4.5,
          ),
          P2PItemList(
            isOnline: false,
            userName: 'Lê Hoàng Đại',
            starRating: 4.5,
            isKYC: true,
            isBuy: false,
            cryptoPrice: 98000000,
            basicMoney: 'VND',
            cryptoName: 'ETH',
            methodPayment: 0,
            cryptoAmount: 4.5,
          ),
          P2PItemList(
            isOnline: false,
            userName: 'Lê Hoàng Đại',
            starRating: 4.5,
            isKYC: true,
            isBuy: false,
            cryptoPrice: 98000000,
            basicMoney: 'VND',
            cryptoName: 'ETH',
            methodPayment: 0,
            cryptoAmount: 4.5,
          ),
          P2PItemList(
            isOnline: false,
            userName: 'Lê Hoàng Đại',
            starRating: 4.5,
            isKYC: true,
            isBuy: false,
            cryptoPrice: 98000000,
            basicMoney: 'VND',
            cryptoName: 'ETH',
            methodPayment: 0,
            cryptoAmount: 4.5,
          ),
          P2PItemList(
            isOnline: false,
            userName: 'Lê Hoàng Đại',
            starRating: 4.5,
            isKYC: true,
            isBuy: false,
            cryptoPrice: 98000000,
            basicMoney: 'VND',
            cryptoName: 'ETH',
            methodPayment: 0,
            cryptoAmount: 4.5,
          ),
          P2PItemList(
            isOnline: false,
            userName: 'Lê Hoàng Đại',
            starRating: 4.5,
            isKYC: true,
            isBuy: false,
            cryptoPrice: 98000000,
            basicMoney: 'VND',
            cryptoName: 'ETH',
            methodPayment: 0,
            cryptoAmount: 4.5,
          ),
          P2PItemList(
            isOnline: false,
            userName: 'Lê Hoàng Đại',
            starRating: 4.5,
            isKYC: true,
            isBuy: false,
            cryptoPrice: 98000000,
            basicMoney: 'VND',
            cryptoName: 'ETH',
            methodPayment: 0,
            cryptoAmount: 4.5,
          ),
        ],
      ),
    );
  }
}
