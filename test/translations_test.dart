import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> enTranslations;
  late Map<String, dynamic> ptTranslations;

  setUpAll(() {
    final enFile = File('assets/translations_en.json');
    final ptFile = File('assets/translations_pt.json');

    enTranslations = json.decode(enFile.readAsStringSync());
    ptTranslations = json.decode(ptFile.readAsStringSync());
  });

  group('Translations', () {
    test('English translations should have all keys', () {
      expect(enTranslations.keys, containsAll(ptTranslations.keys));
    });

    test('Portuguese translations should have all keys', () {
      expect(ptTranslations.keys, containsAll(enTranslations.keys));
    });

    test('No empty values in English translations', () {
      for (var value in enTranslations.values) {
        expect(value.toString().isNotEmpty, true);
      }
    });

    test('No empty values in Portuguese translations', () {
      for (var value in ptTranslations.values) {
        expect(value.toString().isNotEmpty, true);
      }
    });
  });
}
