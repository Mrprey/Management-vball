import 'package:flutter/material.dart';

class Translations {
  final BuildContext context;

  Translations(this.context);

  static Translations of(BuildContext context) => Translations(context);

  String get playerRegistration => _localized('Player Registration');
  String get name => _localized('Name');
  String get number => _localized('Number');
  String get role => _localized('Role');
  String get register => _localized('Register');
  String get playerRegistered => _localized('Player successfully registered!');

  String _localized(String text) {
    // Placeholder for localization logic
    return text;
  }
}
