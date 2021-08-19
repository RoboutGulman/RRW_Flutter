import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../generated/l10n.dart';

import 'post_rating.dart';

class Team implements Comparable {
  Team({required int fractionID, required int teamID}) {
    name = fractionsTeamNames[fractionID][teamID];
    id = teamID;
    rating = 0;
    image = fractionsTeamIcons[fractionID];
    rateChange = fractionRateData[fractionID];
    color = fractionTeamColors[fractionID][teamID];
  }

  late String name;
  late IconData image;
  late Color color;
  late int id;
  late num rating;
  late num ratingDynamic;
  late Map<String, int?> rateChange;

  Widget buildTeam(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            child: Icon(
              image,
              color: color,
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 8,
          child: Container(
            height: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  name,
                  style: Theme.of(context).primaryTextTheme.subtitle2,
                ),
                showRateStatistic(context),
              ],
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: showFinalRating(context),
        ),
      ],
    );
  }

  Widget showRateStatistic(BuildContext context) {
    final List<String> rateChangeElements = getTranslatedMapRateChangeToListString();

    return Container(
      padding: const EdgeInsets.only(top: 3),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width / 40.39,
        children: <Widget>[
          Text(
            rateChangeElements[0],
            style: Theme.of(context).primaryTextTheme.subtitle1,
          ),
          Text(
            rateChangeElements[1],
            style: Theme.of(context).primaryTextTheme.subtitle1,
          ),
          Text(
            rateChangeElements[2],
            style: Theme.of(context).primaryTextTheme.subtitle1,
          ),
        ],
      )
    );
  }

  List<String> getTranslatedMapRateChangeToListString() {
    String rateAnswerAll = '';
    late String rateChange_1;
    late String rateChange_2;
    late String rateChange_3;
    const String deltaSign = '+';
    List<String> rateAnswers = <String>['', '', ''];

    List<String> result = <String>[];

    if (rateChange.containsValue(null)) return rateAnswers;

    rateChange.forEach((String key, int? value) {
      if (value! >= 0) rateAnswerAll += deltaSign;

      rateAnswerAll += '$value ' + '$key :';
    });

    rateAnswers = rateAnswerAll.split(':');

    rateChange_1 = rateAnswers[0];
    rateChange_2 = rateAnswers[1];
    rateChange_3 = rateAnswers[2];

    result.add(rateChange_1);
    result.add(rateChange_2);
    result.add(rateChange_3);

    return result;
  }

  Widget showFinalRating(BuildContext context) {
    ratingDynamic = 0;
    String deltaSign = '+';
    String ratingDelta;

    rateChange.forEach((String key, int? value) {
      if (value != null) ratingDynamic += value;
    });

    if (ratingDynamic < 0) {
      deltaSign = '';
    }

    if (rateChange.containsValue(null)) {
      ratingDelta = '';
    } else {
      ratingDelta = '$deltaSign$ratingDynamic';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          '$rating',
          style: Theme.of(context).primaryTextTheme.headline4,
        ),
        Container(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            ratingDelta,
            style: Theme.of(context).primaryTextTheme.headline3,
          ),
        ),
      ],
    );
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

    return 11; //i'm so sorry
  }
  
}

////////////////////////////////////////////////////////////////////////////////

List<String> rrTeamNames = <String>[
  S.current.rrTeamNames1,
  S.current.rrTeamNames2,
  S.current.rrTeamNames3,
  S.current.rrTeamNames4,
  S.current.rrTeamNames5,
  S.current.rrTeamNames6,                                   
];

Map<String, int?> rrRateChange = <String, int?>{
  S.current.rrRatingStat1: null,
  S.current.rrRatingStat2: null,
  S.current.rrRatingStat3: null,
};

const List<Color> rrTeamColors = <Color>[
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.black,
];

////////////////////////////////////////////////////////////////////////////////

List<String> prTeamNames = <String>[
  S.current.prTeamNames1,
  S.current.prTeamNames2,
  S.current.prTeamNames3,
];

Map<String, int?> prRateChange = <String, int?>{
  S.current.prRatingStat1: null,
  S.current.prRatingStat2: null,
  S.current.prRatingStat3: null,
};

const List<Color> prTeamColors = <Color>[
  Colors.yellow,
  Colors.blue,
  Colors.red,
];

////////////////////////////////////////////////////////////////////////////////
List<String> tkTeamNames = <String>[
  S.current.tkTeamNames1,
  S.current.tkTeamNames2,
  S.current.tkTeamNames3,
  S.current.tkTeamNames4,
];

Map<String, int?> tkRateChange = <String, int?>{
  S.current.tkRatingStat1: null,
  S.current.tkRatingStat2: null,
  S.current.tkRatingStat3: null,
};

