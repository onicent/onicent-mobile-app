class ListOfCountryModel {
  String? countryFlag;
  String? countryName;
  String? countryCode;

  ListOfCountryModel({this.countryFlag, this.countryName, this.countryCode});

  ListOfCountryModel.fromJson(Map<String, dynamic> json) {
    countryFlag = json['countryFlag'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryFlag'] = this.countryFlag;
    data['countryName'] = this.countryName;
    data['countryCode'] = this.countryCode;
    return data;
  }
}

