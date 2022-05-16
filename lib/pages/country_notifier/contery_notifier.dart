import 'dart:convert';
import 'package:covid_19/model/md_country.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryChangeProvider extends ChangeNotifier {
  MDCountry? worldItem;
  List<MDCountry>? countryList = [];
  List<MDCountry>? filterList = [];
  bool isAPILoading = false;

  List<MDCountry>? get getCountryList => countryList;

  List<MDCountry>? get getFilterList => filterList;

  MDCountry? get getWorldItem => worldItem;

  bool get getAPILoading => isAPILoading;

  void setWorldListener(MDCountry item) {
    worldItem = item;
    notifyListeners();
  }

  void setSearchListener(String text) {
    filterList?.clear();
    if (text.isNotEmpty) {
      for (MDCountry country in getCountryList ?? []) {
        if (country.country?.toLowerCase().contains(text.toLowerCase()) ??
            false) {
          filterList?.add(country);
        }
      }
    }
    notifyListeners();
  }

  void setCountryListener(List<MDCountry> list) {
    countryList = list;
    isAPILoading = false;
    notifyListeners();
  }

  void setFilterListener(String text) {
    notifyListeners();
  }

  Future<void> apiGetCovidData() async {
    Map<String, String> header = Map();
    header['Accept'] = 'application/json';
    Uri myUri = Uri.parse('https://api.covid19api.com/summary');
    isAPILoading = true;
    http.get(myUri, headers: header).then((response) {
      if (response.statusCode == 200) {
        Map covid = jsonDecode(response.body);
        if (covid['Message'] == '') {
          setWorldListener(MDCountry.fromJson(covid['Global']));
          setCountryListener((covid['Countries'] as List)
              .map((i) => MDCountry.fromJson(i))
              .toList());
        }
      }
    });
  }
}
