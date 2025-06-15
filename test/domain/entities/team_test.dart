import 'package:flutter_test/flutter_test.dart';
import 'package:management_vball/domain/entities/player.dart';
import 'package:management_vball/domain/entities/team.dart';

void main() {
  group('Team', () {
    late List<Player> players;

    setUp(() {
      players = [
        Player(
            id: 'player-1', name: 'John Doe', number: 10, position: 'Setter'),
        Player(
            id: 'player-2', name: 'Jane Smith', number: 5, position: 'Libero'),
      ];
    });

    test('two teams with same properties should be equal', () {
      final team1 = Team(id: 'team-1', name: 'Eagles', players: players);
      final team2 = Team(id: 'team-1', name: 'Eagles', players: players);

      expect(team1 == team2, true);
    });

    test('id should be auto-generated if not provided', () {
      final team = Team(name: 'Eagles', players: players);

      expect(team.id, isNotNull);
      expect(team.id, isNotEmpty);
    });

    test('copyWith should create a new team with specified properties', () {
      final team = Team(id: 'team-1', name: 'Eagles', players: players);
      final newTeam = team.copyWith(name: 'Hawks');

      expect(newTeam.id, 'team-1');
      expect(newTeam.name, 'Hawks');
      expect(newTeam.players, players);
      expect(newTeam != team, true);
    });

    test('addPlayer should create a new team with an additional player', () {
      final team = Team(id: 'team-1', name: 'Eagles', players: players);
      final newPlayer = Player(
          id: 'player-3', name: 'Bob Jones', number: 7, position: 'Middle');

      final newTeam = team.addPlayer(newPlayer);

      expect(newTeam.players.length, 3);
      expect(newTeam.players.last, newPlayer);
      expect(team.players.length, 2); // Original team should be unchanged
    });

    test('removePlayer should create a new team without the removed player',
        () {
      final team = Team(id: 'team-1', name: 'Eagles', players: players);
      final playerToRemove = players[0];

      final newTeam = team.removePlayer(playerToRemove);

      expect(newTeam.players.length, 1);
      expect(newTeam.players.contains(playerToRemove), false);
      expect(team.players.length, 2); // Original team should be unchanged
    });

    test('props should contain all properties', () {
      final team = Team(id: 'team-1', name: 'Eagles', players: players);

      expect(team.props, [team.id, team.name, team.players]);
    });
  });
}
