import 'package:cellphone_validator/cellphone_validator.dart';
import 'package:cellphone_validator/src/assets/supported_countries.dart';

abstract class CellphoneValidatorCore{
  List<Country> _countries=[];

  List<Country> get countries => _countries;
}

class CellphoneValidatorImpl implements CellphoneValidatorCore{
  @override
  List<Country> _countries = supportedCountries;

  @override
  // TODO: implement countries
  List<Country> get countries => _countries;

}