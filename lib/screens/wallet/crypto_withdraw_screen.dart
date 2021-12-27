import 'dart:developer';
import 'dart:io';

// import 'package:onicent/screens/hub/bank_link.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/services.dart';

String qrdata = '';

class CryptoWithdrawScreen extends StatefulWidget {
  const CryptoWithdrawScreen({Key? key}) : super(key: key);

  @override
  State<CryptoWithdrawScreen> createState() => _CryptoWithdrawScreenState();
}

class _CryptoWithdrawScreenState extends State<CryptoWithdrawScreen> {
  final _addressWallet = TextEditingController();
  final _amount = TextEditingController();

  String dropdownValue = 'ERC20';
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: Text('Rút BTC'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
        child: Column(
          children: [
            GroupItem(
              children: [
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Image.asset('assets/icons/crypto/usdt.png', width: 45.0,),
                    SizedBox(width: 15.0),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '100.150.000.000 VNDT',
                            style: TextStyle(
                              // color: Color(0xFF2A5CA8),
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Prax VNDT',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
              ],
            ),

            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mạng lưới',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            SizedBox(height: 20.0),
            Container(
              height: 48.0,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(color: Color(0xFFEFF2F6), width: 1.0),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
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
                      child: Text('Mạng lưới: ' + value, style: TextStyle(fontSize: 16.0),),
                    );
                  }).toList(),
                ),
              ),
            ),

            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Địa chỉ ví',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            SizedBox(height: 20.0),
            TextFieldInput(
              trailing: Row(
                children: [
                  InkWell(
                    onTap: () async {
                      ClipboardData? data = await Clipboard.getData('text/plain');
                      setState(() {
                        _addressWallet.text = data!.text.toString();
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: const Text(
                        'PASTE',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2A5CA8),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const QRViewExample(),
                      ));
                    },
                    child: Container(
                      child: Icon(
                        Icons.qr_code_scanner,
                        size: 25.0,
                        color: Color(0xFF2A5CA8),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Số lương',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextFieldInput(
              trailing: InkWell(
                onTap: () {
                  setState(() {
                    _amount.text = qrdata;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: const Text(
                    'MAX',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2A5CA8),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40.0),
            ButtonPress(
              title: 'Gửi',
            ),
          ],
        ),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRViewExample(),
            ));
          },
          child: const Text('qrView'),
        ),
      ),
    );
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    if(result != null){
      qrdata = result.toString();
      Navigator.of(context).pop();
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  else
                    const Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text('Flash: ${snapshot.data}');
                              },
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      'Camera facing ${describeEnum(snapshot.data!)}');
                                } else {
                                  return const Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text('pause',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: const Text('resume',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class TextInput extends StatefulWidget {
  final String title;
  const TextInput({Key? key, required this.title}) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15.0, right: 0.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1.0, color: Color(0xFFF5F8FD)),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: Image.asset(
              'assets/icons/wallet.png',
              width: 25.0,
            ),
          ),
          const Flexible(
            child: TextField(
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.qr_code,
              size: 35.0,
            ),
          ),
        ],
      ),
    );
  }
}
