import 'dart:convert';

class Country{
  final String countryName;
  final String isoCode;
  final String dialCode;
  final String visualText;
  final String pattern;
  final String mask;
  final String emoji;

  Country({
    required this.countryName,
    required this.isoCode,
    required this.dialCode,
    required this.visualText,
    required this.pattern,
    required this.mask,
    required this.emoji,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        countryName: json['countryName'] as String? ?? 'Unknown',
      isoCode: json['isoCode'] as String? ?? '',
      dialCode: json['dialCode'] as String? ?? '',
      visualText: json['visualText'] as String? ?? '',
      pattern: json['pattern'] as String? ?? r'^\d+$',
      mask: json['mask'] as String? ?? '',
      emoji: json['emoji'] as String? ?? '',
    );
  }
  Map<String,dynamic> toMap(){
    return {
      'countryName': countryName,
      'isoCode': isoCode,
      'dialCode': dialCode,
      'visualText': visualText,
      'pattern': pattern,
      'mask': mask,
      'emoji': emoji,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => '$countryName ($visualText) $emoji';
}