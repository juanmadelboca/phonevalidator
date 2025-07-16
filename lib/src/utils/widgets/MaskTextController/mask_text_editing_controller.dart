import 'package:flutter/cupertino.dart';

class MaskTextEditingController extends TextEditingController{

 String _mask ='';
 String _separator='#';
 setMask(String mask){
   this._mask = mask;
 }

 void applyMaskToCurrentText() {
   final formatted = formatWithMask(text);
   super.text = formatted;
   selection = TextSelection.collapsed(offset: formatted.length);
 }

 /// Aplica la máscara al texto dado.
 String formatWithMask(String input) {
   if (_mask.isEmpty) return input;

   final digits = input.replaceAll(RegExp(r'[^\d]'), '');
   final buffer = StringBuffer();
   int digitIndex = 0;

   for (int i = 0; i < _mask.length; i++) {
     final maskChar = _mask[i];
     if (maskChar == _separator) {
       if (digitIndex >= digits.length) break;
       buffer.write(digits[digitIndex++]);
     } else {
       buffer.write(maskChar);
     }
   }

   return buffer.toString();
 }

 @override
 set text(String newText) {
   if (_mask.isEmpty) {
     super.text = newText; // Asigna el nuevo texto directamente
     selection = TextSelection.collapsed(offset: super.text.length); // Coloca el cursor al final
     return;
   }

   final formatted = formatWithMask(newText);
   super.text = formatted; // Asigna el texto formateado
   selection = TextSelection.collapsed(offset: text.length); // Coloca el cursor al final del texto formateado
 }
}