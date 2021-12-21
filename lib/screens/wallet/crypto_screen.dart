import 'package:onicent/screens/wallet/crypto_swap_screen.dart';
import 'package:onicent/screens/wallet/transaction_history_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'crypto_deposit_screen.dart';
import 'crypto_withdraw_screen.dart';

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({Key? key}) : super(key: key);

  @override
  _CryptoScreenState createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: 'BTC',
      body: ListView(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            padding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              // border: Border.all(width: 1.0, color: const Color(0xFFEBEBEF)),
              // border: const Border(
              //   bottom: BorderSide(width: 1.0, color: Color(0xFFEBEBEF)),
              // ),

              boxShadow: const [
                BoxShadow(color: Color(0xFFF5F1FA), spreadRadius: 0.5),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/images/cover_large.jpg'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomLeft,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 10.0),
                Center(
                  child: Text(
                    'Số dư ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Center(
                  child: Text(
                    '0.05486 BTC',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _itemCard(
                      icon: const Icon(
                        Icons.file_download,
                        color: Color(0xFF21599C),
                      ),
                      title: 'Gửi',
                      onTap: () {
                        Navigator.of(context).push(
                            createRoute( CryptoDepositScreen(address: 'ádasdasd', cryptoName: 'btc',)));
                      },
                    ),
                    _itemCard(
                      icon: const Icon(
                        Icons.file_upload,
                        color: Color(0xFF21599C),
                      ),
                      title: 'Nhận',
                      onTap: () {
                        Navigator.of(context).push(
                            createRoute(const CryptoWithdrawScreen()));
                      },
                    ),
                    _itemCard(
                      icon: const Icon(
                        Icons.history,
                        color: Colors.black54,
                      ),
                      title: 'Quy đổi',
                      onTap: () {
                        Navigator.of(context).push(
                            createRoute(const CryptoSwapScreen()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 1.0,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFDBEAFF),
          ),
          Container(
           padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
           decoration: const BoxDecoration(
             color: Colors.transparent,
             border: Border.symmetric(vertical: BorderSide(width: 0.5, color: Colors.grey))
           ),
           child:  Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children:  [
               const Text(
                 'Giao dịch',
                 style: TextStyle(
                   fontWeight: FontWeight.w600,
                   fontSize: 17.0,
                   color: Colors.black87,
                 ),
               ),
               InkWell(
                 onTap: (){
                   Navigator.of(context).push(
                       createRoute(const TransactionHistoryScreen()));
                 },
                 child: Ink(
                   child: const Text(
                     'Xem tất cả',
                     style: TextStyle(
                       fontWeight: FontWeight.w400,
                       fontSize: 16.0,
                       color: Color(0xFF131EEE),
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ),
          _itemTransactionHistory(),
          _itemTransactionHistory(),
          _itemTransactionHistory(),
          _itemTransactionHistory(),
          _itemTransactionHistory(),
          _itemTransactionHistory(),
          _itemTransactionHistory(),
          _itemTransactionHistory(),
          _itemTransactionHistory(),
        ],
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
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                Container(child: icon),
                Text(
                  '$title',
                  style: const TextStyle(
                    color: Colors.black54,
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

  Widget _itemTransactionHistory(){
    return  WrapCard(
      child: Row(
        children: [
          Image.asset('assets/icons/icon_gif.png', width: 40.0),
          SizedBox(width: 10.0),
          Flexible(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Giao dịch #78789526',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text('+0.0578 BTC',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('22/12/2020 11:58:32',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    Text('Hoàn thành',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
