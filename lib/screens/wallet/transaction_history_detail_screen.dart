import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class TransactionHistoryDetailScreen extends StatefulWidget {
  const TransactionHistoryDetailScreen({Key? key}) : super(key: key);

  @override
  _TransactionHistoryDetailScreenState createState() =>
      _TransactionHistoryDetailScreenState();
}

class _TransactionHistoryDetailScreenState
    extends State<TransactionHistoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: Text('Chi tiết giao dịch'),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      body: ListView(
        children: [
          GroupItem(
            children: [
              Item(
                height: 50.0,
                borderBottom: true,
                arrow: false,
                leading: Text(
                  'Người gửi',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                trailing: Text(
                  'TOKUDA',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Item(
                height: 50.0,
                borderBottom: true,
                arrow: false,
                leading: Text(
                  'Người nhận',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                trailing: Text(
                  'Y dung kuan',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),

              Item(
                height: 50.0,
                borderBottom: true,
                arrow: false,
                leading: Text(
                  'Số tiền trả',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                trailing: Text(
                  '526.000 VNDT',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),

              Item(
                height: 50.0,
                borderBottom: true,
                arrow: false,
                leading: Text(
                  'Lượng USDT',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                trailing: Text(
                  '1,000',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),


              Item(
                height: 50.0,

                borderBottom: true,
                arrow: false,
                leading: Text(
                  'Thời gian',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                trailing: Text(
                  '22/12/2022 20:22:13',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),

              Item(
                height: 50.0,
                arrow: false,
                leading: Text(
                  'Mã giao dịch ID',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                trailing: Text(
                  '54875KSH4869',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

}
