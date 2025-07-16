import 'package:flutter/services.dart';

/// A [TextInputFormatter] that applies a mask to the input text.
class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    required this.mask,
    this.separator = '#',
  });

  /// Formats the input text according to the mask.
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    var digits = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    int selectionIndex = 0;
    StringBuffer result = StringBuffer();

    int digitIndex = 0;
    for (int i = 0; i < mask.length && digitIndex < digits.length; i++) {
      if (mask[i] == separator) {
        result.write(digits[digitIndex]);
        digitIndex++;
        selectionIndex++;
      } else {
        result.write(mask[i]);
        selectionIndex++;
      }
    }

    return TextEditingValue(
      text: result.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }


}

class PasteFormattingFormatter extends TextInputFormatter {
  final String Function(String) onPasteFormat;

  PasteFormattingFormatter({required this.onPasteFormat});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Heuristic: if the user pasted text (big change), reformat
    if ((newValue.text.length - oldValue.text.length).abs() > 1) {
      final formatted = onPasteFormat(newValue.text);
      return TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }

    return newValue;
  }
}
