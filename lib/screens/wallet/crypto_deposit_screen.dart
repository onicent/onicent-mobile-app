import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:flutter/services.dart';

class CryptoDepositScreen extends StatefulWidget {
  final String cryptoName;
  final String address;
  const CryptoDepositScreen(
      {Key? key, required this.cryptoName, required this.address})
      : super(key: key);

  @override
  State<CryptoDepositScreen> createState() => _CryptoDepositScreenState();
}

class _CryptoDepositScreenState extends State<CryptoDepositScreen> {
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
                  text: widget.address),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 1000,
      behavior: SnackBarBehavior.floating,
    );

    return EmptyScreen(
      title: 'DEPOSIT ' + widget.cryptoName,
      body: Center(
        child: Container(
          width: 260.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.black12, width: 1.0),
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  iconSize: 22,
                  elevation: 24,
                  style: const TextStyle(color: Colors.black, fontSize: 14.0),
                  underline: Container(height: 0),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['ERC20', 'TRC20', 'BEP']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text('Mạng lưới: ' + value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.black12, width: 1.0),
                ),
                child: Column(
                  children: [
                    Text(
                      'Bitnet Wallet',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF3762D2),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    QrImage(
                      data: widget.address,
                      version: QrVersions.auto,
                      embeddedImage: AssetImage('assets/icons/crypto/bnb.png'),
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: Size(20, 20),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    SelectableText(
                      widget.address,
                      style: TextStyle(height: 1.5, fontSize: 13.0),
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
                    color: Colors.black54,
                    fontSize: 14.0,
                  ),
                  children: const <TextSpan>[
                    TextSpan(text: 'send only '),
                    TextSpan(
                        text: 'Bitcoin(BTC) ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
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
                      Clipboard.setData(ClipboardData(text: widget.address)).then(
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
                    title: 'Chia sẻ',
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
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
