import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../cellphone_validator.dart';
import '../../assets/countriesNames/countries_names.dart';
import '../../controllers/phone_validator.dart';
import '../../utils/masked_text_input_formatter.dart';
import '../../utils/textFieldUtils.dart';

/// [PhoneValidatorWidget] is a StatefulWidget that provides a UI for phone number validation.
///
/// It includes a dropdown for country selection and a text field for phone number input.
/// The widget utilizes [PhoneValidator] to handle the validation logic and
/// [CountryManager] to manage country-specific information.
@immutable
class PhoneView extends StatefulWidget {
  final PhoneValidator phoneValidator;
  final String fullPhoneNumber;
  PhoneView({super.key, required this.phoneValidator, required this.fullPhoneNumber});
  ValueNotifier<Country?> _country = ValueNotifier<Country?>(null);

  @override
  State<PhoneView> createState() => _PhoneTextView();
}

/// [_PhoneValidatorWidget] is the state class for [PhoneValidatorWidget].
///
/// It manages the state of the widget, including loading status, country list, and input controllers.
class _PhoneTextView extends State<PhoneView> {
  bool _loading = false;
  TextEditingController _phoneEditingController = TextEditingController();
  List<Country> countries = CellPhoneValidator.countries;

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

  }

  /// Called when the widget configuration changes.
  ///
  /// If the language in [PhoneValidator] changes, it reloads the language data,
  /// clears the phone input field, and resets the phone validation status.
  /// - [oldWidget]: The old widget configuration.
  @override
  void didUpdateWidget(covariant PhoneView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.phoneValidator.lang != oldWidget.phoneValidator.lang) {
      _loading = false;
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
    return Padding(
        padding: const EdgeInsets.all(10),
        child:
            ValueListenableBuilder<bool>(
                valueListenable: widget.phoneValidator.isValidPhoneNotifier,
                builder: (context, isValid, _) {
                  Country? country = widget.phoneValidator.country ?? widget.phoneValidator.getCountryByPhone(countries,widget.fullPhoneNumber.replaceAll('+',''));
                  _phoneEditingController.text = widget.fullPhoneNumber.replaceFirst(country!.dialCode, '');
                  return  Padding(
                          padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                          child: phoneTextField(isValid,country));
                })
        );
  }

  /// Handles the selection of a country from the dropdown.
  ///
  /// Updates the selected country in [PhoneValidator] and triggers a state update.
  /// - [selected]: The newly selected country.
  Future<void> chooseCountry(Country? selected) async {
    if (selected == null) return;
    setState(() {
      widget.phoneValidator.setCountry(selected);
    });
  }

  /// Retrieves the input formatters for the phone number field.
  ///
  /// Returns a list of [TextInputFormatter] including [MaskedTextInputFormatter] if a country is selected.

  List<TextInputFormatter> getInputFormater(Country? country) {
    return country != null
        ? [
      MaskedTextInputFormatter(mask:country.mask),
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





  TextField phoneTextField(bool isValid,Country? country) {
    return TextField(
      enabled: true,
      readOnly: true,
      decoration: InputDecoration(
        labelText: getPhovalidatorText(country, 'label', widget.phoneValidator.lang),
        prefixText: getPhovalidatorText(country, 'visualText', widget.phoneValidator.lang),
      ),
      keyboardType: TextInputType.phone,
      controller: _phoneEditingController,
      inputFormatters: getInputFormater(country),

      );
  }



}
