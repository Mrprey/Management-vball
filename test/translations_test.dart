import 'package:flutter_test/flutter_test.dart';
import 'package:volei_project/constants/translations_en.dart';
import 'package:volei_project/constants/translations_pt.dart';

void main() {
  group('Translations', () {
    test('English translations should have all keys', () {
      expect(translationsEn.keys, containsAll(translationsPt.keys));
    });

    test('Portuguese translations should have all keys', () {
      expect(translationsPt.keys, containsAll(translationsEn.keys));
    });

    test('No empty values in English translations', () {
      for (var value in translationsEn.values) {
        expect(value.isNotEmpty, true);
      }
    });

    test('No empty values in Portuguese translations', () {
      for (var value in translationsPt.values) {
        expect(value.isNotEmpty, true);
      }
    });
  });
}
