import 'package:flutter/cupertino.dart';
import 'package:phonevalidator/phonevalidator.dart';

class PhoneValidator{

  String lang = '';

 PhoneValidator({ required this.lang,this.phone= ''});
  Country? _country;
  void setCountry(Country country){
    _country = country;
  }
  Country? get country => _country;
  String get getLanguage=> lang;

  String phone = '';

  void setPhone(String phoneNumber){
    phone = phoneNumber;
  }

  final ValueNotifier<bool> isValidPhoneNotifier = ValueNotifier<bool>(false);

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