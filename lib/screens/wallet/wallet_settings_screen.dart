import 'package:onicent/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class WalletSettingsScreen extends StatefulWidget {
  const WalletSettingsScreen({Key? key}) : super(key: key);

  @override
  _WalletSettingsScreenState createState() => _WalletSettingsScreenState();
}

class _WalletSettingsScreenState extends State<WalletSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: 'Quản lý tài sản số',
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                bottom: BorderSide(width: 0.6, color: Color(0xFFE8E8E8))
              ),
            ),
            child: Container(
              height: 40.0,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 0.7, color: Color(0xFFECEFF3)),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.search, size: 22.0, color: Colors.grey),
                    SizedBox(width: 10.0),
                    Flexible(
                      child: TextField(
                        style: const TextStyle(fontSize: 15.0, color: Colors.black87),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Tìm kiếm',
                          hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),

                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
          CryptoItem(
            cryptoIcon: 'Tether-icon.png',
            cryptoShortName: 'BTC',
            cryptoName: 'Bitcoin',
            onTap: (){
              Navigator.pop(context);
              // Navigator.of(context)
              //     .push(createRoute(const CryptoDetailScreen()));
              // return print('hellossaaa');
            },
            trailing: Transform.scale(
              transformHitTests: false,
              scale: 1,
              child: GFToggle(
                onChanged: (val){},
                value: true,
                type: GFToggleType.square,
                enabledThumbColor: Color(0xFF367FFD),
                enabledTrackColor: Color(0xFF7FAEFA),
              ),
            ),
          ),
          CryptoItem(
            cryptoIcon: 'Tether-icon.png',
            cryptoShortName: 'BTC',
            cryptoName: 'Bitcoin',
            onTap: (){
              Navigator.pop(context);
              // Navigator.of(context)
              //     .push(createRoute(const CryptoDetailScreen()));
              // return print('hellossaaa');
            },
            trailing: Transform.scale(
              transformHitTests: false,
              scale: 1,
              child: GFToggle(
                onChanged: (val){},
                value: true,
                type: GFToggleType.square,
                enabledThumbColor: Color(0xFF367FFD),
                enabledTrackColor: Color(0xFF7FAEFA),
              ),
            ),
          ),
          CryptoItem(
            cryptoIcon: 'Tether-icon.png',
            cryptoShortName: 'BTC',
            cryptoName: 'Bitcoin',
            onTap: (){
              Navigator.pop(context);
              // Navigator.of(context)
              //     .push(createRoute(const CryptoDetailScreen()));
              // return print('hellossaaa');
            },
            trailing: Transform.scale(
              transformHitTests: false,
              scale: 1,
              child: GFToggle(
                onChanged: (val){},
                value: true,
                type: GFToggleType.square,
                enabledThumbColor: Color(0xFF367FFD),
                enabledTrackColor: Color(0xFF7FAEFA),
              ),
            ),
          ),
          CryptoItem(
            cryptoIcon: 'Tether-icon.png',
            cryptoShortName: 'BTC',
            cryptoName: 'Bitcoin',
            onTap: (){
              Navigator.pop(context);
              // Navigator.of(context)
              //     .push(createRoute(const CryptoDetailScreen()));
              // return print('hellossaaa');
            },
            trailing: Transform.scale(
              transformHitTests: false,
              scale: 1,
              child: GFToggle(
                onChanged: (val){},
                value: true,
                type: GFToggleType.square,
                enabledThumbColor: Color(0xFF367FFD),
                enabledTrackColor: Color(0xFF7FAEFA),
              ),
            ),
          ),
          Container(
              height: 0.2,
              width: MediaQuery.of(context).size.width,
              color: Colors.black12),
        ],
      ),
    );
  }

  bool _switchValue=true;

}
