import '../models/country.dart';
import '../assets/phones/phones.dart';

/// Manages country data, including loading, caching, and language settings.
class CountryManager {

  /// Indicates whether country data is currently being loaded.
  bool _isLoading = false; // Track loading state
  /// Indicates whether an error occurred during data loading.
  bool _hasError = false;


  /// Loads country data from the source.
  ///
  /// Simulates a network delay of 1 second.
  /// [lang] is currently unused in this implementation but is kept for future use.
  Future<List<Country>> _loadCountries() async {
    try {
      _isLoading = true;
      _hasError = false;
      // Load country data from the 'phones' asset.
      final List<dynamic> jsonList = getPhones().toList();
      List<Country> countries = jsonList.map((json) => Country.fromJson(json)).toList();
      return countries;
    } catch (e) {
      // Return an empty list in case of error
      return [];
    }
  }

  /// Cached list of countries.
  List<Country> _cachedCountries = [];

  /// Gets the cached list of countries.
  /// Note: This returns the currently cached data.
  /// Call [initializeCountries]to update the cache.

  List<Country> getCountries() {
    return _cachedCountries; // Returns cached data; update it after loading
  }

  /// Initializes the country data by loading and caching it.
  /// Sets [_isLoading] to false and updates [_hasError] based on the result.
  ///
  Future<void> initializeCountries() async {
     _cachedCountries = await _loadCountries();
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