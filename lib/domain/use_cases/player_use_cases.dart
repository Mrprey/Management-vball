import 'package:management_vball/core/constants/player_positions.dart';
import 'package:management_vball/domain/entities/player.dart';
import 'package:management_vball/domain/repositories/player_repository.dart';

class RegisterPlayerUseCase {
  final PlayerRepository _playerRepository;

  RegisterPlayerUseCase(this._playerRepository);

  Future<Player> execute(String name, int number, String position) async {
    // Validate name
    if (name.isEmpty) {
      throw Exception('Player name cannot be empty');
    }
    
    // Validate number
    if (number <= 0 || number > 99) {
      throw Exception('Player number must be between 1 and 99');
    }
    
    // Validate position - only allow volleyball positions
    if (!PlayerPositions.isValidPosition(position)) {
      throw Exception('Invalid player position. Must be one of: ${PlayerPositions.allPositions.join(', ')}');
    }
    
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
