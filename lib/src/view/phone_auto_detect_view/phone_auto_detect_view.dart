import 'package:cellphone_validator/src/utils/widgets/MaskTextController/mask_text_editing_controller.dart';
import 'package:cellphone_validator/src/utils/widgets/check_animation/check_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../cellphone_validator.dart';
import '../../utils/masked_text_input_formatter.dart';
import '../../utils/textFieldUtils.dart';

/// A StatefulWidget that provides a UI for phone number input and validation.
///
/// It includes a dropdown for country selection and a text field for phone number input.
/// The widget utilizes [PhoneValidator] to handle the validation logic and
/// [CountryManager] to manage country-specific information.
@immutable
class PhoneAutoDetectView extends StatefulWidget {
  /// The [PhoneValidator] instance used for validating phone numbers.
  final PhoneValidator phoneValidator;

  /// The initial full phone number to be displayed and validated.
  /// This can include the country code.
  final String fullPhoneNumber;

  /// Creates a [PhoneTextField] widget.
  ///
  /// Requires a [phoneValidator] for validation logic and a [fullPhoneNumber] as the initial value.
  PhoneAutoDetectView({super.key, required this.phoneValidator, required this.fullPhoneNumber});

  @override
  State<PhoneAutoDetectView> createState() => _PhoneAutoDetectView();
}

/// [_PhoneValidatorWidget] is the state class for [PhoneValidatorWidget].
///
/// It manages the state of the widget, including loading status, country list, and input controllers.
class _PhoneAutoDetectView extends State<PhoneAutoDetectView> {
  MaskTextEditingController _phoneEditingController = MaskTextEditingController();
  List<Country> countries = CellPhoneValidator.countries;

  ValueNotifier<Country?> _country = ValueNotifier<Country?>(null);

  CheckAnimation? checkAnimation;

  String _clipboardText = '';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneEditingController.addListener(() {
      final raw = _phoneEditingController.text;
      final maskedText = _phoneEditingController.setMask(raw);
      if (_phoneEditingController.text != maskedText) {
        _phoneEditingController.text = maskedText;
      }
    });
  }

  
  /// Builds the widget tree for the phone validator.
  ///
  /// It displays a loading indicator while data is being fetched, otherwise,
  /// it shows a dropdown for country selection and a text field for phone number input.
  /// - [context]: The build context.
  @override
  Widget build(BuildContext context) {
    checkAnimation ??= CheckAnimation(isValidPhoneNotifier: widget.phoneValidator.isValidPhoneNotifier);
    return Padding(
        padding: const EdgeInsets.all(10),
        child:
        ValueListenableBuilder<bool>(
            valueListenable: widget.phoneValidator.isValidPhoneNotifier,
            builder: (context, isValid, _) {
              Country? country = widget.phoneValidator.getCountryByPhone(countries,_phoneEditingController.value.text);
              return  Padding(
                  padding:
                  const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: phoneTextField(isValid,country));
            })
    );
  }


  /// Retrieves the input formatters for the phone number field.
  ///
  /// Returns a list of [TextInputFormatter] including [MaskedTextInputFormatter] if a country is selected.

 

  void insertNumber(String text)async{
    final clipboardData = await Clipboard.getData('text/plain');
    final clipboardText = clipboardData?.text ?? '';
    bool isPaste = clipboardText.isNotEmpty && clipboardText != _clipboardText;
    try{
      if(_country.value == null ||text.isEmpty|| isPaste){
        if(isPaste){
          _findCountry(clipboardText,true);
        }else{
          _findCountry(text,false);
        }
      }
    }catch(e){

    }finally{
      if(_country.value!=null){
        _phoneEditingController.setMask(_country.value!.mask);
        widget.phoneValidator.checkPhoneByCountry(
            _phoneEditingController.text, _country.value);
      }
    }

  }


  
  Widget phoneTextField(bool isValid,Country? country) {
    return ValueListenableBuilder(valueListenable: _country, builder:(context,country,_){
      return TextField(
        enabled: true,
        selectionControls: null,
        decoration:country!=null?InputDecoration(
          suffix: checkAnimation,
          labelText: getPhovalidatorText(country, 'label', widget.phoneValidator.lang),
          prefixText: getPhovalidatorText(country, 'visualText', widget.phoneValidator.lang),
        ):InputDecoration(
            hintText: '## ### ###-####',
          suffix:   checkAnimation
        ),
        keyboardType: TextInputType.phone,
        controller: _phoneEditingController,
        onChanged: insertNumber,
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneEditingController.dispose();
    _country.dispose();
    super.dispose();
  }

  _setAuxText(String number,Country country,bool isPaste){
    String aux = number;
    if(aux.contains(country.dialCode)){
      aux = aux.replaceFirst(country.dialCode,'');
    }
    _phoneEditingController.text = aux;
  }

  _findCountry(String text,bool isPaste){
    _country.value = widget.phoneValidator.getCountryByPhone(countries, text);
    if(isPaste){
      _clipboardText = text;
      _phoneEditingController.text='';
    }
    if (_country.value != null) {
      _phoneEditingController.setMask(_country.value!.mask);
    }
    _setAuxText(text,_country.value!,isPaste);
  }
  
}
