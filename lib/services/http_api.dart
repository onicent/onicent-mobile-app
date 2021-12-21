import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/market/favorite.dart';

List<Favorite> parseListFavorite(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var cryptoModel = list.map((model) => Favorite.fromJson(model)).toList();
  return cryptoModel;
}


Future<List<Favorite>> fetchFavorite () async{
  final response = await http.get(Uri.parse('https://616561c7cb73ea0017641f8b.mockapi.io/favorite'));
  if(response.statusCode == 200){
    return compute(parseListFavorite, response.body);
  }else{
    throw Exception('');
  }

}

