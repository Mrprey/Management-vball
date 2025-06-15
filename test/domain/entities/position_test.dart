import 'package:flutter_test/flutter_test.dart';
import 'package:management_vball/domain/entities/position.dart';

void main() {
  group('Position', () {
    test('two positions with same properties should be equal', () {
      const position1 = Position(number: 1, description: 'Setter');
      const position2 = Position(number: 1, description: 'Setter');

      expect(position1, position2);
      expect(position1 == position2, true);
    });

    test('two positions with different properties should not be equal', () {
      const position1 = Position(number: 1, description: 'Setter');
      const position2 = Position(number: 2, description: 'Libero');

      expect(position1, isNot(position2));
      expect(position1 == position2, false);
    });

    test('props should contain all properties', () {
      const position = Position(number: 1, description: 'Setter');

      expect(position.props, [1, 'Setter']);
    });
  });
}
