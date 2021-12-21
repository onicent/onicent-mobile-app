import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/market/list_crypto_model.dart';

List<ListCryptoModel> parseListCrypto(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var cryptoModel = list.map((model) => ListCryptoModel.fromJson(model)).toList();
  return cryptoModel;
}


Future<List<ListCryptoModel>> fetchListCrypto () async{
  final response = await http.get(Uri.parse('https://616561c7cb73ea0017641f8b.mockapi.io/list-crypto'));
  if(response.statusCode == 200){
    return compute(parseListCrypto, response.body);
  }else{
    throw Exception('');
  }

}

