import 'package:management_vball/domain/entities/player.dart';
import 'package:management_vball/domain/repositories/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final List<Player> _players = [];
  
  @override
  Future<void> savePlayer(Player player) async {
    _players.add(player);
  }
  
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
}
