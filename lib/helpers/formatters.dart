import 'package:flutter/services.dart';

class GameCodeInputFormatter extends TextInputFormatter {
  const GameCodeInputFormatter();

  static const String prefix = 'P-';
  static const int maxLength = 6;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String newText = newValue.text.toUpperCase();

    // Ensure the prefix "P-" is always there when the user is typing.
    if (newValue.text.length > oldValue.text.length &&
        !newText.startsWith(prefix[0])) {
      newText = '$prefix$newText';
    }

    // Cap the length of the game code to 6 characters.
    if (newText.length > maxLength) {
      newText = newText.substring(0, 6);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
