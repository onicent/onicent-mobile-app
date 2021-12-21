import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class WalletWithdrawScreen extends StatefulWidget {
  const WalletWithdrawScreen({Key? key}) : super(key: key);

  @override
  _WalletWithdrawScreenState createState() => _WalletWithdrawScreenState();
}

class _WalletWithdrawScreenState extends State<WalletWithdrawScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      padding: EdgeInsets.all(15.0),
      body: Column(
        children: [
          Container(
            height: 90.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Color(0xFFE6E9EC), width: 1.0),
            ),
            child: Row(
              children: [
                Image.asset('assets/icons/crypto/Ripple-icon.png', width: 45.0,),
                SizedBox(width: 15.0),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '0.585056 BTC',
                        style: TextStyle(
                            color: Color(0xFF2A5CA8),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Bitcoin',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),


          Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Color(0xFFE6E9EC), width: 1.0),

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Text(
                  'Số lượng',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 54.0,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Color(0xFFEFF2F6), width: 1.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          style: TextStyle(fontSize: 16.0),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Địa chỉ ví',
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 10.0),

                Text(
                  'Chọn phương thức thanh toán',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 54.0,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Color(0xFFEFF2F6), width: 1.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          style: TextStyle(fontSize: 16.0),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Phí rút USDT: 0 USDT",
                    style: TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 30.0),
          ButtonC(
            title: 'Gửi',
          ),
        ],
      ),
    );
  }
}
