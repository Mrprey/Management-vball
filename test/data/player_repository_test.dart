import 'package:flutter_test/flutter_test.dart';
import 'package:management_vball/domain/entities/player.dart';

import 'repositories/fake_player_repository.dart';

void main() {
  group('PlayerRepository', () {
    late FakePlayerRepository repository;

    setUp(() {
      repository = FakePlayerRepository();
      repository.clear();
    });

    test('savePlayer - should add a player to the repository', () async {
      final player = Player(name: 'John Doe', number: 10, position: 'Setter');

      await repository.savePlayer(player);

      final players = await repository.getAllPlayers();
      expect(players.length, 1);
      expect(players[0].name, 'John Doe');
      expect(players[0].number, 10);
      expect(players[0].position, 'Setter');
    });

    test('getAllPlayers - should return all players in the repository',
        () async {
      final players = [
        Player(name: 'John Doe', number: 10, position: 'Setter'),
        Player(name: 'Jane Smith', number: 5, position: 'Libero'),
      ];
      repository.addTestPlayers(players);

      final result = await repository.getAllPlayers();

      expect(result.length, 2);
      expect(result[0].name, 'John Doe');
      expect(result[1].name, 'Jane Smith');
    });

    test('getPlayerById - should return player with given id', () async {
      final player = Player(
          id: 'test-id', name: 'John Doe', number: 10, position: 'Setter');
      await repository.savePlayer(player);

      final result = await repository.getPlayerById('test-id');

      expect(result, isNotNull);
      expect(result!.id, 'test-id');
      expect(result.name, 'John Doe');
    });

    test('getPlayerById - should return null for non-existent id', () async {
      final result = await repository.getPlayerById('non-existent-id');

      expect(result, isNull);
    });
  });
}
