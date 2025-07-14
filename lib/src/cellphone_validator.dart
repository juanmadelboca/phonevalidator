import 'package:cellphone_validator/cellphone_validator.dart';

abstract class CellphoneValidator{
  List<Country> _countries=[];
  Future<void> init()async{
  }

  void _loadCountries()  async {
  }
  List<Country> get countries => _countries;
}

class CellphoneValidatorImpl implements CellphoneValidator{
  @override
  List<Country> _countries=[];

  @override
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