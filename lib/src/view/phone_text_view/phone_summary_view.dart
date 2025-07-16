import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../cellphone_validator.dart';
import '../../utils/masked_text_input_formatter.dart';
import '../../utils/textFieldUtils.dart';

/// [PhoneValidatorWidget] is a StatefulWidget that provides a UI for phone number validation.
///
/// It includes a dropdown for country selection and a text field for phone number input.
/// The widget utilizes [PhoneValidator] to handle the validation logic and
/// [CountryManager] to manage country-specific information.


/// [_PhoneValidatorWidget] is the state class for [PhoneValidatorWidget].
///
/// It manages the state of the widget, including loading status, country list, and input controllers.
///
class PhoneSummaryView extends StatefulWidget{
  PhoneValidator phoneValidator;
  String fullPhoneNumber;

  PhoneSummaryView({super.key, required this.phoneValidator, required this.fullPhoneNumber});

  @override
  State<PhoneSummaryView> createState() => _PhoneSummaryView();
}
class _PhoneSummaryView extends State<PhoneSummaryView> {
  bool _loading = false;
  TextEditingController _phoneEditingController = TextEditingController();
  List<Country> countries = CellPhoneValidator.countries;



  @override
  void initState() {
    final country = widget.phoneValidator.country ??
        widget.phoneValidator.getCountryByPhone(countries, widget.fullPhoneNumber.replaceAll('+', ''));

    if (country != null) {
      final stripped = widget.fullPhoneNumber.replaceFirst(country.dialCode, '');
      _phoneEditingController.text = stripped;
      widget.phoneValidator.setCountry(country);
    }
    super.initState();

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
                 return  Padding(
                          padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                          child: phoneTextField(isValid));
                })
        );
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

  TextField phoneTextField(bool isValid) {
    return TextField(
      enabled: true,
      readOnly: true,
      decoration: InputDecoration(
        labelText: getPhovalidatorText(widget.phoneValidator.country, 'label', widget.phoneValidator.lang),
        prefixText: getPhovalidatorText(widget.phoneValidator.country, 'visualText', widget.phoneValidator.lang),
        suffixIcon: IconButton(onPressed: (){
          String _phone = widget.fullPhoneNumber;
          Clipboard.setData(ClipboardData(text: _phone));
        }, icon: Icon(Icons.copy))
      ),
      keyboardType: TextInputType.phone,
      controller: _phoneEditingController,
      inputFormatters: getInputFormater(widget.phoneValidator.country),

      );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneEditingController.dispose();
    super.dispose();
  }



}
