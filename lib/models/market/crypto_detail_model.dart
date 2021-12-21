class CryptoDetailModel {
  String? id;
  String? cryptoName;
  String? cryptoShortName;
  double? priceNow;
  String? introduce;
  double? volume24h;
  double? marketCap;
  double? circulatingSupply;
  double? totalSupply;
  double? maxSupply;
  double? averageVolume;
  double? buyingPower;
  List<double>? dataChart;

  CryptoDetailModel(
      {this.id,
        this.cryptoName,
        this.cryptoShortName,
        this.priceNow,
        this.introduce,
        this.volume24h,
        this.marketCap,
        this.circulatingSupply,
        this.totalSupply,
        this.maxSupply,
        this.averageVolume,
        this.buyingPower,
        this.dataChart});

  CryptoDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cryptoName = json['cryptoName'];
    cryptoShortName = json['cryptoShortName'];
    priceNow = json['priceNow'].toDouble();
    introduce = json['introduce'];
    volume24h = json['volume24h'].toDouble();
    marketCap = json['marketCap'].toDouble();
    circulatingSupply = json['circulatingSupply'].toDouble();
    totalSupply = json['totalSupply'].toDouble();
    maxSupply = json['maxSupply'].toDouble();
    averageVolume = json['averageVolume'].toDouble();
    buyingPower = json['buyingPower'].toDouble();
    dataChart = json['dataChart'].map((i) => i.toDouble()).toList().cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cryptoName'] = cryptoName;
    data['cryptoShortName'] = cryptoShortName;
    data['priceNow'] = priceNow;
    data['introduce'] = introduce;
    data['volume24h'] = volume24h;
    data['marketCap'] = marketCap;
    data['circulatingSupply'] = circulatingSupply;
    data['totalSupply'] = totalSupply;
    data['maxSupply'] = maxSupply;
    data['averageVolume'] = averageVolume;
    data['buyingPower'] = buyingPower;
    data['dataChart'] = dataChart;
    return data;
  }
}
