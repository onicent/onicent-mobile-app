import 'package:flutter/material.dart';
import 'package:onicent/widgets/empty_screen.dart';
import 'package:onicent/widgets/route_render.dart';

import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class BankLinkScreen extends StatefulWidget {
  const BankLinkScreen({Key? key}) : super(key: key);

  @override
  _BankLinkScreenState createState() => _BankLinkScreenState();
}

class _BankLinkScreenState extends State<BankLinkScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: 'Bank Link',
      body: Container(
        padding:
            EdgeInsets.only(top: 10.0, bottom: 10.0, left: 18.0, right: 18.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
              padding: EdgeInsets.symmetric(horizontal: 2.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "TÀI KHOẢN NGÂN HÀNG",
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Color(0xFFF5F1FA), spreadRadius: 0.5),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.only(top: 8.0, bottom: 4.0),
              child: Column(
                children: [
                  BankItem(
                    title: 'MB - Ngân hàng TMCP Quân ...',
                    accountNumber: "0301789505",
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 1.0, color: Color(0xFFF5F4F4)),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(createRoute(const AddNewBank()));
                },
                child: Ink(
                  padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                  height: 55,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        size: 16,
                      ),
                      Text(" Thêm tài khoản"),
                    ],
                  ),
                ),
              ),
            ),


            Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
              padding: EdgeInsets.symmetric(horizontal: 2.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "VÍ",
                  ),
                ),
              ),
              // Text('TÀI KHOẢN NGÂN HÀNG', textAlign: TextAlign.start,),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Color(0xFFF5F1FA), spreadRadius: 0.5),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.only(top: 8.0, bottom: 4.0),
              child: Column(
                children: [
                  BankItem(
                    title: 'MB - Ngân hàng TMCP Quân ...',
                    accountNumber: "0301789505",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BankItem extends StatefulWidget {
  final String title;
  final String accountNumber;

  final Widget? child;
  final Widget? icon;
  final Function()? onTab;
  final BoxDecoration? decoration;

  const BankItem(
      {Key? key,
      required this.title,
      required this.accountNumber,
      this.child,
      this.icon,
      this.onTab,
      this.decoration})
      : super(key: key);

  @override
  _BankItemState createState() => _BankItemState(
      title: this.title,
      accountNumber: this.accountNumber,
      child: this.child,
      icon: this.icon,
      onTab: this.onTab,
      decoration: this.decoration);
}

class _BankItemState extends State<BankItem> {
  String title;
  String accountNumber;
  Widget? child;
  Widget? icon;
  Function()? onTab;
  BoxDecoration? decoration;

  _BankItemState(
      {required this.title,
      required this.accountNumber,
      this.child,
      this.icon,
      this.onTab,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: decoration,
      child: InkWell(
        onTap: onTab,
        child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 45,
                width: 45,
                margin: EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Center(
                  child: Image.network(
                    "https://mcnewsmd1.keeng.net/netnews/archive/images/2021/02/20/tinngan_080110_7085894_3.jpg",
                    height: 65,
                    width: 65,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200,
                    margin: EdgeInsets.only(bottom: 2.0),
                    child: Text(title),
                  ),
                  Container(
                    width: 200,
                    margin: EdgeInsets.only(top: 2.0),
                    child: Text(accountNumber),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: child,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: icon,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}

class AddNewBank extends StatefulWidget {
  const AddNewBank({Key? key}) : super(key: key);

  @override
  State<AddNewBank> createState() => _AddNewBankState();
}

class _AddNewBankState extends State<AddNewBank> {
  MaterialColor _color = Colors.green;

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: 'Thêm tài khoản',
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(bottom: 15),
              child: const Text(
                'Số tài khoản',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
                border: Border.all(width: 1.0, color: Color(0xFFF5F4F4)),

                // border: const Border(
                //   bottom: BorderSide(width: 1.0, color: Color(0xFFF5F4F4)), //0xFFF5F8FD
                // ),
              ),
              child: Row(
                children: const <Widget>[
                  Flexible(
                    child: TextField(
                      // obscureText: true,
                      style: TextStyle(fontSize: 16.0),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(bottom: 15, top: 25),
              child: const Text(
                'Tài khoản ngân hàng',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 1.0, color: Color(0xFFF5F4F4)),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectBank()),
                  );
                },
                child: Ink(
                  padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                  height: 55,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          strutStyle: StrutStyle(fontSize: 16.0),
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text:
                                  'Vetcombank - Ngân hàng TMCP ngoại thương việt nam)'),
                        ),
                      ),
                      Icon(Icons.more_vert)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 75),
              height: 45,
              child: FractionallySizedBox(
                widthFactor: 1, // means 100%, you can change this to 0.8 (80%)
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF286DEA),
                    primary: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Thêm',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectBank extends StatefulWidget {
  const SelectBank({Key? key}) : super(key: key);

  @override
  _SelectBankState createState() => _SelectBankState();
}

class _SelectBankState extends State<SelectBank> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: '',
      body: Container(
        child: Column(
          children: [
            Container(),
            Container

              (
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  // shrinkWrap: true,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black12, width: 1.0)
                          ),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Container(
                                    width: 45,
                                    height: 45,
                                    margin: EdgeInsets.only(right: 10.0),
                                    child: Image.asset('assets/icons/crypto/usdt.png'),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width -140,
                                        child: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          // strutStyle: StrutStyle(fontSize: 18.0),
                                          text: TextSpan(
                                              style: TextStyle(color: Colors.black, fontSize: 16.0),
                                              text:
                                              'Vietcombank'),
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width -140,
                                        margin: EdgeInsets.only(top: 4.0),
                                        child: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          // strutStyle: StrutStyle(fontSize: 14.0),
                                          text: TextSpan(
                                              style: TextStyle(color: Colors.grey, fontSize: 14.0),
                                              text:
                                              'Vetcombank - Ngân hàng TMCP ngoại thương việt nam)'),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                            Container(
                              child: Icon(Icons.check_circle, size: 16, color: Colors.green,),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
