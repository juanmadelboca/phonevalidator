import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../cellphone_validator.dart';
import '../../utils/masked_text_input_formatter.dart';
import '../../utils/textFieldUtils.dart';


/// [PhoneInputSelectorView] is a StatefulWidget that provides a UI for phone number validation.
///
/// It includes a dropdown for country selection and a text field for phone number input.
/// The widget utilizes [PhoneValidator] to handle the validation logic and
/// [CountryManager] to manage country-specific information.
@immutable
class PhoneInputSelectorView extends StatefulWidget {
  final PhoneValidator phoneValidator;
  PhoneInputSelectorView({super.key, required this.phoneValidator});

  @override
  State<PhoneInputSelectorView> createState() => _PhoneInputSelectorView();
}

/// [_PhoneValidatorWidget] is the state class for [PhoneValidatorWidget].
///
/// It manages the state of the widget, including loading status, country list, and input controllers.
class _PhoneInputSelectorView extends State<PhoneInputSelectorView> {
  bool _loading = true;
  TextEditingController _phoneEditingController = TextEditingController();
  List<Country> _countries = CellPhoneValidator.countries;

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
  Future<void> loadLanguage() async {
    _loading = false;
    chooseCountry(_countries.first);
  }

  /// Called when the widget configuration changes.
  ///
  /// If the language in [PhoneValidator] changes, it reloads the language data,
  /// clears the phone input field, and resets the phone validation status.
  /// - [oldWidget]: The old widget configuration.
  @override
  void didUpdateWidget(covariant PhoneInputSelectorView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.phoneValidator.lang != oldWidget.phoneValidator.lang) {
      _loading = true;
      _phoneEditingController.clear();
      widget.phoneValidator.checkPhone('');
      loadLanguage();
    }else{

    }
  }

  /// Builds the widget tree for the phone validator.
  ///
  /// It displays a loading indicator while data is being fetched, otherwise,
  /// it shows a dropdown for country selection and a text field for phone number input.
  /// - [context]: The build context.
  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: CircularProgressIndicator(),
          ));
    }
    return Padding(padding: EdgeInsets.all(10),
         child:
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(
                    height: 50,
                    child: getCountryDropdown()),
            Flexible(
                flex: 5,
                child:
            ValueListenableBuilder<bool>(
                valueListenable: widget.phoneValidator.isValidPhoneNotifier,
                builder: (context, isValid, _) {
                  return  Padding(
                          padding:
                             const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                          child: phoneTextField(isValid,widget.phoneValidator));
                }))
          ],
        ));
  }

  /// Handles the selection of a country from the dropdown.
  ///
  /// Updates the selected country in [PhoneValidator] and triggers a state update.
  /// - [selected]: The newly selected country.
  Future<void> chooseCountry(Country? selected) async {
    if (selected == null) return;
    setState(() {
      widget.phoneValidator.setCountry(selected);
      widget.phoneValidator.checkPhone(_phoneEditingController.text);
    });
  }

  /// Retrieves the input formatters for the phone number field.
  ///
  /// Returns a list of [TextInputFormatter] including [MaskedTextInputFormatter] if a country is selected.

  List<TextInputFormatter> getInputFormater() {
    return widget.phoneValidator.country != null
        ? [
            MaskedTextInputFormatter(mask: widget.phoneValidator.country!.mask),
          ]
        : [];
  }

  Widget _isValidNumber(bool isValid){
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: isValid
          ? const Icon(key:Key('0'),Icons.check_circle_outline, color: Colors.green,)
          : const Icon(key:Key('1'),Icons.cancel_outlined,color: Colors.red),
    );
  }

  void insertNumber(String text){
    widget.phoneValidator.checkPhone(text);
  }



  DropdownButton<Country> getCountryDropdown() {
   return DropdownButton<Country>(
      value: widget.phoneValidator.country,
      onChanged: (Country? newValue) async {
        chooseCountry(newValue!);
      },
      items: _countries.map((Country country) {
        return DropdownMenuItem<Country>(
          value: country,
          child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(country.getDefaultView())),
        );
      }).toList(),
    );
  }

  TextField phoneTextField(bool isValid,PhoneValidator phoneValidator){
   return TextField(
      decoration: InputDecoration(
        hintText: getPhovalidatorText(phoneValidator.country, 'mask',phoneValidator.lang),
        labelText: getPhovalidatorText(phoneValidator.country, 'countryName', phoneValidator.lang),
        prefix: Text(getPhovalidatorText(phoneValidator.country, 'visualText',phoneValidator.lang)),
        suffix: _isValidNumber(isValid),
      ),
      keyboardType: TextInputType.phone,
      controller: _phoneEditingController,
      inputFormatters: getInputFormater(),
      onChanged: insertNumber,);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneEditingController.dispose();
    super.dispose();
  }


}
