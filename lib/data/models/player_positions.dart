import 'dart:convert';
import 'dart:io';

class PlayerPosition {
  final double top;
  final double left;
  final String name;

  PlayerPosition({required this.top, required this.left, required this.name});

  factory PlayerPosition.fromJson(Map<String, dynamic> json, String name) {
    return PlayerPosition(
      top: json['top'],
      left: json['left'],
      name: name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'top': top,
      'left': left,
    };
  }
}

class ModePositions {
  final List<PlayerPosition> positions;

  ModePositions({required this.positions});

  factory ModePositions.fromJson(Map<String, dynamic> json) {
    return ModePositions(
      positions: json.entries.map((entry) {
        return PlayerPosition.fromJson(entry.value, entry.key);
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      for (var position in positions) position.name: position.toJson(),
    };
  }
}

class RotationPosition {
  final ModePositions reception;
  final ModePositions serve;

  RotationPosition({required this.reception, required this.serve});

  factory RotationPosition.fromJson(Map<String, dynamic> json) {
    return RotationPosition(
      reception: ModePositions.fromJson(json['recepção']),
      serve: ModePositions.fromJson(json['saque']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recepção': reception.toJson(),
      'saque': serve.toJson(),
    };
  }
}

class PlayerPositionsData {
  final Map<String, RotationPosition> positions;

  PlayerPositionsData({required this.positions});

  factory PlayerPositionsData.fromJson(List<dynamic> jsonList) {
    final positions = <String, RotationPosition>{};
    for (var json in jsonList) {
      positions.addAll(json.map((key, value) => MapEntry(
            key,
            RotationPosition.fromJson(value),
          )));
    }
    return PlayerPositionsData(positions: positions);
  }
}

void savePositionsToJson(Map<String, RotationPosition> positions) async {
  final jsonString = jsonEncode(
    positions.map((key, value) => MapEntry(key, value.toJson())),
  );

  final file = File('assets/player_positions.json');
  await file.writeAsString(jsonString);
  print('Positions saved to assets/player_positions.json');
}
