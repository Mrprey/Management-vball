import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Translations {
  final BuildContext context;

  Translations(this.context);

  static Translations ofContext(BuildContext context) => Translations(context);
  static Translations of(BuildContext context) {
    return Translations(context);
  }

  static Map<String, String> _localizedStrings = {};

  static Future<void> load(String locale) async {
    final String jsonString =
        await rootBundle.loadString('lib/constants/translations_$locale.json');
    _localizedStrings = Map<String, String>.from(json.decode(jsonString));
  }

  String _getTranslation(String key) {
    return _localizedStrings[key] ?? key;
  }

  String get playerRegistration => _getTranslation('playerRegistration');
  String get name => _getTranslation('name');
  String get number => _getTranslation('number');
  String get role => _getTranslation('role');
  String get register => _getTranslation('register');
  String get playerRegistered => _getTranslation('playerRegistered');
}
