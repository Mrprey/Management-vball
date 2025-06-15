import 'package:flutter_test/flutter_test.dart';
import 'package:management_vball/core/constants/player_positions.dart';
import 'package:management_vball/domain/entities/player.dart';
import 'package:management_vball/domain/use_cases/player_use_cases.dart';
import 'package:management_vball/presentation/view_models/player_view_model.dart';

import '../../data/repositories/fake_player_repository.dart';

void main() {
  group('PlayerViewModel', () {
    late PlayerViewModel viewModel;
    late RegisterPlayerUseCase registerUseCase;
    late GetAllPlayersUseCase getAllPlayersUseCase;
    late FakePlayerRepository repository;

    setUp(() {
      repository = FakePlayerRepository();
      registerUseCase = RegisterPlayerUseCase(repository);
      getAllPlayersUseCase = GetAllPlayersUseCase(repository);
      viewModel = PlayerViewModel(registerUseCase, getAllPlayersUseCase);
      
      // Clear repository between tests
      repository.clear();
    });

    test('should start with empty players list and no loading state', () {
      expect(viewModel.players, isEmpty);
      expect(viewModel.isLoading, isFalse);
      expect(viewModel.errorMessage, isNull);
    });    test('should register a player and update players list', () async {
      // Act
      await viewModel.addPlayer('John Doe', 10, PlayerPositions.setter);

      // Assert
      final players = await repository.getAllPlayers();
      expect(players.length, 1);
      expect(players[0].name, 'John Doe');
      expect(players[0].number, 10);
      expect(players[0].position, PlayerPositions.setter);
      
      expect(viewModel.players.length, 1);
      expect(viewModel.players[0].name, 'John Doe');
      expect(viewModel.isLoading, isFalse);
    });

    test('should load players', () async {
      // Arrange
      final testPlayers = [
        Player(name: 'John Doe', number: 10, position: PlayerPositions.setter),
        Player(name: 'Jane Smith', number: 5, position: 'Libero'),
      ];
      repository.addTestPlayers(testPlayers);

      // Act
      await viewModel.loadPlayers();

      // Assert
      expect(viewModel.players.length, 2);
      expect(viewModel.players[0].name, 'John Doe');
      expect(viewModel.players[1].name, 'Jane Smith');
      expect(viewModel.isLoading, isFalse);
    });
  });
}
