
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cellphone_validator/src/Controllers/CountryManager.dart';
import 'package:cellphone_validator/src/Utils/MaskedTextInputFormatter.dart';
import 'package:cellphone_validator/src/models/Country.dart';

import '../../Controllers/PhoneValidator.dart';
import '../../assets/CountriesNames/countries_names.dart';
/// [PhoneValidatorWidget] is a StatefulWidget that provides a UI for phone number validation.
///
/// It includes a dropdown for country selection and a text field for phone number input.
/// The widget utilizes [PhoneValidator] to handle the validation logic and
/// [CountryManager] to manage country-specific information.
class PhoneValidatorWidget extends StatefulWidget{
  PhoneValidator phoneValidator;
  PhoneValidatorWidget({super.key, required this.phoneValidator});

  @override
  State<PhoneValidatorWidget> createState ()=> _PhoneValidatorWidget();
}

/// [_PhoneValidatorWidget] is the state class for [PhoneValidatorWidget].
///
/// It manages the state of the widget, including loading status, country list, and input controllers.
class _PhoneValidatorWidget extends State<PhoneValidatorWidget>{
  final CountryManager countryManager= CountryManager();
  bool _loading = true;
  TextEditingController _phoneEditingController = TextEditingController();
  List<Country> countries = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadLanguage();
  }

 /// Loads language-specific country data.
  ///
  /// This method sets the language in [CountryManager], retrieves the list of countries,
  /// and updates the loading state. It also selects the first country by default if available.
 Future<void> loadLanguage() async{

    await countryManager.setLanguage(widget.phoneValidator.lang);
    countries = countryManager.getCountries();
    _loading = false;
    if(countries.isNotEmpty){
      await chooseCountry(countries.isNotEmpty?countries.first:null);
    }
 }

  /// Called when the widget configuration changes.
  ///
  /// If the language in [PhoneValidator] changes, it reloads the language data,
  /// clears the phone input field, and resets the phone validation status.
  /// - [oldWidget]: The old widget configuration.
  @override
  void didUpdateWidget(covariant PhoneValidatorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.phoneValidator.lang != oldWidget.phoneValidator.lang) {
      _loading = true;
      _phoneEditingController.clear();
      widget.phoneValidator.checkPhone('');
      loadLanguage();
    }
  }

  /// Builds the widget tree for the phone validator.
  ///
  /// It displays a loading indicator while data is being fetched, otherwise,
  /// it shows a dropdown for country selection and a text field for phone number input.
  /// - [context]: The build context.
  @override
  Widget build(BuildContext context) {

    if(_loading){
      return Padding(padding: EdgeInsets.all(10),child: Center(child: CircularProgressIndicator(),));
    }
    return
         Padding(padding: EdgeInsets.all(10),
            child:Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            flex: 2,
            child:
        SizedBox(
          height: 50,
          child: DropdownButton<Country>(
            value: widget.phoneValidator.country,
            onChanged: (Country? newValue)async {
              chooseCountry(newValue!);
            },
            items: countries.map((Country country) {
              return DropdownMenuItem<Country>(
                value: country,
                child: Padding(padding: EdgeInsets.only(left: 15,right: 15), child:Text('${country.getDefaultView()}')),
              );
            }).toList(),
          )
        )),
        ValueListenableBuilder<bool>(valueListenable: widget.phoneValidator.isValidPhoneNotifier,
            builder: (context, isValid, _){
             return Flexible(
                  flex: 4,
                  child: Padding(padding: EdgeInsets.only(left: 15,right: 15,bottom: 15) ,child: TextField(
                      decoration: InputDecoration(
                        hintText: widget.phoneValidator.country!=null?widget.phoneValidator.country!.mask:'',
                        labelText: widget.phoneValidator.country!=null?CountryNames(widget.phoneValidator.lang, widget.phoneValidator.country!.isoCode):'',
                        prefix: widget.phoneValidator.country!=null?Text('${widget.phoneValidator.country!.visualText} '):null,
                        suffix: isValid?Icon(Icons.check_circle_outline,color: Colors.green,):Icon(Icons.cancel_outlined,color: Colors.red,),
                      ),
                      keyboardType: TextInputType.phone,
                      controller: _phoneEditingController,
                      inputFormatters:getInputFormater(),
                      onChanged: (text){
                        widget.phoneValidator.checkPhone(text);
                      }
                  )));
            })

      ],
    ));
    
  }

  /// Handles the selection of a country from the dropdown.
  ///
  /// Updates the selected country in [PhoneValidator] and triggers a state update.
  /// - [selected]: The newly selected country.
  Future<void> chooseCountry(Country? selected) async{
     if(selected==null) return;
     setState(() {
       widget.phoneValidator.setCountry(selected);
     });
  }
  /// Retrieves the input formatters for the phone number field.
  ///
  /// Returns a list of [TextInputFormatter] including [MaskedTextInputFormatter] if a country is selected.


  List<TextInputFormatter> getInputFormater(){
    return widget.phoneValidator.country!=null?[
    MaskedTextInputFormatter(mask: widget.phoneValidator.country!.mask),
    ]:[];
  }


  
}