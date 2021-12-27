import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/widgets.dart';

class CryptoSwapScreen extends StatefulWidget {
  const CryptoSwapScreen({Key? key}) : super(key: key);

  @override
  State<CryptoSwapScreen> createState() => _CryptoSwapScreenState();
}

class _CryptoSwapScreenState extends State<CryptoSwapScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: 'Quy đổi',
      appBar: AppBar(
        title: Text('Quy đổi'),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      body: Column(
        children: [
          GroupItem(children: [
            SizedBox(height: 20.0),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'From',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            TextFieldInput(
              leading: InkWell(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/crypto/btc.png',
                      width: 22.0,
                    ),
                    SizedBox(width: 5.0),
                    Text('BTC'),
                    SizedBox(width: 5.0),
                    Icon(
                      Icons.expand_more,
                      size: 20.0,
                    ),
                    SizedBox(width: 5.0),
                    Container(
                      color: Color(0xFFEFF2F6),
                      width: 1.0,
                      height: 30.0,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15.0),
            Row(
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(width: 1.0, color: Color(0xFFEFF2F6),)
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Get.theme.inputDecorationTheme.fillColor,
                      border: Border.all(color: Color(0xFFEFF2F6), width: 1.0)),
                  child: InkWell(
                    child: Icon(
                      Icons.swap_vert,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'From',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            TextFieldInput(
              leading: InkWell(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/crypto/btc.png',
                      width: 22.0,
                    ),
                    SizedBox(width: 5.0),
                    Text('BTC'),
                    SizedBox(width: 5.0),
                    Icon(
                      Icons.expand_more,
                      size: 20.0,
                    ),
                    SizedBox(width: 5.0),
                    Container(
                      color: Color(0xFFEFF2F6),
                      width: 1.0,
                      height: 30.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],),
          SizedBox(height: 15.0),
          GroupItem(
            children: [
              _itemTransactionHistory(),
              _itemTransactionHistory(),
            ],
          ),
          SizedBox(height: 15.0),
          ButtonPress(
            title: 'Gửi',
          ),        ],
      ),
    );
  }

  Widget _itemTransactionHistory(){
    return  InkWell(
      onTap: (){
      },
      child: Ink(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            border: Border.symmetric(horizontal: BorderSide(color: Colors.black12, width: 0.2))
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Giao dịch #78789526',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
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
    );
  }


}
