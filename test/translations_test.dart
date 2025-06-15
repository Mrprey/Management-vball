import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> translationsEn;
  late Map<String, dynamic> translationsPt;

  setUpAll(() {
    final enFile = File('lib/constants/translations_en.json');
    final ptFile = File('lib/constants/translations_pt.json');

    translationsEn = json.decode(enFile.readAsStringSync());
    translationsPt = json.decode(ptFile.readAsStringSync());
  });

  group('Translations', () {
    test('English translations should have all keys', () {
      expect(translationsEn.keys, containsAll(translationsPt.keys));
    });

    test('Portuguese translations should have all keys', () {
      expect(translationsPt.keys, containsAll(translationsEn.keys));
    });

    test('No empty values in English translations', () {
      for (var value in translationsEn.values) {
        expect(value.toString().isNotEmpty, true);
      }
    });

    test('No empty values in Portuguese translations', () {
      for (var value in translationsPt.values) {
        expect(value.toString().isNotEmpty, true);
      }
    });
  });
}
