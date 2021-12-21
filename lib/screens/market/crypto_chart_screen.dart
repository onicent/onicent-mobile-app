import 'dart:convert';

import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:onicent/utilities/chart/chart_style.dart';
import 'package:onicent/utilities/chart/chart_translations.dart';
import 'package:onicent/utilities/chart/flutter_k_chart.dart';
import 'package:onicent/utilities/chart/k_chart_widget.dart';

class CryptoChartScreen extends StatefulWidget {
  const CryptoChartScreen({Key? key}) : super(key: key);

  @override
  _CryptoChartScreenState createState() => _CryptoChartScreenState();
}

class _CryptoChartScreenState extends State<CryptoChartScreen> {
  List<KLineEntity>? datas;
  bool showLoading = true;
  MainState _mainState = MainState.MA;
  bool _volHidden = false;
  SecondaryState _secondaryState = SecondaryState.NONE;
  bool isLine = false;
  bool isChinese = false;
  bool _hideGrid = false;
  bool _showNowPrice = true;
  List<DepthEntity>? _bids, _asks;
  bool isChangeUI = false;

  ChartStyle chartStyle = ChartStyle();
  ChartColors chartColors = ChartColors();

  @override
  void initState() {
    chartColors.upColor = Color(0xFF27CE02);
    chartColors.dnColor = Color(0xFFFF3232);
    chartColors.ma5Color = Colors.yellow;
    chartColors.ma10Color = Colors.lightGreen;
    chartColors.ma30Color = Colors.purple;
    chartColors.gridColor = const Color(0xFFF6F6F8);

    super.initState();
    getData('1day');
    rootBundle.loadString('assets/depth.json').then((result) {
      final parseJson = json.decode(result);
      final tick = parseJson['tick'] as Map<String, dynamic>;
      final List<DepthEntity> bids = (tick['bids'] as List<dynamic>)
          .map<DepthEntity>(
              (item) => DepthEntity(item[0] as double, item[1] as double))
          .toList();
      final List<DepthEntity> asks = (tick['asks'] as List<dynamic>)
          .map<DepthEntity>(
              (item) => DepthEntity(item[0] as double, item[1] as double))
          .toList();
      initDepth(bids, asks);
    });
  }

  void initDepth(List<DepthEntity>? bids, List<DepthEntity>? asks) {
    if (bids == null || asks == null || bids.isEmpty || asks.isEmpty) return;
    _bids = [];
    _asks = [];
    double amount = 0.0;
    bids.sort((left, right) => left.price.compareTo(right.price));
    bids.reversed.forEach((item) {
      amount += item.vol;
      item.vol = amount;
      _bids!.insert(0, item);
    });

    amount = 0.0;
    asks.sort((left, right) => left.price.compareTo(right.price));
    asks.forEach((item) {
      amount += item.vol;
      item.vol = amount;
      _asks!.add(item);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   height: 40,
        //   margin: EdgeInsets.only(bottom: 10.0),
        //   decoration: BoxDecoration(
        //     border: Border(
        //       bottom: BorderSide(width: 0.5, color: Color(0xFFDFDFE0)),
        //     ),
        //     color: Colors.black12,
        //   ),
        //   child: Row(
        //     children: [
        //       Expanded(child: Text('M30', textAlign: TextAlign.center,),),
        //       Expanded(child: Text('H1', textAlign: TextAlign.center,),),
        //       Expanded(child: Text('H4', textAlign: TextAlign.center,),),
        //       Expanded(child: Text('Daily', textAlign: TextAlign.center,),),
        //       Expanded(child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Text('Weekly'),
        //           Icon(
        //             Icons.signal_cellular_4_bar,
        //             size: 10,
        //           ),
        //         ],),),
        //       Expanded(child: Icon(Icons.settings, size: 18.0,)),
        //
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 320,
          width: double.infinity,
          child: KChartWidget(
            datas,
            chartStyle,
            chartColors,
            isLine: isLine,
            mainState: _mainState,
            volHidden: _volHidden,
            secondaryState: _secondaryState,
            fixedLength: 2,
            timeFormat: TimeFormat.YEAR_MONTH_DAY,
            translations: kChartTranslations,
            showNowPrice: _showNowPrice,
            //`isChinese` is Deprecated, Use `translations` instead.
            isChinese: isChinese,
            hideGrid: _hideGrid,
            maDayList: [1, 100, 1000],
            bgColor: [Color(0xFFFFFFFF), Colors.white],
          ),
        ),
        // buildButtons()
      ],
    );
  }



