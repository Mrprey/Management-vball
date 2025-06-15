import 'package:flutter/material.dart';
import 'package:volei_project/domain/entities/player.dart';
import 'package:volei_project/domain/use_cases/player_use_cases.dart';

class PlayerViewModel extends ChangeNotifier {
  final RegisterPlayerUseCase _registerPlayerUseCase;
  final GetAllPlayersUseCase _getAllPlayersUseCase;
  
  PlayerViewModel(this._registerPlayerUseCase, this._getAllPlayersUseCase);
  
  bool _isLoading = false;
  String? _errorMessage;
  List<Player> _players = [];
  
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<Player> get players => _players;
  
  Future<void> addPlayer(String name, int number, String role) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    
    try {
      await _registerPlayerUseCase.execute(name, number, role);
      await loadPlayers(); // Recarrega lista após adicionar
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  Future<void> loadPlayers() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _players = await _getAllPlayersUseCase.execute();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
