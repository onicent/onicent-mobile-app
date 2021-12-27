import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:onicent/widgets/empty_screen.dart';
import 'package:flutter/rendering.dart';

class ReferFriendsScreen extends StatefulWidget {
  const ReferFriendsScreen({Key? key}) : super(key: key);

  @override
  _ReferFriendsScreenState createState() => _ReferFriendsScreenState();
}

class _ReferFriendsScreenState extends State<ReferFriendsScreen> {
  TextEditingController _textController = TextEditingController(text: '3050803547');

  // This key will be used to show the snack bar
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // This function is triggered when the copy icon is pressed
  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: _textController.text));
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: 'Giới thiệu bạn bè',
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          // shrinkWrap: true,
          children: [
            // Container(
            //   child: Icon(
            //     Icons.redeem,
            //     size: 150,
            //   ),
            // ),

            Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 35, top: 35),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFD7E6FF),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color: Color(0xFFF5F1FA), spreadRadius: 0.5),
                ],
              ),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Số lượng đã mời: 0",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0F1F5C),
                        fontSize: 18),
                  ),
                  // Text("0"),
                  // RefeFriendItem(noNumber: "1", title: "Tải app bitnet",),
                ],
              ),
            ),

            Container(
              child: Column(
                children: [
                  RefeFriendItem(
                    noNumber: "1",
                    title: "Tải app bitnet",
                  ),
                  RefeFriendItem(
                    noNumber: "2",
                    title: "Đăng ký tài khoản",
                  ),
                  RefeFriendItem(
                    noNumber: "3",
                    title: "Xác thực tài khoản",
                  ),
                  RefeFriendItem(
                    noNumber: "4",
                    title: "Nhận phần thưởng",
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 12.0, bottom: 2.0),
                    child: Text("Đường dẫn", style: TextStyle(fontWeight: FontWeight.w600),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: SelectableText("https://bitnet.asian/309050128"),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Icon(Icons.content_copy),
                          ),
                        ]),
                    // Text("https://bitnet.asian/309050128"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 12.0, bottom: 2.0),
                    child: Text("Mã giới thiệu", style: TextStyle(fontWeight: FontWeight.w600),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: SelectableText("Lorem ipsum..."),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Icon(Icons.content_copy),
                          ),
                        ]),
                    // Text("https://bitnet.asian/309050128"),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RefeFriendItem extends StatefulWidget {
  final String noNumber;
  final String title;

  const RefeFriendItem({Key? key, required this.noNumber, required this.title})
      : super(key: key);

  @override
  _RefeFriendItemState createState() =>
      _RefeFriendItemState(noNumber: this.noNumber, title: this.title);
}

class _RefeFriendItemState extends State<RefeFriendItem> {
  String noNumber;
  String title;

  _RefeFriendItemState({required this.noNumber, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Row(
        children: [
          Container(
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFF3662FF),
              boxShadow: [
                BoxShadow(color: Colors.black12, spreadRadius: 0.1),
              ],
            ),
            margin: EdgeInsets.only(right: 8.0),
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Row(
              children: [
                Text(
                  noNumber,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black87),
          )
        ],
      ),
    );
  }
}
