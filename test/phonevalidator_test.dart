import 'package:flutter_test/flutter_test.dart';

import 'package:cellphone_validator/phonevalidator.dart';

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
    await countryManager.setLanguage(phoneValidator.lang);
    expect(countryManager.lang, 'en');
    expect(countryManager.getCountries().length, 195);
  });
}
