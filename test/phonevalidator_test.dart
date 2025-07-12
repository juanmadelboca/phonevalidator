import 'package:flutter_test/flutter_test.dart';

import 'package:cellphone_validator/cellphone_validator.dart';

final List<String> testNumbers = [
  '541123456789',    // Argentina
  '12025550191',     // USA
  '14165550123',     // Canada
  '442079460958',    // UK
  '4930123456',      // Germany
  '33612345678',     // France
  '34612345678',     // Spain
  '5511912345678',   // Brazil
  '525512345678',    // Mexico
  '919123456789',    // India
  '61412345678',     // Australia
  '817012345678',    // Japan
  '79123456789',     // Russia
  '27821234567',     // South Africa
  '393123456789',    // Italy
  '8613812345678',   // China
  '923001234567',    // Pakistan
  '2348031234567',   // Nigeria
  '8801712345678',   // Bangladesh
  '201001234567',    // Egypt
  '84912345678',     // Vietnam
  '905123456789',    // Turkey
  '6281234567890',   // Indonesia
  '639171234567',    // Philippines
  '66812345678',     // Thailand
  '966501234567',    // Saudi Arabia
  '989123456789',    // Iran
  '60123456789',     // Malaysia
  '31612345678',     // Netherlands
  '48500123456',     // Poland
  '40712345678',     // Romania
  '380501234567',    // Ukraine
  '56912345678',     // Chile
  '5730012345678',   // Colombia
  '51912345678',     // Peru
  '584121234567',    // Venezuela
  '213512345678',    // Algeria
  '244912345678',    // Angola
  '22961234567',     // Benin
  '26771234567',     // Botswana
  '22661234567',     // Burkina Faso

];

