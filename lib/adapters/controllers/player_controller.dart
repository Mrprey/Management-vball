import '../../application/use_cases/player_registry.dart';
import '../../domain/entities/player.dart';

class PlayerController {
  final PlayerRegistry _playerRegistry;

  PlayerController(this._playerRegistry);

  Player addPlayer(String name, int number, String position) {
    return _playerRegistry.addPlayer(name, number, position);
  }

  List<Player> listPlayers() {
    return _playerRegistry.listPlayers();
  }
}
