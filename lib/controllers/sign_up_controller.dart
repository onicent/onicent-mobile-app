import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/sign_up/list_of_country_model.dart';

class SignUpController extends GetxController {
  // final RxList<ListOfCountryModel> countryData = <ListOfCountryModel>[].obs;
  // RxList<ListOfCountryModel> listCountry = <ListOfCountryModel>[].obs;

  final Rx<Future<List<ListOfCountryModel>>> countryData =
      Future.value(<ListOfCountryModel>[]).obs;
  Rx<Future<List<ListOfCountryModel>>> listCountry =
      Future.value(<ListOfCountryModel>[]).obs;

  @override
  void onInit() {
    fetchCountry();
    // listCountry = countryData;

    // print(listCountry.value[0].country);
    super.onInit();
  }

  Future<List<ListOfCountryModel>> getDataJson() async {
    await Future.delayed(Duration(seconds: 1));

    String data =
        await rootBundle.loadString('assets/data/list_of_countries.json');
    var list = json.decode(data) as List<dynamic>;
    var countriesData =
        list.map((model) => ListOfCountryModel.fromJson(model)).toList();
    return Future.value(countriesData);
  }

  void fetchCountry() async {
    countryData.value = getDataJson();
    listCountry.value = getDataJson();
  }

  Future<void> fetchCountriesData() async {
    String data =
        await rootBundle.loadString('assets/data/list_of_countries.json');
    var list = json.decode(data) as List<dynamic>;
    var countriesData =
        list.map((model) => ListOfCountryModel.fromJson(model)).toList();
  }

  Future<void> searchCountry(String value) async {
    String data = await rootBundle.loadString('assets/data/list_of_countries.json');
    var list = json.decode(data) as List<dynamic>;
    var countriesData = list.map((model) => ListOfCountryModel.fromJson(model)).toList();

    if (value != null && value.isNotEmpty) {

      var x = countriesData
          .where((element) =>
              (element.country!.toLowerCase().contains(value.toLowerCase())))
          .toList();
      listCountry.value = Future.value(x);
      update();

    } else {
      listCountry.value = Future.value(countriesData);
      update();
    }
  }
}
