import 'player.dart';

class Team {
  final String name;
  final List<Player> players;

  Team({required this.name, required this.players});

  void addPlayer(Player player) {
    players.add(player);
  }

  void removePlayer(Player player) {
    players.remove(player);
  }
}
