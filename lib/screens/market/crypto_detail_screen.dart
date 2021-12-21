import 'package:onicent/models/market/crypto_detail_model.dart';
import 'package:onicent/services/fetch_api_crypto_detail.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
// import 'crypto_chart_screen.dart';
import 'crypto_candlestick_chart.dart';
// import 'crypto_line_chart.dart';
import 'crypto_chart_screen.dart';

class CryptoDetailScreen extends StatefulWidget {
  final String cryptoId;
  const CryptoDetailScreen({Key? key, required this.cryptoId})
      : super(key: key);

  @override
  _CryptoDetailScreenState createState() => _CryptoDetailScreenState();
}

class _CryptoDetailScreenState extends State<CryptoDetailScreen> {
  bool isFavorite = false;
  bool isCandleChart = false;

  // List<CryptoDetailModel>? _cryptoDetails;
  CryptoDetailModel? _cryptoDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchCryptoDetail('oll').then(
      (value) => {
        setState(() {
          _cryptoDetail = value[0];
        }),
      },
    );
    // _cryptoDetail = _cryptoDetails![0];
  }

  // Page reload function.
  Future<Null> _refreshDataCrypto() async {
    fetchCryptoDetail('').then(
          (value) => {
        setState(() {
          // Remove all elements in array.

          // Add newly loaded element to list.
          _cryptoDetail = value[0];
        }),
      },
    );

    // 1s wait animation.
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    // print(_cryptoDetail![0].introduce);
    // if(_cryptoDetail != null){
    //   print(_cryptoDetail!.cryptoName.toString());
    // }
    print(NumberFormatter.formatter('1000'));
    return EmptyScreen(
      title: 'BTC',
      tabBarAction: [
        IconButton(
          onPressed: () {
            setState(() {
              isCandleChart = !isCandleChart;
            });
          },
          icon: Image.asset(
            'assets/icons/${isCandleChart ? 'icon_line_chart.png' : 'icon_candle_chart.png'}',
            width: 24.0,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          icon: Image.asset(
            'assets/icons/${isFavorite ? 'ic_favourite_checked.png' : 'ic_favourite_unchecked.png'}',
            width: 23.0,
            // color: Colors.white,
          ),
        ),
        SizedBox(width: 5.0)
      ],
      body: Container(
        child: (() {
          if (_cryptoDetail != null) {
            return Column(
              children: [
                Flexible(
                  child: RefreshIndicator(
                    onRefresh: _refreshDataCrypto,
                    child: ListView(
                      children: [
                        if (isCandleChart) ...[
                          CryptoCandlestickChart(),
                        ] else ...[
                          Container(
                            decoration: const BoxDecoration(color: Colors.white),
                            child: Column(
                              children:  [
                                SizedBox(height: 5.0),
                                Container(
                                  height: 460.0,
                                  padding: EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '2.000',
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.amber[900],
                                            ),
                                          ),
                                          Text(
                                            ' VNDT',
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.blue[900],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              color: Color(0xFF34F30A),
                                            ),
                                            child: Text(
                                              '+0.00025802 BTC',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.0),
                                      Flexible(
                                        child: Container(
                                          child: CryptoChartScreen(),
                                        ),
                                      ),

                                      Row(
                                        children: [
                                          Flexible(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: <Widget>[
                                                  _itemBottom(title: '1H', backgroundColor: Colors.blue[800], colorTitle: Colors.white),
                                                  SizedBox(width: 12.0),
                                                  _itemBottom(title: '1D'),
                                                  SizedBox(width: 12.0),
                                                  _itemBottom(title: '1W'),
                                                  SizedBox(width: 12.0),
                                                  _itemBottom(title: '1M'),
                                                  SizedBox(width: 12.0),
                                                  _itemBottom(title: '1Y'),
                                                  SizedBox(width: 12.0),
                                                  _itemBottom(title: '3Y'),
                                                  SizedBox(width: 12.0),
                                                  _itemBottom(title: '5Y'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 12.0),
                                          _itemBottom(icon: Image.asset(
                                            'assets/icons/icon_line_chart.png',
                                            width: 16.0,
                                            color: Colors.black54,
                                          )),
                                          SizedBox(width: 12.0),
                                          _itemBottom(icon: Image.asset(
                                            'assets/icons/icon_candle_chart.png',
                                            width: 18.0,
                                            color: Colors.white,
                                          ),backgroundColor: Colors.blue[800],),
                                        ],
                                      ),
                                      SizedBox(height: 2.0),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10.0),
                            child: const Text(
                              'Dữ liệu',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15.0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                _itemInfo(
                                  title: 'Khối lượng 24H',
                                  value:
                                  '${NumberFormatter.formatter('${_cryptoDetail!.volume24h}')}',
                                ),
                                _itemInfo(
                                  title: 'Khối lượng trung bình',
                                  value:
                                  '${NumberFormatter.formatter('${_cryptoDetail!.averageVolume}')}',
                                ),
                                _itemInfo(
                                  title: 'Market Cap',
                                  value:
                                  '${NumberFormatter.formatter('${_cryptoDetail!.marketCap}')}',
                                ),
                                _itemInfo(
                                  title: 'Lưu hành',
                                  value:
                                  '${NumberFormatter.formatter('${_cryptoDetail!.circulatingSupply}')}',
                                ),
                                _itemInfo(
                                  title: 'Tổng công',
                                  value:
                                  '${NumberFormatter.formatter('${_cryptoDetail!.totalSupply}')}',
                                ),
                                _itemInfo(
                                  title: 'Lượt xem 24H',
                                  value: '${NumberFormatter.formatter('1000')}',
                                ),
                                _itemInfo(
                                    title: 'Gía hiện tại',
                                    value: '1.500.000.000 VNDT'),
                                SizedBox(height: 12.0),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Người mua',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Text(
                                      'Người bán',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.0),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 15.0,
                                      width: (MediaQuery.of(context).size.width * (_cryptoDetail!.buyingPower! / 100)) - 15.0,
                                      color: Color(0xFFFC2222),
                                    ),
                                    Container(
                                      height: 15.0,
                                      width: (MediaQuery.of(context).size.width *
                                          ((100 - _cryptoDetail!.buyingPower!)/100)) -
                                          15.0,
                                      color: Color(0xFF27DC02),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.0),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${_cryptoDetail!.buyingPower}%',
                                      style: TextStyle(
                                        color: Color(0xFFF61616),
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Text(
                                      '${100 - _cryptoDetail!.buyingPower!}%',
                                      style: TextStyle(
                                        color:  Color(0xFF28EF00),
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10.0),
                            child: const Text(
                              'Giới thiệu',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Container(
                            padding: EdgeInsets.all(15.0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Text(
                              '${_cryptoDetail!.introduce}',
                              style: const TextStyle(
                                fontSize: 15.0,
                                height: 1.7,
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70.0,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Color(0xFFF5F4F4)),
                    ),
                  ),
                  child: Material(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: _btn(
                            title: 'Bán',
                            backgroundColor:  Color(0xFFFA2828),
                            onPress: () {},
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: _btn(
                            isBuy: true,
                            title: 'Mua',
                            backgroundColor: Color(0xFF24CD02),
                            onPress: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }()),
      ),
    );
  }

  Widget _itemInfo({
    String title = '',
    String value = '',
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xFFF1F2F6)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 15.0,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _btn({
    String title = '',
    bool isBuy = false,
    Color? colorTitle = Colors.white,
    Color backgroundColor = Colors.blue,
    Function()? onPress,
  }) {
    return Center(
      child: InkWell(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 350,
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 20.0),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  '${isBuy? 'Mua': 'Bán'} BTC',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                        color: Color(0xFFEFF2F6), width: 1.0)),
                                child: Row(
                                  children: [
                                    InkWell(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/crypto/usdt.png',
                                            width: 22.0,
                                          ),
                                          SizedBox(width: 5.0),
                                          Text('BTC'),
                                          SizedBox(width: 5.0),
                                          Icon(
                                            Icons.expand_more,
                                            size: 20.0,
                                          ),
                                          SizedBox(width: 5.0),
                                          Container(
                                            color: Color(0xFFEFF2F6),
                                            width: 1.0,
                                            height: 30.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 5.0),
                                    Flexible(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Color(0xFFEFF2F6),
                                            width: 1.0)),
                                    child: InkWell(
                                      child: Icon(
                                        Icons.swap_vert,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                        color: Color(0xFFEFF2F6), width: 1.0)),
                                child: Row(
                                  children: [
                                    InkWell(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/crypto/btc.png',
                                            width: 22.0,
                                          ),
                                          SizedBox(width: 5.0),
                                          Text('BTC'),
                                          SizedBox(width: 5.0),
                                          Icon(
                                            Icons.expand_more,
                                            size: 20.0,
                                          ),
                                          SizedBox(width: 5.0),
                                          Container(
                                            color: Color(0xFFEFF2F6),
                                            width: 1.0,
                                            height: 30.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 5.0),
                                    Flexible(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: Material(
                            color: Colors.white,
                            child: ButtonC(title: isBuy? 'Mua': 'Bán'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        borderRadius: BorderRadius.circular(5.0),
        child: Ink(
          height: 40.0,
          width: 140.0,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: colorTitle,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _itemBottom({
    String? title,
    Widget? icon,
    Function()? onTap,
    Color? colorTitle,
    Color? backgroundColor,

  }) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Ink(
          width: 45.0,
          height: 28.0,
          padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            // border: Border.all(width: 1.0, color: const Color(0xffeeeff3)),
            color: backgroundColor ?? const Color(0xffeeeff3),
          ),
          child: Center(
            child: icon ?? Text(
              '${title}',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.0,
                color: colorTitle ?? Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NumberFormatter {
  static String? formatter(String currentBalance) {
    try {
      // suffix = {' ', 'k', 'M', 'B', 'T', 'P', 'E'};
      double value = double.parse(currentBalance);

      if (value < 1000) {
        // less than a million
        return value.toStringAsFixed(2);
      } else if (value >= 1000 && value < (1000 * 10 * 100)) {
        // less than 100 million
        double result = value / 1000;
        return result.toStringAsFixed(2) + "K";
      } else if (value >= (1000 * 10 * 100) &&
          value < (1000 * 10 * 100 * 100)) {
        // less than 100 million
        double result = value / (1000 * 10 * 100);
        return result.toStringAsFixed(2) + "M";
      } else if (value >= (1000 * 10 * 100 * 100) &&
          value < (1000 * 10 * 100 * 100 * 100)) {
        // less than 100 billion
        double result = value / (1000 * 10 * 100 * 100);
        return result.toStringAsFixed(2) + "B";
      } else if (value >= (1000 * 10 * 100 * 100 * 100) &&
          value < (1000 * 10 * 100 * 100 * 100 * 100)) {
        // less than 100 trillion
        double result = value / (1000 * 10 * 100 * 100 * 100);
        return result.toStringAsFixed(2) + "T";
      }
    } catch (e) {
      print(e);
    }
  }
}
