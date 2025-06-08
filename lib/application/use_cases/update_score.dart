import '../../domain/entities/match.dart';
import '../../domain/entities/team.dart';

class UpdateScore {
  void addPoint(Match match, Team team) {
    match.updateScore(team, 1);
  }

  void nextSet(Match match) {
    match.nextSet();
  }
}
