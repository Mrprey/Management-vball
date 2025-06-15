import 'package:management_vball/domain/entities/player.dart';
import 'package:management_vball/domain/repositories/player_repository.dart';

class FakePlayerRepository implements PlayerRepository {
  final List<Player> _players = [];

  @override
  Future<List<Player>> getAllPlayers() async {
    return _players;
  }

  @override
  Future<Player?> getPlayerById(String id) async {
    try {
      return _players.firstWhere((player) => player.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> savePlayer(Player player) async {
    _players.add(player);
  }

  void addTestPlayers(List<Player> players) {
    _players.addAll(players);
  }

  void clear() {
    _players.clear();
  }
}
