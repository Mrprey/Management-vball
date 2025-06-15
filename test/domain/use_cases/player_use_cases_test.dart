import 'package:flutter_test/flutter_test.dart';
import 'package:management_vball/core/constants/player_positions.dart';
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
    });    test('RegisterPlayerUseCase - should register a new player with valid position', () async {
      // Act
      final player = await registerUseCase.execute('John Doe', 10, PlayerPositions.setter);

      // Assert
      final players = await repository.getAllPlayers();
      expect(players.length, 1);
      expect(player.name, 'John Doe');
      expect(player.number, 10);
      expect(player.position, PlayerPositions.setter);
      expect(players[0], player);
    });
    
    test('RegisterPlayerUseCase - should register players with all valid positions', () async {
      // Test all valid positions
      await registerUseCase.execute('Player1', 1, PlayerPositions.setter);          // L - Setter
      await registerUseCase.execute('Player2', 2, PlayerPositions.outsideHitter1);  // P1 - Outside Hitter 1
      await registerUseCase.execute('Player3', 3, PlayerPositions.outsideHitter2);  // P2 - Outside Hitter 2
      await registerUseCase.execute('Player4', 4, PlayerPositions.opposite);        // O - Opposite
      await registerUseCase.execute('Player5', 5, PlayerPositions.middleBlocker1);  // M1 - Middle Blocker 1
      await registerUseCase.execute('Player6', 6, PlayerPositions.middleBlocker2);  // M2 - Middle Blocker 2
      await registerUseCase.execute('Player7', 7, PlayerPositions.libero);          // Lib - Libero
      
      // Assert
      final players = await repository.getAllPlayers();
      expect(players.length, 7);
    });
    
    test('RegisterPlayerUseCase - should throw error for invalid position', () async {
      // Act & Assert
      expect(() async => await registerUseCase.execute('John Doe', 10, 'InvalidPosition'), 
             throwsA(isA<Exception>()));
    });
    
    test('RegisterPlayerUseCase - should throw error for empty name', () async {
      // Act & Assert
      expect(() async => await registerUseCase.execute('', 10, PlayerPositions.setter), 
             throwsA(isA<Exception>()));
    });
    
    test('RegisterPlayerUseCase - should throw error for invalid number', () async {
      // Act & Assert
      expect(() async => await registerUseCase.execute('John Doe', 0, PlayerPositions.setter), 
             throwsA(isA<Exception>()));
      expect(() async => await registerUseCase.execute('John Doe', -5, PlayerPositions.setter), 
             throwsA(isA<Exception>()));
      expect(() async => await registerUseCase.execute('John Doe', 100, 'L'), 
             throwsA(isA<Exception>()));
    });

    test('GetAllPlayersUseCase - should return all players', () async {
      // Arrange
      final testPlayers = [
        Player(name: 'John Doe', number: 10, position: 'L'),
        Player(name: 'Jane Smith', number: 5, position: 'Lib'),
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
