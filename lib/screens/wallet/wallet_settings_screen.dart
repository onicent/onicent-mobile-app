import 'package:get/get.dart';
import 'package:onicent/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('Quản lý tài sản số'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            child: TextFieldInput(
              leading: Icon(Icons.search, size: 22.0, color: Colors.grey),
              hintText: 'Tìm kiếm',
            ),
          ),

          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView(
                children: [
                  Item(
                    height: 75.0,
                    arrow: false,
                    borderBottom: true,
                    leading: Image.asset('assets/icons/crypto/btc.png', width: 45.0),
                    title: 'BTC',
                    subTitle: 'Bitcoin',
                    trailing: Transform.scale(
                      transformHitTests: false,
                      scale: 1,
                      child: Switch(
                        value: _switchValue,
                        onChanged: (bool newValue) {
                          setState(() {
                            _switchValue = newValue;
                          });
                        },
                        activeColor: Colors.amber,
                      ),
                    ),
                  ),
                  Item(
                    height: 75.0,
                    arrow: false,
                    borderBottom: true,
                    leading: Image.asset('assets/icons/crypto/btc.png', width: 45.0),
                    title: 'BTC',
                    subTitle: 'Bitcoin',
                    trailing: Transform.scale(
                      transformHitTests: false,
                      scale: 1,
                      child: Switch(
                        value: _switchValue,
                        onChanged: (bool newValue) {
                          setState(() {
                            _switchValue = newValue;
                          });
                        },
                        activeColor: Colors.amber,
                      ),
                    ),
                  ),
                  Item(
                    height: 75.0,
                    arrow: false,
                    borderBottom: true,
                    leading: Image.asset('assets/icons/crypto/btc.png', width: 45.0),
                    title: 'BTC',
                    subTitle: 'Bitcoin',
                    trailing: Transform.scale(
                      transformHitTests: false,
                      scale: 1,
                      child: Switch(
                        value: _switchValue,
                        onChanged: (bool newValue) {
                          setState(() {
                            _switchValue = newValue;
                          });
                        },
                        activeColor: Colors.amber,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  bool _switchValue=false;

}
