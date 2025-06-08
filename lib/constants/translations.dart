import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Translations {
  final BuildContext context;

  Translations(this.context);

  static Translations of(BuildContext context) => Translations(context);

  static Map<String, String> _localizedStrings = {};

  static Future<void> load(String locale) async {
    final String jsonString =
        await rootBundle.loadString('lib/constants/translations_$locale.json');
    _localizedStrings = Map<String, String>.from(json.decode(jsonString));
  }

  static String of(String key) {
    return _localizedStrings[key] ?? key;
  }

  String get playerRegistration => of('playerRegistration');
  String get name => of('name');
  String get number => of('number');
  String get role => of('role');
  String get register => of('register');
  String get playerRegistered => of('playerRegistered');
}
