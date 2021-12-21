import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/market/crypto_detail_model.dart';

List<CryptoDetailModel> parseListFavorite(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var cryptoDetailModel = list.map((model) => CryptoDetailModel.fromJson(model)).toList();
  return cryptoDetailModel;
}


Future<List<CryptoDetailModel>> fetchCryptoDetail (String cryptoId) async{
  final response = await http.get(Uri.parse('https://616561c7cb73ea0017641f8b.mockapi.io/crypto-detail'), headers: {'Content-Type': 'application/json'});
  if(response.statusCode == 200){
    return compute(parseListFavorite, utf8.decode(response.bodyBytes));
  }else{
    throw Exception('');
  }

}

