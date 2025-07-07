import 'dart:convert';

import 'package:flutter/services.dart';

import 'models/Country.dart';

class PhoneValidator {
  String lang = 'en';
  PhoneValidator._internal();
  static final PhoneValidator _instance = PhoneValidator._internal();
  factory PhoneValidator() => _instance;
  bool _isLoading = false; // Track loading state
  bool _hasError = false; //

  void setLanguage(String language) async {
    switch(language.toLowerCase()){
      case 'es':
        lang = 'es';
        break;
      case 'en':
        lang = 'en';
        break;
      case 'pt':
        lang = 'pt';
        break;
      case 'fr':
        lang = 'fr';
        break;
      case 'de':
        lang = 'de';
        break;
      case 'it':
        lang = 'it';
        break;
      case 'ru':
        lang = 'ru';
        break;
      case 'zh':
        lang = 'zh';
        break;
      case 'ja':
        lang = 'ja';
        break;
      case 'ko':
        lang = 'ko';
        break;
      case 'ar':
        lang = 'ar';
        break;
      default:
        lang = 'en';
        break;
    }
    _isLoading = false;
    _hasError = false;
    await initializeCountries();
    _isLoading = true;
  }

  String getLanguage(){
    return lang;
  }


  Future<List<Country>> loadCountries() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/countries_${lang}.json');
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => Country.fromJson(json)).toList();
    } catch (e) {
      print('Error loading countries: $e');
      return []; // Return an empty list in case of error
    }
  }

  List<Country> _cachedCountries = [];

  List<Country> getCountries() {
    return _cachedCountries; // Returns cached data; update it after loading
  }

  Future<void> initializeCountries() async {
    _cachedCountries = await loadCountries();
  }

}