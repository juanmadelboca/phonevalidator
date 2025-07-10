import '../models/Country.dart';
import '../assets/phones/phones.dart';

class CountryManager {
  String lang = 'en';

  bool _isLoading = false; // Track loading state
  bool _hasError = false; //

 Future<void> setLanguage(String language) async {
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
    await initializeCountries(lang);
  }

  String getLanguage(){
    return lang;
  }


  Future<List<Country>> loadCountries(String lang) async {
    try {
      _isLoading = true;
      _hasError = false;
      await Future.delayed(Duration(seconds: 1));
      final List<dynamic> jsonList = phones().toList();
      List<Country> countries = jsonList.map((json) => Country.fromJson(json)).toList();
      return countries;
    } catch (e) {
      print('Error loading countries: $e');
      // Return an empty list in case of error
      return [];
    }
  }

  List<Country> _cachedCountries = [];

  List<Country> getCountries() {
    return _cachedCountries; // Returns cached data; update it after loading
  }

  Future<void> initializeCountries(String lang) async {
     _cachedCountries = await loadCountries(lang);
     _isLoading = false;
    _hasError = _cachedCountries.isEmpty;
  }

  bool isLoading(){
    return _isLoading;
  }

  bool hasError(){
    return _hasError;
  }

}