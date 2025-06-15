import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class RotationManagerViewModel extends ChangeNotifier {
  List<String> players = [
    'Player 1',
    'Player 2',
    'Player 3',
    'Player 4',
    'Player 5',
    'Player 6'
  ];
  bool isReceptionMode = true;
  String currentPosition = 'P1';

  Map<String, dynamic> _positions = {};

  RotationManagerViewModel() {
    _loadPositions();
  }

  void _loadPositions() async {
    try {
      final file = File('assets/player_positions.json');
      if (await file.exists()) {
        final jsonString = await file.readAsString();
        _positions = jsonDecode(jsonString);
      } else {
        debugPrint('JSON file not found.');
        _positions = {};
      }
    } catch (e) {
      debugPrint('Error loading positions: $e');
      _positions = {};
    }
    notifyListeners();
  }

  void rotatePlayers() {
    _rotateLastPlayer();
    notifyListeners();
  }

  void _rotateLastPlayer() {
    final String lastPlayer = players.removeLast();
    players.insert(0, lastPlayer);
  }

  void toggleMode() {
    isReceptionMode = !isReceptionMode;
    notifyListeners();
  }

  List<Map<String, dynamic>> getPositions(BuildContext context) {
    if (_positions.isEmpty || !_positions.containsKey(currentPosition)) {
      debugPrint('Invalid or missing position data for $currentPosition.');
      return [];
    }

    final positionData = _positions[currentPosition];
    final mode = isReceptionMode ? 'recepção' : 'saque';

    if (!positionData.containsKey(mode)) {
      debugPrint('Mode $mode not found for position $currentPosition.');
      return [];
    }

    return positionData[mode].entries.map((entry) {
      return {
        'name': entry.key,
        'top': entry.value['top'],
        'left': entry.value['left'],
      };
    }).toList();
  }
}
