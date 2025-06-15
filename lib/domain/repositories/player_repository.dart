import '../entities/player.dart';

abstract class PlayerRepository {
  Future<void> savePlayer(Player player);
  Future<List<Player>> getAllPlayers();
  Future<Player?> getPlayerById(String id);
}
