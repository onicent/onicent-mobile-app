import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:onicent/models/sign_up/sign_up_request_model.dart';
import 'package:onicent/models/sign_up/sign_up_response_model.dart';

class SignUpProvider extends GetConnect {
  // Future<Response> postUser(Map data) {
  //   return get('url', body: data);
  // };



  void signUp(String email, String phoneNumber, String password, String fullName, String country) async {
    var response =  await http.post(
      Uri.parse('http://192.168.1.7:8088/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
        'fullName': fullName,
        'country': country,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var res =  SignUpResponseModel.fromJson(jsonDecode(response.body));

      var list = json.decode(jsonDecode(response.body)) as List<dynamic>;

      print(list);
      print('hallo');

    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      // throw Exception('Failed to create album.');
      var list = jsonDecode(response.body);

      print(list);
      print('hallo');

      // print(Exception('Failed to create album.'));
    }

  }


}