import '../../application/use_cases/register_player.dart';
import '../../domain/entities/player.dart';

class PlayerController {
  final RegisterPlayer _registerPlayer;

  PlayerController(this._registerPlayer);

  Player addPlayer(String name, int number, String position) {
    return _registerPlayer.addPlayer(name, number, position);
  }

  List<Player> listPlayers() {
    return _registerPlayer.listPlayers();
  }
}
