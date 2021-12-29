import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'my_ads_item.dart';

class MyADSBuyScreen extends StatefulWidget {
  const MyADSBuyScreen({Key? key}) : super(key: key);

  @override
  _MyADSBuyScreenState createState() => _MyADSBuyScreenState();
}

class _MyADSBuyScreenState extends State<MyADSBuyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: ListView(
        children: [
          MyADSItem(
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
          MyADSItem(
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
          MyADSItem(
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
          MyADSItem(
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
          MyADSItem(
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
          MyADSItem(
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
          MyADSItem(
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
          MyADSItem(
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
    );
  }
}
