import 'package:flutter/material.dart';

abstract class PartyMatchMode {
  static const String shuffle = 'shuffle';
  static const String fastRematch = 'fast-rematch';
  static const String normal = 'normal';
}

abstract class PartyTeamColors {
  static const red = Colors.red;
  static const blue = Colors.blue;
  static const green = Colors.green;

  static MaterialColor of(int team) {
    switch (team) {
      case 0:
        return red;
      case 1:
        return blue;
      case 2:
        return green;
      default:
        throw Exception('Invalid team color');
    }
  }
}
