import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../generated/l10n.dart';

import 'post_rating.dart';

const int RR_FRACTION_ID = 0;
const int PR_FRACTION_ID = 1;
const int TK_FRACTION_ID = 2;

const int RR_TEAM_AMOUNT = 6;
const int PR_TEAM_AMOUNT = 3;
const int TK_TEAM_AMOUNT = 4;

void initFractions() {
  rrFraction.initFraction();
  prFraction.initFraction();
  tkFraction.initFraction();
}

final Fraction rrFraction = Fraction(
  name: fractionNamesList[RR_FRACTION_ID], 
  id: RR_FRACTION_ID,
  maxTeamAmount: RR_TEAM_AMOUNT,
);

final Fraction prFraction = Fraction(
  name: fractionNamesList[PR_FRACTION_ID], 
  id: PR_FRACTION_ID,
  maxTeamAmount: PR_TEAM_AMOUNT,
);

final Fraction tkFraction = Fraction(
  name: fractionNamesList[TK_FRACTION_ID], 
  id: TK_FRACTION_ID,
  maxTeamAmount: TK_TEAM_AMOUNT,
);

final List<Fraction> fraction = <Fraction>[
  rrFraction,
  prFraction,
  tkFraction,
];

final List<String> fractionNamesList = [
  S.current.fractionName1,
  S.current.fractionName2,
  S.current.fractionName3,
];

class Fraction {

  final String name;
  final int id;
  final int maxTeamAmount;
  int teamNumber = 0;
  List<Team> teamList = <Team>[];

  Fraction({required this.name, required this.id, required this.maxTeamAmount}); 

  void initFraction() {
    for (var i = 0; i < this.maxTeamAmount; i++) {
      this.addTeam();
    }
  }
  
  void addTeam() {
    this.teamList.add(Team(fractionId: this.id, id: this.teamNumber));
    this.teamNumber = this.teamList.length;
  }

  void removeTeam(int teamId) {
    this.teamList.forEach((team) {
      if (team.id == teamId) {
        this.teamList.remove(team);
      }
    });
    this.teamNumber = this.teamList.length;
  }
  
  int getMaxTeamAmountOfThisFraction(int fractionId) {
    switch (fractionId) {
      case RR_FRACTION_ID:
        return RR_TEAM_AMOUNT;
      case PR_FRACTION_ID:
        return PR_TEAM_AMOUNT;
      case TK_FRACTION_ID:
        return TK_TEAM_AMOUNT;
      default:
        return -1;
    }
  }

  void sortTeams({bool reversed = false}) {
    this.teamList.sort((Team a, Team b) {
      return a.compareTo(b);
    });

    if (reversed) {
      this.teamList = this.teamList.reversed.toList();
    }
  }

}

_TeamNames teamNames = _TeamNames();
_TeamColor teamColor = _TeamColor();


class Team implements Comparable {
  Team({required this.fractionId, required this.id}){
    name = teamNames.popTeamName(fractionId);
    image = _FractionIcon().getTeamIcon(fractionId);
    statsDescrp = _StatisticDescription().getStatsDescrp(fractionId);
    statsValue = _StatisticValue().initStatsValue();
  }

  final int fractionId;
  final int id;
  late String name;
  late IconData image;
  final Color color = teamColor.getColor();
  List<String> statsDescrp = <String>[];
  late List<int?> statsValue; 
  int rating = 0;
  int ratingDynamic = 0;

  List<String> getFormatedStatsOfTeam() {
    String statsAnswerAll = '';

    List<String> statsAnswers = <String>['', '', ''];

    if (this.statsValue.contains(null)) return statsAnswers;

    this.statsValue.forEach((value) {
      if (value! >= 0) {
        statsAnswerAll += '+$value:';
      } else {
        statsAnswerAll += '$value:';
      }
    });

    statsAnswers = statsAnswerAll.split(':');
    statsAnswers.removeLast();

    for (var i = 0; i < statsAnswers.length; i++) {
      statsAnswers[i] += ' ${this.statsDescrp[i]}'; 
    }

    return statsAnswers;
  }

