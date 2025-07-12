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

}
