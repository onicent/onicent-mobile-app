import 'package:flutter/material.dart';
import '../../widgets/empty_screen.dart';

class MyADSAddItem extends StatefulWidget {
  const MyADSAddItem({Key? key}) : super(key: key);

  @override
  _MyADSAddItemState createState() => _MyADSAddItemState();
}

class _MyADSAddItemState extends State<MyADSAddItem> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: 'Tạo quảng cáo',
      padding: EdgeInsets.all(15.0),
      body: ListView(
        children: [


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
                  'Chọn phương thức thanh toán',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.0),
                Material(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5.0),
                    onTap: (){

                    },
                    child: Ink(
                      height: 54.0,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Color(0xFFEFF2F6), width: 1.0),
                      ),
                      child: Row(
                        children: [
                          Text('Chọn phương thức thanh toán ...',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),

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

              ],
            ),
          ),

          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
