import 'package:rrw_mvc_refac/generated/l10n.dart';

class Team implements Comparable {
  Team({
    required this.fractionId,
    required this.id,
  }) {
    name = _TeamNames.getTeamName(this.fractionId, this.id);
  }

  final int fractionId;
  final int id;
  late String name;

  List<int> stats = [0, 0, 0];

  int rating = 0;
  int ratingDynamic = 0;

  @override
  int compareTo(dynamic other) {
    other as Team;

    if (rating < other.rating) {
      return 1;
    }

    if (rating > other.rating) {
      return -1;
    }

    return 0;
  }
}

class _TeamNames {
  static List<List<String>> teamNames = [
    [
      S.current.rrTeamNames1,
      S.current.rrTeamNames2,
      S.current.rrTeamNames3,
      S.current.rrTeamNames4,
      S.current.rrTeamNames5,
      S.current.rrTeamNames6,
    ],
    [
      S.current.prTeamNames1,
      S.current.prTeamNames2,
      S.current.prTeamNames3,
    ],
    [
      S.current.tkTeamNames1,
      S.current.tkTeamNames2,
      S.current.tkTeamNames3,
      S.current.tkTeamNames4,
    ],
  ];

  _TeamNames();

  static String getTeamName(int fractionId, int teamId) {
    return teamNames[fractionId][teamId];
  }
}