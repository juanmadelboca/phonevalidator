import 'package:flutter/cupertino.dart';

class MaskedTextEditingController extends TextEditingController{
  String _separator ="#";

  String _mask ='';
  void setMask(String mask){
    this._mask =mask;
  }

  @override
  set text(String newText) {
    if(_mask.isEmpty){
      super.text = newText;
      selection = TextSelection.collapsed(offset: super.text.length);
      return;
    }
      String aux = newText;
       aux = newText;
       final formated = formatWithMask(aux);
       super.text = formated;
    selection = TextSelection.collapsed(offset: super.text.length);
  }



  String formatWithMask(String input) {
    if (_mask.isEmpty) return input;

    final digits = input.replaceAll(RegExp(r'[^\d]'), '');
    final buffer = StringBuffer();
    String aux =_mask;
    for(int i= 0; i< digits.length;i++){
      aux = aux.replaceFirst(_separator,digits[i]);
    }
    List<String> items = aux.split(_separator);
    buffer.write(items[0]);
    return buffer.toString();
  }

  @override
  // TODO: implement value
  TextEditingValue get value => super.value;
  @override
  set value(TextEditingValue newValue) {
    // TODO: implement value
    super.value = newValue;
  }
}