  String getFormatedRatingDynamic() {
    int sumOfStats = 0;
    this.statsValue.forEach((stat) {
      sumOfStats += stat!;
    });
    if (sumOfStats >= 0) {
      return '+$sumOfStats';
    } else {
      return '$sumOfStats';
    }
  }

  @override
  int compareTo(dynamic other) {

    other as Team;

    if (rating < other.rating) {
      return 1;
    }

    if (rating > other.rating) {
      return -1;
    }

    if (rating == other.rating) {
      return 0;
    }

    return 11; //????
  }
  
}

void updateRatingBy(GameRating gameRating) {
  int updatedTeamAmount = 0; //as teamId, both means same

  print("i can't reach that code!!!");

  fraction.forEach((Fraction fraction) {
    List<TeamInfo> fractionRating = gameRating.getFractionInfoBy(fraction.id);

    fraction.teamList.forEach((Team team) {

      fractionRating.forEach((TeamInfo teamInfo) {

        if (team.id == updatedTeamAmount) {
          List<int> statsInfo = teamInfo.getStatsInfo();

          for (var i = 0; i < team.statsValue.length; i++) {
            team.statsValue[i] = statsInfo[i] ;           
          }

          team.ratingDynamic = teamInfo.ratingChange1 +
            teamInfo.ratingChange2 +
            teamInfo.ratingChange3;

          team.rating = teamInfo.rating;

          updatedTeamAmount++;
        }        

      });
    });
    fraction.sortTeams();
    updatedTeamAmount = 0;
  });
}

class _TeamNames {
  
  List<List<String>> teamNames = [
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

  String popTeamName(int fractionId) {
    return this.teamNames[fractionId].removeAt(0);
  }
}

class _StatisticDescription {

  List<String> rrStats = <String>[
    S.current.rrRatingStat1,
    S.current.rrRatingStat2,
    S.current.rrRatingStat3,
  ];
  List<String> prStats = <String>[
    S.current.prRatingStat1,
    S.current.prRatingStat2,
    S.current.prRatingStat3,
  ];
  List<String> tkStats = <String>[
    S.current.tkRatingStat1,
    S.current.tkRatingStat2,
    S.current.tkRatingStat3,
  ];

  _StatisticDescription();

  List<String> getStatsDescrp(int fractionId) {
    switch (fractionId) {
      case RR_FRACTION_ID:
        return rrStats;
      case PR_FRACTION_ID:
        return prStats;
      case TK_FRACTION_ID:
        return tkStats;
    }
    return [];
  }

}

class _StatisticValue {
  List<int?> statsValue = <int?>[
    0, //Stat1
    0, //Stat2
    0, //Stat3
  ];

  _StatisticValue();

  List<int?> initStatsValue() {
    return statsValue;
  }
}

class _TeamColor {
  List<Color> teamColor = <Color>[
    Colors.black,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.red,
    Colors.yellow,
    Colors.indigo,
  ];

  _TeamColor();

  Color getColor() {
    if (this.teamColor.isNotEmpty) {
      return _popedColor();
    } else {
      _initColor();
      return _popedColor();
    }
  }

  void _initColor() {
    this.teamColor = <Color>[
      Colors.black,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.pink,
      Colors.purple,
      Colors.red,
      Colors.yellow,
      Colors.indigo,
    ];
  }

  Color _popedColor() {
    return this.teamColor.removeLast();
  }
}

class TeamIcons {
  TeamIcons._();

  static const String _fontFam = 'CustomIcons';

  static const IconData road =
      IconData(0xe804, fontFamily: _fontFam);
  static const IconData pin =
      IconData(0xe808, fontFamily: _fontFam);
  static const IconData star =
      IconData(0xe80c, fontFamily: _fontFam);
}

class _FractionIcon {

  List<IconData> fractionsTeamIcons = <IconData>[
    TeamIcons.road,
    TeamIcons.star,
    TeamIcons.pin,
  ];

  _FractionIcon();

  IconData getTeamIcon(int fractionId) {
    return fractionsTeamIcons[fractionId];
  }

}
