
import '../../cellphone_validator.dart';
import '../assets/countriesNames/countries_names.dart';

String getPhovalidatorText(Country? country,String option,String lang){
  if(country == null) return '';
  switch(option){
    case 'mask':
      return country.mask;
    case 'visualText':
      return country.visualText;
    case 'isoCode':
      return country.isoCode;
    case 'defaultView':
      return country.getDefaultView();
    case 'countryName':
      return countryNames(lang, country.isoCode);
    case 'label':
      return country.emoji+' '+countryNames(lang, country.isoCode);
    default:
      return '';
  }
}