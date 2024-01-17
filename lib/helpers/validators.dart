class Validator {
  final String? Function(String? value) fn;
  const Validator(this.fn);
}

class NicknameValidator extends Validator {
  const NicknameValidator() : super(_validator);
  static String? _validator(String? value) {
    if (value == null || value.isEmpty) return "Please enter a nickname";
    if (value.length < 3) return "Please enter at least 3 characters";
    return null;
  }
}

class GameCodeValidator extends Validator {
  static final RegExp _gameCodeRegex = RegExp(r'P-[0-9a-zA-Z]{4}$');

  const GameCodeValidator() : super(_validator);
  static String? _validator(String? value) {
    final isEmpty = value == null || value.isEmpty;
    if (!isEmpty && !_gameCodeRegex.hasMatch(value)) {
      return "Invalid game code format, please use P-XXXX";
    }
    return null;
  }
}

const nicknameValidator = NicknameValidator();
const gameCodeValidator = GameCodeValidator();
