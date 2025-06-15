import 'package:flutter_test/flutter_test.dart';
import 'package:management_vball/domain/entities/player.dart';
import 'package:management_vball/domain/use_cases/player_use_cases.dart';

import '../../data/repositories/fake_player_repository.dart';

void main() {
  group('PlayerUseCases', () {
    late FakePlayerRepository repository;
    late RegisterPlayerUseCase registerUseCase;
    late GetAllPlayersUseCase getAllPlayersUseCase;

    setUp(() {
      repository = FakePlayerRepository();
      registerUseCase = RegisterPlayerUseCase(repository);
      getAllPlayersUseCase = GetAllPlayersUseCase(repository);
      
      // Clear repository between tests
      repository.clear();
    });

    test('RegisterPlayerUseCase - should register a new player', () async {
      // Act
      final player = await registerUseCase.execute('John Doe', 10, 'Setter');

      // Assert
      final players = await repository.getAllPlayers();
      expect(players.length, 1);
      expect(player.name, 'John Doe');
      expect(player.number, 10);
      expect(player.position, 'Setter');
      expect(players[0], player);
    });

    test('GetAllPlayersUseCase - should return all players', () async {
      // Arrange
      final testPlayers = [
        Player(name: 'John Doe', number: 10, position: 'Setter'),
        Player(name: 'Jane Smith', number: 5, position: 'Libero'),
      ];
      repository.addTestPlayers(testPlayers);

      // Act
      final result = await getAllPlayersUseCase.execute();

      // Assert
      expect(result.length, 2);
      expect(result[0].name, 'John Doe');
      expect(result[1].name, 'Jane Smith');
    });
  });
}
