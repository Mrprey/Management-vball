import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Translations {
  final BuildContext? context;

  Translations([this.context]);

  static Translations of(BuildContext context) {
    return Translations(context);
  }

  static Map<String, String> _localizedStrings = {};

  static Future<bool> load(String locale) async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/translations_$locale.json');
      _localizedStrings = Map<String, String>.from(json.decode(jsonString));
      return true;
    } catch (e) {
      print('Error loading translations: $e');
      // Fallback to English if locale translations not found
      if (locale != 'en') {
        return load('en');
      }
      return false;
    }
  }

  static void setMockStrings(Map<String, String> mockStrings) {
    _localizedStrings = mockStrings;
  }

  String _getTranslation(String key) {
    return _localizedStrings[key] ?? key;
  }

  // Getters for all translation keys
  String get playerRegistration => _getTranslation('playerRegistration');
  String get name => _getTranslation('name');
  String get number => _getTranslation('number');
  String get role => _getTranslation('role');
  String get register => _getTranslation('register');
  String get playerRegistered => _getTranslation('playerRegistered');
}
