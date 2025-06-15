import 'package:flutter/material.dart';

/// Class that defines the possible volleyball player positions
/// along with their codes and descriptions.
class PlayerPositions {
  PlayerPositions._(); // Private constructor to prevent instantiation

  // Position codes
  static const String setter = 'L'; // Levantador (Setter)
  static const String outsideHitter1 = 'P1'; // Ponteiro 1 (Outside Hitter 1)
  static const String outsideHitter2 = 'P2'; // Ponteiro 2 (Outside Hitter 2)
  static const String opposite = 'O'; // Oposto (Opposite)
  static const String middleBlocker1 =
      'M1'; // Meio de Rede 1 (Middle Blocker 1)
  static const String middleBlocker2 =
      'M2'; // Meio de Rede 2 (Middle Blocker 2)
  static const String libero = 'Lib'; // Líbero (Libero)

  // Position descriptions
  static const String setterDesc = 'Setter';
  static const String outsideHitter1Desc = 'Outside Hitter 1';
  static const String outsideHitter2Desc = 'Outside Hitter 2';
  static const String oppositeDesc = 'Opposite';
  static const String middleBlocker1Desc = 'Middle Blocker 1';
  static const String middleBlocker2Desc = 'Middle Blocker 2';
  static const String liberoDesc = 'Libero';

  // Map with all position codes and their descriptions
  static const Map<String, String> positionsMap = {
    setter: setterDesc,
    outsideHitter1: outsideHitter1Desc,
    outsideHitter2: outsideHitter2Desc,
    opposite: oppositeDesc,
    middleBlocker1: middleBlocker1Desc,
    middleBlocker2: middleBlocker2Desc,
    libero: liberoDesc,
  };

  // List of all allowed position codes
  static List<String> get allPositions => positionsMap.keys.toList();

  // Check if a position code is valid
  static bool isValidPosition(String position) {
    return positionsMap.containsKey(position);
  }

  // Get the description for a position code
  static String getDescription(String position) {
    return positionsMap[position] ?? 'Unknown position';
  }

  // Get all positions as a list of dropdown items
  static List<DropdownMenuItem<String>> getPositionItems() {
    return positionsMap.entries
        .map((entry) => DropdownMenuItem<String>(
              value: entry.key,
              child: Text('${entry.key} - ${entry.value}'),
            ))
        .toList();
  }
}