const List<Color> tkTeamColors = <Color>[
  Colors.yellow,
  Colors.purple,
  Colors.pink,
  Colors.green,
];

////////////////////////////////////////////////////////////////////////////////

List<IconData> fractionsTeamIcons = <IconData>[
  CustomIcons.road,
  CustomIcons.star,
  CustomIcons.pin,
];

class CustomIcons {
  CustomIcons._();

  static const String _fontFam = 'CustomIcons';

  static const IconData road =
      IconData(0xe804, fontFamily: _fontFam);
  static const IconData pin =
      IconData(0xe808, fontFamily: _fontFam);
  static const IconData star =
      IconData(0xe80c, fontFamily: _fontFam);
}

List<List<Color>> fractionTeamColors = <List<Color>>[
  rrTeamColors,
  prTeamColors,
  tkTeamColors,
];

List<Map<String, int?>> fractionRateData = <Map<String, int?>>[
  rrRateChange,
  prRateChange,
  tkRateChange,
];

////////////////////////////////////////////////////////////////////////////////

const int RR_FRACTION_ID = 0;
const int PR_FRACTION_ID = 1;
const int TK_FRACTION_ID = 2;

List<List<String>> fractionsTeamNames = <List<String>>[
  rrTeamNames,
  prTeamNames,
  tkTeamNames,
];

List<Team> rrFraction = <Team>[
  Team(fractionID: RR_FRACTION_ID, teamID: 0),
  Team(fractionID: RR_FRACTION_ID, teamID: 1),
  Team(fractionID: RR_FRACTION_ID, teamID: 2),
  Team(fractionID: RR_FRACTION_ID, teamID: 3),
  Team(fractionID: RR_FRACTION_ID, teamID: 4),
  Team(fractionID: RR_FRACTION_ID, teamID: 5),
];
List<Team> prFraction = <Team>[
  Team(fractionID: PR_FRACTION_ID, teamID: 0),
  Team(fractionID: PR_FRACTION_ID, teamID: 1),
  Team(fractionID: PR_FRACTION_ID, teamID: 2),
];
List<Team> tkFraction = <Team>[
  Team(fractionID: TK_FRACTION_ID, teamID: 0),
  Team(fractionID: TK_FRACTION_ID, teamID: 1),
  Team(fractionID: TK_FRACTION_ID, teamID: 2),
  Team(fractionID: TK_FRACTION_ID, teamID: 3),
];

////////////////////////////////////////////////////////////////////////////////

void sortTeams(List<Team> currentFraction, {bool reversed = false}) {
  currentFraction.sort((Team a, Team b) {
    return a.compareTo(b);
  });
  if (reversed) {
    currentFraction = currentFraction.reversed.toList();
  }
}

void updateRatingBy(GameRating gameRating) {
  rrFraction.forEach((Team team) {
    gameRating.railways.forEach((TeamInfo teamInfo) {
      if (team.name == teamInfo.teamName) {
        team.rateChange[S.current.rrRatingStat1] = teamInfo.ratingChange1;
        team.rateChange[S.current.rrRatingStat2] = teamInfo.ratingChange2;
        team.rateChange[S.current.rrRatingStat3] = teamInfo.ratingChange3;
        team.ratingDynamic = teamInfo.ratingChange1 +
          teamInfo.ratingChange2 +
          teamInfo.ratingChange3;
        team.rating = teamInfo.rating;
      }
    });
  });
  sortTeams(rrFraction);
  prFraction.forEach((Team team) {
    gameRating.policies.forEach((TeamInfo teamInfo) {
      if (team.name == teamInfo.teamName) {
        team.rateChange[S.current.prRatingStat1] = teamInfo.ratingChange1;
        team.rateChange[S.current.prRatingStat2] = teamInfo.ratingChange2;
        team.rateChange[S.current.prRatingStat3] = teamInfo.ratingChange3;
        team.ratingDynamic = teamInfo.ratingChange1 +
          teamInfo.ratingChange2 +
          teamInfo.ratingChange3;
        team.rating = teamInfo.rating;
      }
    });
  });
  sortTeams(prFraction);
  tkFraction.forEach((Team team) {
    gameRating.tradingCompanies.forEach((TeamInfo teamInfo) {
      if (team.name == teamInfo.teamName) {
        team.rateChange[S.current.tkRatingStat1] = teamInfo.ratingChange1;
        team.rateChange[S.current.tkRatingStat2] = teamInfo.ratingChange2;
        team.rateChange[S.current.tkRatingStat3] = teamInfo.ratingChange3;
        team.ratingDynamic = teamInfo.ratingChange1 +
          teamInfo.ratingChange2 +
          teamInfo.ratingChange3;
        team.rating = teamInfo.rating;
      }
    });
  });
  sortTeams(tkFraction);
}
