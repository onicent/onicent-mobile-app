import 'package:get/get.dart';
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
      appBar: AppBar(
        title: Text(
          'Giao dịch',
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      body: Column(
        children: [
          Container(
            height: 45.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Ink(
                    child: Row(
                      children: [
                        Image.asset('assets/icons/crypto/xrp.png',
                            width: 20),
                        SizedBox(width: 5.0),
                        Text(
                          'XRP',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(width: 3.0),
                        Icon(Icons.keyboard_arrow_down, size: 16.0),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Ink(
                    child: Text(
                      'Thời gian',
                      style: TextStyle(
                          fontSize: 16.0
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView(
              children: [
                GroupItem(
                  children: [
                    Item(
                      height: 65,
                      borderBottom: true,
                      leading: Image.asset('assets/icons/icon_gif.png', width: 35.0),
                      title: 'Giao dich 78953',
                      subTitle: '22/12/2020 11:58:32',
                      arrow: false,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('+0.0578 BTC',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Hoàn thành',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),

                        ],
                      ),
                      onTap: (){
                        Get.to(TransactionHistoryDetailScreen());
                      },

                    ),
                    Item(
                      height: 65,
                      borderBottom: true,
                      leading: Image.asset('assets/icons/icon_gif.png', width: 35.0),
                      title: 'Giao dich 78953',
                      subTitle: '22/12/2020 11:58:32',
                      arrow: false,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('+0.0578 BTC',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Hoàn thành',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),

                        ],
                      ),
                      onTap: (){
                        Get.to(TransactionHistoryDetailScreen());
                      },

                    ),
                    Item(
                      height: 65,
                      borderBottom: true,
                      leading: Image.asset('assets/icons/icon_gif.png', width: 35.0),
                      title: 'Giao dich 78953',
                      subTitle: '22/12/2020 11:58:32',
                      arrow: false,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('+0.0578 BTC',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Hoàn thành',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),

                        ],
                      ),
                      onTap: (){
                        Get.to(TransactionHistoryDetailScreen());
                      },

                    ),
                    Item(
                      height: 65,
                      borderBottom: true,
                      leading: Image.asset('assets/icons/icon_gif.png', width: 35.0),
                      title: 'Giao dich 78953',
                      subTitle: '22/12/2020 11:58:32',
                      arrow: false,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('+0.0578 BTC',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Hoàn thành',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),

                        ],
                      ),
                      onTap: (){
                        Get.to(TransactionHistoryDetailScreen());
                      },

                    ),
                    Item(
                      height: 65,
                      borderBottom: true,
                      leading: Image.asset('assets/icons/icon_gif.png', width: 35.0),
                      title: 'Giao dich 78953',
                      subTitle: '22/12/2020 11:58:32',
                      arrow: false,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('+0.0578 BTC',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Hoàn thành',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),

                        ],
                      ),
                      onTap: (){
                        Get.to(TransactionHistoryDetailScreen());
                      },

                    ),
                    Item(
                      height: 65,
                      borderBottom: true,
                      leading: Image.asset('assets/icons/icon_gif.png', width: 35.0),
                      title: 'Giao dich 78953',
                      subTitle: '22/12/2020 11:58:32',
                      arrow: false,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('+0.0578 BTC',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Hoàn thành',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),

                        ],
                      ),
                      onTap: (){
                        Get.to(TransactionHistoryDetailScreen());
                      },

                    ),
                    Item(
                      height: 65,
                      leading: Image.asset('assets/icons/icon_gif.png', width: 35.0),
                      title: 'Giao dich 78953',
                      subTitle: '22/12/2020 11:58:32',
                      arrow: false,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('+0.0578 BTC',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Hoàn thành',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),

                        ],
                      ),
                      onTap: (){
                        Get.to(TransactionHistoryDetailScreen());
                      },

                    ),
                    Item(
                      height: 65,
                      borderBottom: true,
                      leading: Image.asset('assets/icons/icon_gif.png', width: 35.0),
                      title: 'Giao dich 78953',
                      subTitle: '22/12/2020 11:58:32',
                      arrow: false,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('+0.0578 BTC',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Hoàn thành',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),

                        ],
                      ),
                      onTap: (){
                        Get.to(TransactionHistoryDetailScreen());
                      },

                    ),
                    Item(
                      height: 65,
                      borderBottom: true,
                      leading: Image.asset('assets/icons/icon_gif.png', width: 35.0),
                      title: 'Giao dich 78953',
                      subTitle: '22/12/2020 11:58:32',
                      arrow: false,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('+0.0578 BTC',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Hoàn thành',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),

                        ],
                      ),
                      onTap: (){
                        Get.to(TransactionHistoryDetailScreen());
                      },

                    ),
                    Item(
                      height: 65,
                      borderBottom: true,
                      leading: Image.asset('assets/icons/icon_gif.png', width: 35.0),
                      title: 'Giao dich 78953',
                      subTitle: '22/12/2020 11:58:32',
                      arrow: false,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('+0.0578 BTC',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Hoàn thành',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),

                        ],
                      ),
                      onTap: (){
                        Get.to(TransactionHistoryDetailScreen());
                      },

                    ),
                    Item(
                      height: 65,
                      leading: Image.asset('assets/icons/icon_gif.png', width: 35.0),
                      title: 'Giao dich 78953',
                      subTitle: '22/12/2020 11:58:32',
                      arrow: false,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('+0.0578 BTC',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Hoàn thành',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ),

                        ],
                      ),
                      onTap: (){
                        Get.to(TransactionHistoryDetailScreen());
                      },

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
