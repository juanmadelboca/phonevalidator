import 'package:cellphone_validator/src/cellphone_validator.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cellphone_validator/cellphone_validator.dart';

final List<Map<String, dynamic>> testNumbers = [
{'phone':'541123456789','isoCode':'AR','countryName':'Argentina','dialCode':'54'} ,  // Argentina
{'phone':'12025550191','isoCode':'US','countryName':'United States','dialCode':'1'},     // USA
{'phone':'14165550123','isoCode':'CA','countryName':'Canada','dialCode':'1'},    // Canada
{'phone':'442079460958','isoCode':'GB','countryName':'United Kingdom','dialCode':'44'},    // UK
{'phone':'4930123456','isoCode':'DE','countryName':'Germany','dialCode':'49'},// Germany
{'phone':'33612345678','isoCode':'FR','countryName':'France','dialCode':'33'},// France
{'phone':'34612345678','isoCode':'ES','countryName':'Spain','dialCode':'34'},// Spain
{'phone':'5511912345678','isoCode':'BR','countryName':'Brazil','dialCode':'55'}, // Brazil
{'phone':'525512345678','isoCode':'MX','countryName':'Mexico','dialCode':'52'}, // Mexico
{'phone':'919123456789','isoCode':'IN','countryName':'India','dialCode':'91'},    // India
{'phone':'61412345678','isoCode':'AU','countryName':'Australia','dialCode':'61'},// Australia
{'phone':'817012345678','isoCode':'JP','countryName':'Japan','dialCode':'81'},   // Japan
{'phone':'79123456789','isoCode':'RU','countryName':'Russia','dialCode':'7'},     // Russia
{'phone':'27821234567','isoCode':'ZA','countryName':'South Africa','dialCode':'27'},     // South Africa
{'phone':'393123456789','isoCode':'IT','countryName':'Italy','dialCode':'39'},    // Italy
{'phone':'8613812345678','isoCode':'CN','countryName':'China','dialCode':'86'},   // China
{'phone':'923001234567','isoCode':'PK','countryName':'Pakistan','dialCode':'92'},    // Pakistan
{'phone':'2348031234567','isoCode':'NG','countryName':'Nigeria', 'dialCode':'234'},   // Nigeria
{'phone':'8801712345678','isoCode':'BD','countryName':'Bangladesh','dialCode':'880'},   // Bangladesh
{'phone':'201001234567','isoCode':'EG','countryName':'Egypt','dialCode':'20'},    // Egypt
{'phone':'84912345678','isoCode':'VN','countryName':'Vietnam','dialCode':'84'},     // Vietnam
{'phone':'905123456789','isoCode':'TR','countryName':'Turkey','dialCode':'90'},    // Turkey
{'phone':'6281234567890','isoCode':'ID','countryName':'Indonesia','dialCode':'62'},   // Indonesia
{'phone':'639171234567','isoCode':'PH','countryName':'Philippines','dialCode':'63'},    // Philippines
{'phone':'66812345678','isoCode':'TH','countryName':'Thailand','dialCode':'66'},     // Thailand
{'phone':'966501234567','isoCode':'SA','countryName':'Saudi Arabia','dialCode':'966'},    // Saudi Arabia
{'phone':'989123456789','isoCode':'IR','countryName':'Iran','dialCode':'98'},    // Iran
{'phone':'60123456789','isoCode':'MY','countryName':'Malaysia','dialCode':'60'},     // Malaysia
{'phone':'31612345678','isoCode':'NL','countryName':'Netherlands','dialCode':'31'},     // Netherlands
{'phone':'48500123456','isoCode':'PL','countryName':'Poland','dialCode':'48'},     // Poland
{'phone':'40712345678','isoCode':'RO','countryName':'Romania','dialCode':'40'},     // Romania
{'phone':'380501234567','isoCode':'UA','countryName':'Ukraine','dialCode':'380'},    // Ukraine
{'phone':'56912345678','isoCode':'CL','countryName':'Chile','dialCode':'56'},     // Chile
{'phone':'5730012345678','isoCode':'CO','countryName':'Colombia','dialCode':'57'},   // Colombia
{'phone':'51912345678','isoCode':'PE','countryName':'Peru','dialCode':'51'},     // Peru
{'phone':'584121234567','isoCode':'VE','countryName':'Venezuela','dialCode':'58'},    // Venezuela
{'phone':'213512345678','isoCode':'DZ','countryName':'Algeria','dialCode':'213'},    // Algeria
{'phone':'244912345678','isoCode':'AO','countryName':'Angola','dialCode':'244'},    // Angola
{'phone':'355671234567','isoCode':'AL','countryName':'Albania','dialCode':'355'},    // Albania
{'phone':'22961234567','isoCode':'BJ','countryName':'Benin','dialCode':'229'},     // Benin
{'phone':'26771234567','isoCode':'BW','countryName':'Botswana','dialCode':'267'},     // Botswana
{'phone':'22661234567','isoCode':'BF','countryName':'Burkina Faso','dialCode':'226'},     // Burkina Faso
{'phone':'25761234567','isoCode':'BI','countryName':'Burundi','dialCode':'257'},    // Burundi
{'phone':'2389123456','isoCode':'CV','countryName':'Cape Verde','dialCode':'238'},    // Cape Verde
{'phone':'237612345678','isoCode':'CM','countryName':'Cameroon','dialCode':'237'},    // Cameroon
{'phone':'23670123456','isoCode':'CF','countryName':'Central African Republic','dialCode':'236'}, // Central African Republic
{'phone':'23560123456','isoCode':'TD','countryName':'Chad','dialCode':'235'},    // Chad
{'phone':'2693123456','isoCode':'KM','countryName':'Comoros','dialCode':'269'},   // Comoros
{'phone':'242051234567','isoCode':'CG','countryName':'Congo','dialCode':'242'},    // Congo - Brazzaville
{'phone':'243812345678','isoCode':'CD','countryName':'Congo - Kinshasa','dialCode':'243'},   // Congo - Kinshasa
{'phone':'25377123456','isoCode':'DJ','countryName':'Djibouti','dialCode':'253'},   // Djibouti
{'phone':'240222123456','isoCode':'GQ','countryName':'Equatorial Guinea','dialCode':'240'}, // Equatorial Guinea
{'phone':'2917123456','isoCode':'ER','countryName':'Eritrea','dialCode':'291'},   // Eritrea
{'phone':'251912345678','isoCode':'ET','countryName':'Ethiopia','dialCode':'251'},    // Ethiopia
{'phone':'24101234567','isoCode':'GA','countryName':'Gabon','dialCode':'241'},    // Gabon
{'phone':'2207123456','isoCode':'GM','countryName':'Gambia','dialCode':'220'},    // Gambia
{'phone':'233201234567','isoCode':'GH','countryName':'Ghana','dialCode':'233'},    // Ghana
{'phone':'224620123456','isoCode':'GN','countryName':'Guinea','dialCode':'224'},    // Guinea
{'phone':'245951234567','isoCode':'GW','countryName':'Guinea-Bissau','dialCode':'245'},   // Guinea-Bissau
{'phone':'254712345678','isoCode':'KE','countryName':'Kenya','dialCode':'254'},    // Kenya
{'phone':'26651234567','isoCode':'LS','countryName':'Lesotho','dialCode':'266'},    // Lesotho
{'phone':'231771234567','isoCode':'LR','countryName':'Liberia','dialCode':'231'},    // Liberia
{'phone':'218912345678','isoCode':'LY','countryName':'Libya','dialCode':'218'},    // Libya
{'phone':'261321234567','isoCode':'MG','countryName':'Madagascar','dialCode':'261'},   // Madagascar
{'phone':'265881234567','isoCode':'MW','countryName':'Malawi','dialCode':'265'},    // Malawi
{'phone':'22370123456','isoCode':'ML','countryName':'Mali','dialCode':'223'},    // Mali
{'phone':'22220123456','isoCode':'MR','countryName':'Mauritania','dialCode':'222'},   // Mauritania
{'phone':'23051234567','isoCode':'MU','countryName':'Mauritius','dialCode':'230'},   // Mauritius
{'phone':'212612345678','isoCode':'MA','countryName':'Morocco','dialCode':'212'},    // Morocco
{'phone':'258821234567','isoCode':'MZ','countryName':'Mozambique','dialCode':'258'}    // Mozambique
];

void main() {
  late List<Country> countries =[];

  setUpAll(()async{
     await CellPhoneValidator.init();
    countries = await CellPhoneValidator.countries;
  });
  test('init phonesValidator', () {
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    expect(phoneValidator.lang, 'en');
    expect(phoneValidator.phone, '');
    expect(phoneValidator.country, null);
    expect(phoneValidator.isValidPhoneNotifier.value, false);
  });
  test('country phonesValidator', ()async {
    expect(countries.length, 196);
  });
  for (final testNumber in testNumbers) {
    test('detect phone ${testNumber['countryName']}', ()async {
      final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
      Country? country = phoneValidator.getCountryByPhone(countries, testNumber['phone']);
      expect(country!.isoCode, testNumber['isoCode']);
      expect(country.countryName, testNumber['countryName']);
      expect(country.dialCode, testNumber['dialCode']);
    });
  }
}
