import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class MyADSAddItem extends StatelessWidget {
  const MyADSAddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: Text('Tạo quảng cáo'),
      ),
      padding: EdgeInsets.all(15.0),
      body: ListView(
        children: [


          Text(
            'Chọn tạo loại quảng cáo'.toUpperCase(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.0),
          TextFieldInput(),
          SizedBox(height: 10.0),

          Text(
            'Chọn loại tài sản'.toUpperCase(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.0),
          TextFieldInput(),
          SizedBox(height: 10.0),

          Text(
            'Chọn phương thức thanh toán'.toUpperCase(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.0),
          TextFieldInput(),
          SizedBox(height: 10.0),

          Text(
            'Nhập số lượng'.toUpperCase(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.0),
          TextFieldInput(),

          SizedBox(height: 40.0),
          ButtonPress(
            title: 'Tạo quảng cáo',
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}


