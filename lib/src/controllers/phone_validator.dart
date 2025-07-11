import 'package:flutter/cupertino.dart';

import '../../cellphone_validator.dart';

/// A class responsible for validating phone numbers based on a selected country.
class PhoneValidator{

  /// The language code for localization (e.g., 'en', 'es').
  String lang = '';

  /// Constructs a [PhoneValidator] instance.
  ///
  /// Requires the [lang] for localization and optionally takes a [phone] number.
 PhoneValidator({ required this.lang,this.phone= ''});
  Country? _country;

  /// Sets the current country for phone number validation.
  ///
  /// The [country] parameter is a [Country] object containing information
  /// like the country code, pattern for validation, etc.
  void setCountry(Country country){
    _country = country;
  }
  /// Gets the currently set country.
  Country? get country => _country;
  /// Gets the language code used for localization.
  String get getLanguage=> lang;

  /// The phone number string to be validated.
  String phone = '';

  /// Sets the phone number to be validated.
  void setPhone(String phoneNumber){
    phone = phoneNumber;
  }

  /// A [ValueNotifier] that broadcasts whether the current phone number is valid.
  ///
  /// Clients can listen to this notifier to react to changes in phone number validity.
  final ValueNotifier<bool> isValidPhoneNotifier = ValueNotifier<bool>(false);

  /// Checks if the provided [phoneNumber] is valid for the currently set country.
  ///
  /// Updates the [isValidPhoneNotifier] with the result of the validation.
  /// If no country is set, the phone number is considered invalid.
  void checkPhone(String phoneNumber){
    if(_country == null) {
      isValidPhoneNotifier.value = false;
      return;
    }
    String pattern = country!.pattern;
    RegExp regExp = RegExp(pattern);
    String fullNumber = "${_country!.visualText}${phoneNumber.replaceAll(RegExp(r'[^0-9]'), '')}";
    phone = fullNumber;
    isValidPhoneNotifier.value = regExp.hasMatch(fullNumber);
  }

}