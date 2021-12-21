import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import '../../widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String kTransparentBackgroundPage = '''
  <!DOCTYPE html>
  <html>
  <head>
    <title>Transparent background test</title>
  </head>
  <style type="text/css">
    body { background: transparent; margin: 0; padding: 0; }
    #container { position: relative; margin: 0; padding: 0; width: 100vw; height: 100vh; }
    #shape { background: red; width: 200px; height: 200px; margin: 0; padding: 0; position: absolute; top: calc(50% - 100px); left: calc(50% - 100px); }
    p { text-align: center; }
  </style>
  <body>
    <div id="container">
      <p>Transparent background test</p>
      <div id="shape"></div>
    </div>
  </body>
  </html>
''';

class CryptoCandlestickChart extends StatelessWidget {
  final _links = ['https://camellabs.com'];
  // final Completer<WebViewController> _controller =
  // Completer<WebViewController>();

  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 600,
        child: WebView(
          initialUrl: 'about:blank',
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
            _loadHtmlFromAssets();
          },
          javascriptMode: JavascriptMode.unrestricted,

        ),
    );
  }

  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('assets/candlestick.html');
    _controller.loadUrl( Uri.dataFromString(
        fileText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString());
  }

}