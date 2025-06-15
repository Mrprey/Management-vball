import 'package:management_vball/domain/entities/player.dart';
import 'package:management_vball/domain/repositories/player_repository.dart';

class RegisterPlayerUseCase {
  final PlayerRepository _playerRepository;

  RegisterPlayerUseCase(this._playerRepository);

  Future<Player> execute(String name, int number, String position) async {
    final player = Player(name: name, number: number, position: position);
    await _playerRepository.savePlayer(player);
    return player;
  }
}

class GetAllPlayersUseCase {
  final PlayerRepository _playerRepository;

  GetAllPlayersUseCase(this._playerRepository);

  Future<List<Player>> execute() async {
    return _playerRepository.getAllPlayers();
  }
}
