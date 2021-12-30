import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../models/sign_up/list_of_country_model.dart';

List<ListOfCountryModel> parseListOfCountry(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var cryptoModel = list.map((model) => ListOfCountryModel.fromJson(model)).toList();
  return cryptoModel;
}


Future<List<ListOfCountryModel>> fetchListOfCountry () async{
  final response = await http.get(Uri.parse('http://192.168.1.7:8088/list-of-country'));
  if(response.statusCode == 200){
    return compute(parseListOfCountry, response.body);
  }else{
    throw Exception('');
  }

}

