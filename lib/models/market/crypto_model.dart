import 'dart:convert';

List<CryptoModel> postFromJson(String str) =>
    List<CryptoModel>.from(json.decode(str).map((x) => CryptoModel.fromMap(x)));

class CryptoModel {
  final String isUp;
  final String cryptoIcon;
  final String cryptoName;
  final String cryptoShortName;
  final String dataChart;

  // final List<double> dataChart;
  final double cryptoPriceNow;
  final double upOrDownPercent;

  CryptoModel({
    required this.isUp,
    required this.cryptoIcon,
    required this.cryptoName,
    required this.cryptoShortName,
    required this.dataChart,
    required this.cryptoPriceNow,
    required this.upOrDownPercent,
  });

  factory CryptoModel.fromMap(Map<String, dynamic> json) => CryptoModel(
        isUp: json["isUp"],
        cryptoIcon: json["cryptoIcon"],
        cryptoName: json["cryptoName"],
        cryptoShortName: json["cryptoShortName"],
        dataChart: json["dataChart"],

        // dataChart: json["dataChart"],
        cryptoPriceNow: json["cryptoPriceNow"],
        upOrDownPercent: json["upOrDownPercent"],
      );
}
