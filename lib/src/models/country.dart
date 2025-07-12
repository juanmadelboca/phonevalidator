import 'dart:convert';

/// A class representing a country with its associated properties.
class Country{
  /// The name of the country.
  final String countryName;
  /// The ISO code of the country (e.g., "US" for United States).
  final String isoCode;
  /// The international dialing code for the country (e.g., "+1" for United States).
  final String dialCode;
  /// A visual representation of the country, often including the dial code and ISO code.
  final String visualText;
  /// A regular expression pattern used to validate phone numbers for this country.
  final String pattern;
  /// A mask pattern used for formatting phone numbers in this country.
  final String mask;
  /// The emoji flag representing the country.
  final String emoji;
  /// A list of area codes for the country.
  final List<int> areaCodes;

  /// Creates a [Country] object.
  /// All parameters are required.
  Country({
    required this.countryName,
    required this.isoCode,
    required this.dialCode,
    required this.visualText,
    required this.pattern,
    required this.mask,
    required this.emoji,
    required this.areaCodes,
  });

  /// Creates a [Country] object from a JSON map.
  /// Provides default values if certain keys are missing or null in the JSON.
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        countryName: json['countryName'] as String? ?? 'Unknown',
      isoCode: json['isoCode'] as String? ?? '',
      dialCode: json['dialCode'] as String? ?? '',
      visualText: json['visualText'] as String? ?? '',
      pattern: json['pattern'] as String? ?? r'^\d+$',
      mask: json['mask'] as String? ?? '',
      emoji: json['emoji'] as String? ?? '',
      areaCodes: (json['areaCodes'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ?? <int>[],
    );
  }

  /// Converts the [Country] object to a [Map<String, dynamic>].
  Map<String,dynamic> toMap(){
    return {
      'countryName': countryName,
      'isoCode': isoCode,
      'dialCode': dialCode,
      'visualText': visualText,
      'pattern': pattern,
      'mask': mask,
      'emoji': emoji,
      'areaCodes': areaCodes,
    };
  }

  /// Converts the [Country] object to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  String toString() => '$countryName ($visualText) $emoji';

  /// Returns a default string representation for display purposes,
  /// typically combining the emoji flag and ISO code.
  String getDefaultView(){
    return '$emoji $isoCode';
  }
}