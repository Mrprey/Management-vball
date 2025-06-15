import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'player.dart';

class Team extends Equatable {
  final String id;
  final String name;
  final List<Player> players;

  Team({
    String? id,
    required this.name,
    required this.players,
  }) : id = id ?? const Uuid().v4();

  Team copyWith({
    String? id,
    String? name,
    List<Player>? players,
  }) {
    return Team(
      id: id ?? this.id,
      name: name ?? this.name,
      players: players ?? this.players,
    );
  }

  Team addPlayer(Player player) {
    final newPlayers = List<Player>.from(players)..add(player);
    return copyWith(players: newPlayers);
  }

  Team removePlayer(Player player) {
    final newPlayers = List<Player>.from(players)..remove(player);
    return copyWith(players: newPlayers);
  }

  @override
  List<Object?> get props => [id, name, players];
}
