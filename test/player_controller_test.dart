import 'package:flutter_test/flutter_test.dart';
import 'package:volei_project/adapters/controllers/player_controller.dart';
import 'package:volei_project/application/use_cases/player_registry.dart';

void main() {
  group('PlayerController', () {
    late PlayerController playerController;
    late PlayerRegistry playerRegistry;

    setUp(() {
      playerRegistry = PlayerRegistry();
      playerController = PlayerController(playerRegistry);
    });

    test('should add a player using the controller', () {
      final player = playerController.addPlayer('John Doe', 10, 'Setter');

      expect(player.name, 'John Doe');
      expect(player.number, 10);
      expect(player.position, 'Setter');
      expect(playerRegistry.listPlayers(), contains(player));
    });

    test('should list all players using the controller', () {
      playerController.addPlayer('John Doe', 10, 'Setter');
      playerController.addPlayer('Jane Smith', 5, 'Libero');

      final players = playerController.listPlayers();

      expect(players.length, 2);
      expect(players[0].name, 'John Doe');
      expect(players[1].name, 'Jane Smith');
    });
  });
}
