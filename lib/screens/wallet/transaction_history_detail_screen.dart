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
      title: 'Chi tiết giao dịch',
      body: Column(
        children: [
          _itemDetail(
              title: 'Người gửi',
              content: 'TOKUDA'
          ),
          _itemDetail(
              title: 'Người nhận',
              content: 'Y dung kuan'
          ),
          _itemDetail(
              title: 'Số tiền trả',
              content: '526.000 VNDT'
          ),
          _itemDetail(
              title: 'Lượng USDT',
              content: '1,000'
          ),
          _itemDetail(
              title: 'Thời gian',
              content: '22/12/2022 20:22:13'
          ),
          _itemDetail(
              title: 'Mã giao dịch ID',
              content: '54875KSH4869'
          ),
        ],
      ),
    );
  }

  Widget _itemDetail({
    String title = '',
    String content = '',
  }) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.black12, width: 0.2))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