void main() {
  test('init phonesValidator', () {
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    expect(phoneValidator.lang, 'en');
    expect(phoneValidator.phone, '');
    expect(phoneValidator.country, null);
    expect(phoneValidator.isValidPhoneNotifier.value, false);
  });
  test('country phonesValidator', ()async {
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    expect(countryManager.getCountries().length, 196);
  });
  test('detect argentina phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[0]);
    expect(country!.isoCode, 'AR');
    expect(country.countryName, 'Argentina');
    expect(country.dialCode, '54');
  });
  test('detect USA phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[1]);
    expect(country!.isoCode, 'US');
    expect(country.countryName, 'United States');
    expect(country.dialCode, '1');
  });

  test('detect Canada phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[2]);
    expect(country!.isoCode, 'CA');
    expect(country.countryName, 'Canada');
    expect(country.dialCode, '1');
  });
  test('detect UK phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[3]);
    expect(country!.isoCode, 'GB');
    expect(country.countryName, 'United Kingdom');
    expect(country.dialCode, '44');
  });
  test('detect Germany phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[4]);
    expect(country!.isoCode, 'DE');
    expect(country.countryName, 'Germany');
    expect(country.dialCode, '49');
  });

  test('detect France phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[5]);
    expect(country!.isoCode, 'FR');
    expect(country.countryName, 'France');
    expect(country.dialCode, '33');
  });

  test('detect Spain phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[6]);
    expect(country!.isoCode, 'ES');
    expect(country.countryName, 'Spain');
    expect(country.dialCode, '34');
  });

  test('detect Brazil phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[7]);
    expect(country!.isoCode, 'BR');
    expect(country.countryName, 'Brazil');
    expect(country.dialCode, '55');
  });

  test('detect Mexico phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[8]);
    expect(country!.isoCode, 'MX');
    expect(country.countryName, 'Mexico');
    expect(country.dialCode, '52');
  });

  test('detect India phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[9]);
    expect(country!.isoCode, 'IN');
    expect(country.countryName, 'India');
    expect(country.dialCode, '91');
  });

  test('detect Australia phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[10]);
    expect(country!.isoCode, 'AU');
    expect(country.countryName, 'Australia');
    expect(country.dialCode, '61');
  });

  test('detect Japan phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[11]);
    expect(country!.isoCode, 'JP');
    expect(country.countryName, 'Japan');
    expect(country.dialCode, '81');
  });

  test('detect Russia phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[12]);
    expect(country!.isoCode, 'RU');
    expect(country.countryName, 'Russia');
    expect(country.dialCode, '7');
  });

  test('detect South Africa phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[13]);
    expect(country!.isoCode, 'ZA');
    expect(country.countryName, 'South Africa');
    expect(country.dialCode, '27');
  });

  test('detect Italy phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[14]);
    expect(country!.isoCode, 'IT');
    expect(country.countryName, 'Italy');
    expect(country.dialCode, '39');
  });

  test('detect China phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[15]);
    expect(country!.isoCode, 'CN');
    expect(country.countryName, 'China');
    expect(country.dialCode, '86');
  });

  test('detect Pakistan phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[16]);
    expect(country!.isoCode, 'PK');
    expect(country.countryName, 'Pakistan');
    expect(country.dialCode, '92');
  });

  test('detect Nigeria phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[17]);
    expect(country!.isoCode, 'NG');
    expect(country.countryName, 'Nigeria');
    expect(country.dialCode, '234');
  });

  test('detect Bangladesh phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[18]);
    expect(country!.isoCode, 'BD');
    expect(country.countryName, 'Bangladesh');
    expect(country.dialCode, '880');
  });

  test('detect Egypt phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[19]);
    expect(country!.isoCode, 'EG');
    expect(country.countryName, 'Egypt');
    expect(country.dialCode, '20');
  });

  test('detect Vietnam phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[20]);
    expect(country!.isoCode, 'VN');
    expect(country.countryName, 'Vietnam');
    expect(country.dialCode, '84');
  });

  test('detect Turkey phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[21]);
    expect(country!.isoCode, 'TR');
    expect(country.countryName, 'Turkey');
    expect(country.dialCode, '90');
  });

  test('detect Indonesia phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[22]);
    expect(country!.isoCode, 'ID');
    expect(country.countryName, 'Indonesia');
    expect(country.dialCode, '62');
  });

  test('detect Philippines phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[23]);
    expect(country!.isoCode, 'PH');
    expect(country.countryName, 'Philippines');
    expect(country.dialCode, '63');
  });

  test('detect Thailand phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[24]);
    expect(country!.isoCode, 'TH');
    expect(country.countryName, 'Thailand');
    expect(country.dialCode, '66');
  });

  test('detect Saudi Arabia phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[25]);
    expect(country!.isoCode, 'SA');
    expect(country.countryName, 'Saudi Arabia');
    expect(country.dialCode, '966');
  });

  test('detect Iran phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[26]);
    expect(country!.isoCode, 'IR');
    expect(country.countryName, 'Iran');
    expect(country.dialCode, '98');
  });

  test('detect Malaysia phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[27]);
    expect(country!.isoCode, 'MY');
    expect(country.countryName, 'Malaysia');
    expect(country.dialCode, '60');
  });

  test('detect Netherlands phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[28]);
    expect(country!.isoCode, 'NL');
    expect(country.countryName, 'Netherlands');
    expect(country.dialCode, '31');
  });

  test('detect Poland phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[29]);
    expect(country!.isoCode, 'PL');
    expect(country.countryName, 'Poland');
    expect(country.dialCode, '48');
  });

  test('detect Romania phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[30]);
    expect(country!.isoCode, 'RO');
    expect(country.countryName, 'Romania');
    expect(country.dialCode, '40');
  });

  test('detect Ukraine phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[31]);
    expect(country!.isoCode, 'UA');
    expect(country.countryName, 'Ukraine');
    expect(country.dialCode, '380');
  });

  test('detect Chile phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[32]);
    expect(country!.isoCode, 'CL');
    expect(country.countryName, 'Chile');
    expect(country.dialCode, '56');
  });

  test('detect Colombia phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[33]);
    expect(country!.isoCode, 'CO');
    expect(country.countryName, 'Colombia');
    expect(country.dialCode, '57');
  });

  test('detect Peru phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[34]);
    expect(country!.isoCode, 'PE');
    expect(country.countryName, 'Peru');
    expect(country.dialCode, '51');
  });

  test('detect Venezuela phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[35]);
    expect(country!.isoCode, 'VE');
    expect(country.countryName, 'Venezuela');
    expect(country.dialCode, '58');
  });

  test('detect Algeria phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[36]);
    expect(country!.isoCode, 'DZ');
    expect(country.countryName, 'Algeria');
    expect(country.dialCode, '213');
  });

  test('detect Angola phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[37]);
    expect(country!.isoCode, 'AO');
    expect(country.countryName, 'Angola');
    expect(country.dialCode, '244');
  });

  test('detect Benin phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[38]);
    expect(country!.isoCode, 'BJ');
    expect(country.countryName, 'Benin');
    expect(country.dialCode, '229');
  });

  test('detect Botswana phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[39]);
    expect(country!.isoCode, 'BW');
    expect(country.countryName, 'Botswana');
    expect(country.dialCode, '267');
  });

  test('detect Burkina Faso phone',()async{
    final PhoneValidator phoneValidator = PhoneValidator(lang: 'en');
    CountryManager countryManager = CountryManager();
    await countryManager.initializeCountries();
    List<Country> countries = countryManager.getCountries();
    Country? country = phoneValidator.getCountryByPhone(countries, testNumbers[40]);
    expect(country!.isoCode, 'BF');
    expect(country.countryName, 'Burkina Faso');
    expect(country.dialCode, '226');
  });
}
