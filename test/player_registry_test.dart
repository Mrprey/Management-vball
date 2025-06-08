import 'package:flutter_test/flutter_test.dart';
import 'package:volei_project/application/use_cases/player_registry.dart';

void main() {
  group('PlayerRegistry', () {
    late PlayerRegistry playerRegistry;

    setUp(() {
      playerRegistry = PlayerRegistry();
    });

    test('should add a player to the registry', () {
      final player = playerRegistry.addPlayer('John Doe', 10, 'Setter');

      expect(player.name, 'John Doe');
      expect(player.number, 10);
      expect(player.position, 'Setter');
      expect(playerRegistry.listPlayers(), contains(player));
    });

    test('should list all players in the registry', () {
      playerRegistry.addPlayer('John Doe', 10, 'Setter');
      playerRegistry.addPlayer('Jane Smith', 5, 'Libero');

      final players = playerRegistry.listPlayers();

      expect(players.length, 2);
      expect(players[0].name, 'John Doe');
      expect(players[1].name, 'Jane Smith');
    });
  });
}
