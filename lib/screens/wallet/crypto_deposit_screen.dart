import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:flutter/services.dart';


class CryptoDepositScreen extends StatelessWidget {

  final String cryptoName;
  final String address;
  CryptoDepositScreen(
      {Key? key, required this.cryptoName, required this.address})
      : super(key: key);

  String dropdownValue = 'ERC20';

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      margin: EdgeInsets.only(bottom: 200.0),
      duration: const Duration(milliseconds: 800),
      content: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flexible(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              strutStyle: StrutStyle(fontSize: 12.0),
              text: TextSpan(
                  style: TextStyle(color: Colors.white),
                  text: this.address),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 1000,
      behavior: SnackBarBehavior.floating,
    );

    return EmptyScreen(
      appBar: AppBar(
        title: Text('DEPOSIT ' + this.cryptoName),
      ),
      body: Center(
        child: Container(
          width: 260.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 48.0,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                decoration: BoxDecoration(
                  color: Get.theme.inputDecorationTheme.fillColor,
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(color: Colors.black12, width: 1.0),
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  // iconSize: 22,
                  elevation: 24,
                  style: const TextStyle(fontSize: 14.0),
                  underline: Container(height: 0),
                  borderRadius: BorderRadius.circular(6.0),

                  onChanged: (String? newValue) {
                    // setState(() {
                    //   dropdownValue = newValue!;
                    // });
                  },
                  items: <String>['ERC20', 'TRC20', 'BEP']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text('M???ng l?????i: ' + value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(color: Colors.black12, width: 1.0),
                ),
                child: Column(
                  children: [
                    Text(
                      'Onicent Wallet',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF3762D2),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    QrImage(
                      data: this.address,
                      version: QrVersions.auto,
                      embeddedImage: AssetImage('assets/icons/crypto/bnb.png'),
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: Size(20, 20),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    SelectableText(
                      this.address,
                      style: TextStyle(height: 1.5, fontSize: 13.0, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    height: 1.3,
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                  children: const <TextSpan>[
                    TextSpan(text: 'send only '),
                    TextSpan(
                        text: 'Bitcoin(BTC) ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            )),
                    TextSpan(
                        text:
                            'to this address. sending any other coins may result in permanent loss.'),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _item(
                    icon: Icon(
                      Icons.content_copy,
                      color: Colors.white,
                    ),
                    title: 'Copy',
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: this.address)).then(
                        (value) {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        },
                      );
                    },
                  ),
                  _item(
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    title: 'Chia s???',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item({
    Widget? icon,
    String? title,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Color(0xFF3762D2),
                  borderRadius: BorderRadius.circular(50.0)),
              child: icon,
            ),
            SizedBox(height: 15.0),
            Text(
              '$title',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
