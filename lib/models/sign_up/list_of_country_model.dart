import 'dart:convert';

List<ListOfCountryModel> listOfCountryFromJson(String str) => List<ListOfCountryModel>.from(json.decode(str).map((x) => ListOfCountryModel.fromJson(x)));

String listOfCountryToJson(List<ListOfCountryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListOfCountryModel {
  String? flag;
  String? country;
  String? code;

  ListOfCountryModel({this.flag, this.country, this.code});

  ListOfCountryModel.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    country = json['country'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    data['country'] = this.country;
    data['code'] = this.code;
    return data;
  }
}
