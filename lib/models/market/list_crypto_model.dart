class ListCryptoModel {
  String? id;
  bool? isUp;
  String? cryptoIcon;
  String? cryptoName;
  String? cryptoShortName;
  List<double>? dataChart;
  double? cryptoPriceNow;
  double? upOrDownPercent;
  int? status;

  ListCryptoModel({
    this.id,
    this.isUp,
    this.cryptoIcon,
    this.cryptoName,
    this.cryptoShortName,
    this.dataChart,
    this.cryptoPriceNow,
    this.upOrDownPercent,
    this.status,
  });

  ListCryptoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isUp = json['isUp'];
    cryptoIcon = json['cryptoIcon'];
    cryptoName = json['cryptoName'];
    cryptoShortName = json['cryptoShortName'];
    dataChart = json['dataChart'].map((i) => i.toDouble()).toList().cast<double>();
    cryptoPriceNow = json['cryptoPriceNow'].toDouble();
    upOrDownPercent = json['upOrDownPercent'].toDouble();
    status = json['status'].toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isUp'] = isUp;
    data['cryptoIcon'] = cryptoIcon;
    data['cryptoName'] = cryptoName;
    data['cryptoShortName'] = cryptoShortName;
    data['dataChart'] = dataChart;
    data['cryptoPriceNow'] = cryptoPriceNow;
    data['upOrDownPercent'] = upOrDownPercent;
    data['status'] = status;
    return data;
  }
}
