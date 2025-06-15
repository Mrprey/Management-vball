import 'package:flutter_test/flutter_test.dart';
import 'package:volei_project/domain/entities/player.dart';

void main() {
  group('Player', () {
    test('two players with same properties should be equal', () {
      final player1 = Player(id: 'test-id', name: 'John Doe', number: 10, position: 'Setter');
      final player2 = Player(id: 'test-id', name: 'John Doe', number: 10, position: 'Setter');
      
      expect(player1 == player2, true);
    });
    
    test('two players with different ids should not be equal', () {
      final player1 = Player(id: 'id-1', name: 'John Doe', number: 10, position: 'Setter');
      final player2 = Player(id: 'id-2', name: 'John Doe', number: 10, position: 'Setter');
      
      expect(player1 == player2, false);
    });
    
    test('player should auto-generate id when not provided', () {
      final player = Player(name: 'John Doe', number: 10, position: 'Setter');
      
      expect(player.id, isNotNull);
      expect(player.id, isNotEmpty);
    });
    
    test('player toString should include all properties', () {
      final player = Player(id: 'test-id', name: 'John Doe', number: 10, position: 'Setter');
      
      expect(player.toString(), contains('Player'));
      expect(player.toString(), contains('test-id'));
      expect(player.toString(), contains('John Doe'));
      expect(player.toString(), contains('10'));
      expect(player.toString(), contains('Setter'));
    });
  });
}
