import '../../domain/entities/player.dart';

class PlayerRepository {
  final List<Player> _players = [];

  void save(Player player) {
    _players.add(player);
  }

  List<Player> findAll() {
    return _players;
  }
}
