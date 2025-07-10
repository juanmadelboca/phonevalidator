import 'countries_names_ar.dart';
import 'countries_names_de.dart';
import 'countries_names_en.dart';
import 'countries_names_es.dart';
import 'countries_names_fr.dart';
import 'countries_names_hi.dart';
import 'countries_names_id.dart';
import 'countries_names_it.dart';
import 'countries_names_ja.dart';
import 'countries_names_ko.dart';
import 'countries_names_pt.dart';
import 'countries_names_ru.dart';
import 'countries_names_zh.dart';

String countryNames(String lang,String isoCode){
  switch(lang.toLowerCase()){
    case 'es':
      return _getName(countries_es, isoCode);
    case 'en':
      return _getName(countries_en, isoCode);
    case 'pt':
      return _getName(countries_pt, isoCode);
    case 'fr':
      return _getName(countries_fr, isoCode);
    case 'de':
      return _getName(countries_de, isoCode);
    case 'it':
      return _getName(countries_it, isoCode);
    case 'ru':
      return _getName(countries_ru, isoCode);
    case 'zh':
      return _getName(countries_zh, isoCode);
    case 'ja':
      return _getName(countries_ja, isoCode);
    case 'ko':
      return _getName(countries_ko, isoCode);
    case 'ar':
      return _getName(countries_ar, isoCode);
    case 'id':
      return _getName(countries_id, isoCode);
    case 'hi':
      return _getName(countries_hi, isoCode);
    default:
      return _getName(countries_en,isoCode);
  }
}

String _getName(List<Map<String,dynamic>> countries,String isoCode){
  return countries.where((element) => element['isoCode'] == isoCode).first['countryName'];
}