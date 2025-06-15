import 'package:equatable/equatable.dart';

class Position extends Equatable {
  final int number;
  final String description;

  const Position({
    required this.number,
    required this.description,
  });

  @override
  List<Object?> get props => [number, description];
}
