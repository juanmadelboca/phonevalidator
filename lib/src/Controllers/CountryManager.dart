import '../models/Country.dart';
import '../assets/phones/phones.dart';

/// Manages country data, including loading, caching, and language settings.
class CountryManager {
  /// The current language for country data. Defaults to 'en' (English).
  String lang = 'en';

  /// Indicates whether country data is currently being loaded.
  bool _isLoading = false; // Track loading state
  /// Indicates whether an error occurred during data loading.
  bool _hasError = false;

  /// Sets the language for country data and re-initializes the countries.
  ///
  /// Available languages: 'es', 'en', 'pt', 'fr', 'de', 'it', 'ru', 'zh', 'ja', 'ko', 'ar'.
  /// If an unsupported language is provided, it defaults to 'en'.
 Future<void> setLanguage(String language) async {
    // Sets the language code based on the provided language string.
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

  /// Gets the currently set language.
  String getLanguage(){
    return lang;
  }


  /// Loads country data from the source.
  ///
  /// Simulates a network delay of 1 second.
  /// [lang] is currently unused in this implementation but is kept for future use.
  Future<List<Country>> loadCountries(String lang) async {
    try {
      _isLoading = true;
      _hasError = false;
      // Simulate network delay
      await Future.delayed(Duration(seconds: 1));
      // Load country data from the 'phones' asset.
      final List<dynamic> jsonList = phones().toList();
      List<Country> countries = jsonList.map((json) => Country.fromJson(json)).toList();
      return countries;
    } catch (e) {
      print('Error loading countries: $e');
      // Return an empty list in case of error
      return [];
    }
  }

  /// Cached list of countries.
  List<Country> _cachedCountries = [];

  /// Gets the cached list of countries.
  ///
  /// Note: This returns the currently cached data. Call [initializeCountries]
  /// to update the cache.
  List<Country> getCountries() {
    return _cachedCountries; // Returns cached data; update it after loading
  }

  /// Initializes the country data by loading and caching it.
  /// Sets [_isLoading] to false and updates [_hasError] based on the result.
  /// [lang] specifies the language for which to load the countries.
  Future<void> initializeCountries(String lang) async {
     _cachedCountries = await loadCountries(lang);
     _isLoading = false;
    _hasError = _cachedCountries.isEmpty;
  }

  /// Returns true if country data is currently being loaded, false otherwise.
  bool isLoading(){
    return _isLoading;
  }
  /// Returns true if an error occurred during the last data loading attempt, false otherwise.
  bool hasError(){
    return _hasError;
  }

}