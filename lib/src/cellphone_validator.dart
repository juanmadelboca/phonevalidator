import 'package:cellphone_validator/cellphone_validator.dart';

abstract class CellphoneValidatorCore{
  List<Country> _countries=[];
  Future<void> init()async{
  }

  List<Country> get countries => _countries;
}

class CellphoneValidatorImpl implements CellphoneValidatorCore{
  @override
  List<Country> _countries=[];

  void _loadCountries() async{
    _countries = await CountryManager().getCountries();
  }

  @override
  // TODO: implement countries
  List<Country> get countries => _countries;

  @override
  Future<void> init() async{
    // TODO: implement init
    _loadCountries();
  }

}