Widget buildButtons() {
  return Wrap(
    alignment: WrapAlignment.spaceEvenly,
    children: <Widget>[
      button("Time Mode", onPressed: () => isLine = true),
      button("K Line Mode", onPressed: () => isLine = false),
      button("Line:MA", onPressed: () => _mainState = MainState.MA),
      button("Line:BOLL", onPressed: () => _mainState = MainState.BOLL),
      button("Hide Line", onPressed: () => _mainState = MainState.NONE),
      button("Secondary Chart:MACD",
          onPressed: () => _secondaryState = SecondaryState.MACD),
      button("Secondary Chart:KDJ",
          onPressed: () => _secondaryState = SecondaryState.KDJ),
      button("Secondary Chart:RSI",
          onPressed: () => _secondaryState = SecondaryState.RSI),
      button("Secondary Chart:WR",
          onPressed: () => _secondaryState = SecondaryState.WR),
      button("Secondary Chart:CCI",
          onPressed: () => _secondaryState = SecondaryState.CCI),
      button("Secondary Chart:Hide",
          onPressed: () => _secondaryState = SecondaryState.NONE),
      button(_volHidden ? "Show Vol" : "Hide Vol",
          onPressed: () => _volHidden = !_volHidden),
      button("Change Language", onPressed: () => isChinese = !isChinese),
      button(_hideGrid ? "Show Grid" : "Hide Grid",
          onPressed: () => _hideGrid = !_hideGrid),
      button(_showNowPrice ? "Hide Now Price" : "Show Now Price",
          onPressed: () => _showNowPrice = !_showNowPrice),
      button("Customize UI", onPressed: () {
        setState(() {
          isChangeUI = !isChangeUI;
          if (isChangeUI) {
            chartColors.selectBorderColor = Color(0xff648fff);
            chartColors.selectFillColor = Colors.green;

            chartColors.upColor = Colors.amber;
            chartColors.bgColor = [Colors.amber,Colors.amber];
            chartColors.vCrossColor = Colors.amber;
            chartColors.kLineColor = Colors.amber ;
            chartColors.dnColor = Colors.amber ;

            chartColors.lineFillColor = Color(0xff648fff); // gradien
            chartColors.kLineColor = Color(0xff0046ff); // line color
          } else {
            chartColors.selectBorderColor = const Color(0xff6C7A86);
            chartColors.selectFillColor = const Color(0xff0D1722);
            chartColors.lineFillColor = Colors.lightGreenAccent;
            chartColors.kLineColor = Colors.green;
          }
        });
      }),
    ],
  );
}

Widget button(String text, {VoidCallback? onPressed}) {
  return TextButton(
    onPressed: () {
      if (onPressed != null) {
        onPressed();
        setState(() {});
      }
    },
    child: Text(text),
    style: TextButton.styleFrom(
      primary: Colors.white,
      minimumSize: const Size(88, 44),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      backgroundColor: Colors.blue,
    ),
  );
}

void getData(String period) {
  final Future<String> future = getIPAddress(period);
  future.then((String result) {
    final Map parseJson = json.decode(result) as Map<dynamic, dynamic>;
    final list = parseJson['data'] as List<dynamic>;
    datas = list
        .map((item) => KLineEntity.fromJson(item as Map<String, dynamic>))
        .toList()
        .reversed
        .toList()
        .cast<KLineEntity>();
    DataUtil.calculate(datas!);
    showLoading = false;
    setState(() {});
  }).catchError((_) {
    showLoading = false;
    setState(() {});
    print('### datas error $_');
  });
}

Future<String> getIPAddress(String? period) async {
  var url =
      'https://api.huobi.br.com/market/history/kline?period=${period ?? '1year'}&size=300&symbol=bchusdt';
  late String result;
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    result = response.body;
  } else {
    print('Failed getting IP address');
  }
  return result;
}
}
