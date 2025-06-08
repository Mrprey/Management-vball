import '../../domain/entities/player.dart';

class PlayerRegistry {
  final List<Player> _players = [];

  Player addPlayer(String name, int number, String role) {
    final newPlayer = Player(name: name, number: number, position: role);
    _players.add(newPlayer);
    return newPlayer;
  }

  List<Player> listPlayers() {
    return _players;
  }
}
