import 'package:onicent/screens/wallet/transaction_history_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: 'Giao dịch',
      decoration: BoxDecoration(color: Colors.white),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Ink(
                  child: Row(
                    children: [
                      Image.asset('assets/icons/crypto/Ripple-icon.png',
                          width: 20),
                      SizedBox(width: 3.0),
                      Text(
                        'XRP',
                        style: TextStyle(),
                      ),
                      SizedBox(width: 3.0),
                      Icon(Icons.add, size: 16.0),
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Ink(
                  child: Row(
                    children: [
                      Text(
                        'Thời gian',
                        style: TextStyle(),
                      ),
                      SizedBox(width: 3.0),
                      Icon(Icons.add, size: 16.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: ListView(
              children: [
                _itemTransactionHistory(),
                _itemTransactionHistory(),
                _itemTransactionHistory(),
                _itemTransactionHistory(),
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
          ),
        ],
      ),
    );
  }

  Widget _itemTransactionHistory() {
    return WrapCard(
      onTab: (){
        Navigator.of(context).push(createRoute(const TransactionHistoryDetailScreen()));
      },
      padding: EdgeInsets.all(15.0),
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
