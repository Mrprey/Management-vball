import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Player extends Equatable {
  final String id;
  final String name;
  final int number;
  final String position;

  Player({
    String? id,
    required this.name,
    required this.number,
    required this.position,
  }) : this.id = id ?? const Uuid().v4();

  @override
  List<Object?> get props => [id, name, number, position];
}
