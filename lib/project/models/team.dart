import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'post_rating.dart';

class Team implements Comparable {
  late String name;
  late IconData image;
  late Color color;
  late int id;
  late num rating, ratingDynamic;
  late Map<String, int?> rateChange;

  Team({required int fractionID, required int teamID}) {
    this.name = fractionsTeamNames[fractionID][teamID];
    this.id = teamID;
    this.rating = 0;
    this.image = fractionsTeamIcons[fractionID];
    this.rateChange = fractionRateData[fractionID];
    this.color = fractionTeamColors[fractionID][teamID];
  }

  List<String> getTranslatedMapRateChangeToListString() {
    late String rateAnswerAll = '', rateChange_1, rateChange_2, rateChange_3;
    String deltaSign = '+';
    List<String> rateAnswers = ['', '', ''];

    List<String> result = [];

    if (this.rateChange.containsValue(null)) return rateAnswers;

    this.rateChange.forEach((key, value) {
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

  @override
  int compareTo(other) {
    if (this.rating < other.rating) {
      return 1;
    }

    if (this.rating > other.rating) {
      return -1;
    }

    if (this.rating == other.rating) {
      return 0;
    }

    return 11; //i'm so sorry
  }

  Widget showRateStatistic(BuildContext context) {
    List<String> rateChangeElements = getTranslatedMapRateChangeToListString();

    return Container(
      padding: EdgeInsets.only(top: 3),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width / 40.39,
        children: [
          Text(
            '${rateChangeElements[0]}',
            style: TextStyle(
              fontSize: 11,
              color: Color.fromRGBO(60, 60, 67, 0.6),
            ),
          ),
          Text(
            '${rateChangeElements[1]}',
            style: TextStyle(
              fontSize: 11,
              color: Color.fromRGBO(60, 60, 67, 0.6),
            ),
          ),
          Text(
            '${rateChangeElements[2]}',
            style: TextStyle(
              fontSize: 11,
              color: Color.fromRGBO(60, 60, 67, 0.6),
            ),
          ),
        ],
      )
    );
  }

  Widget showFinalRating() {
    this.ratingDynamic = 0;
    String deltaSign = '+';
    String ratingDelta;

    this.rateChange.forEach((key, value) {
      if (value != null) this.ratingDynamic += value;
    });

    if (this.ratingDynamic < 0) {
      deltaSign = '';
    }

    if (this.rateChange.containsValue(null)) {
      ratingDelta = '';
    } else {
      ratingDelta = '$deltaSign${this.ratingDynamic}';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${this.rating}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        Container(
          padding: EdgeInsets.only(top: 3),
          child: Text(
            ratingDelta,
            style: TextStyle(
              fontSize: 11,
              color: Color.fromRGBO(33, 150, 83, 1),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTeam(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            child: Icon(
              this.image,
              color: this.color,
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
                  '${this.name}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                this.showRateStatistic(context),
              ],
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: this.showFinalRating(),
        ),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

final List<String> rrTeamNames = [
  'Техасская',
  'Нью-Йоркская',
  'Северная',
  'Юго-западная',
  'Тихоокеанская',
  'Юго-восточная',
];

const RR_RATING_STAT_1 = 'пассажиры';
const RR_RATING_STAT_2 = 'кредиты';
const RR_RATING_STAT_3 = 'грузы';

Map<String, int?> rrRateChange = {
  RR_RATING_STAT_1: null,
  RR_RATING_STAT_2: null,
  RR_RATING_STAT_3: null,
};

final List<Color> rrTeamColors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.black,
];

////////////////////////////////////////////////////////////////////////////////

final List<String> prTeamNames = [
  'Республика',
  'Федерация',
  'Конфедерация',
];

const PR_RATING_STAT_1 = 'города';
const PR_RATING_STAT_2 = 'PR';
const PR_RATING_STAT_3 = 'ж/д';

Map<String, int?> prRateChange = {
  PR_RATING_STAT_1: null,
  PR_RATING_STAT_2: null,
  PR_RATING_STAT_3: null,
};

final List<Color> prTeamColors = [
  Colors.yellow,
  Colors.blue,
  Colors.red,
];

////////////////////////////////////////////////////////////////////////////////
final List<String> tkTeamNames = [
  'ТК Вашингтона',
  'ТК Прескотта',
  'ТК Литл-Рока',
  'ТК Бисмарка',
];

const TK_RATING_STAT_1 = 'грузопотоки';
const TK_RATING_STAT_2 = 'таможня';
const TK_RATING_STAT_3 = 'перевозки';

Map<String, int?> tkRateChange = {
  TK_RATING_STAT_1: null,
  TK_RATING_STAT_2: null,
  TK_RATING_STAT_3: null,
};

final List<Color> tkTeamColors = [
  Colors.yellow,
  Colors.purple,
  Colors.pink,
  Colors.green,
];

////////////////////////////////////////////////////////////////////////////////

List fractionsTeamIcons = [
  CustomIcons.road,
  CustomIcons.star,
  CustomIcons.pin,
];

class CustomIcons {
  CustomIcons._();

  static const _kFontFam = 'CustomIcons';
  static const String? _kFontPkg = null;

  static const IconData road =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData pin =
      IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData star =
      IconData(0xe80c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

List fractionTeamColors = [
  rrTeamColors,
  prTeamColors,
  tkTeamColors,
];

List fractionRateData = [
  rrRateChange,
  prRateChange,
  tkRateChange,
];

////////////////////////////////////////////////////////////////////////////////

const RR_FRACTION_ID = 0;
const PR_FRACTION_ID = 1;
const TK_FRACTION_ID = 2;

List fractionsTeamNames = [
  rrTeamNames,
  prTeamNames,
  tkTeamNames,
];

List<Team> rrFraction = [
  Team(fractionID: RR_FRACTION_ID, teamID: 0),
  Team(fractionID: RR_FRACTION_ID, teamID: 1),
  Team(fractionID: RR_FRACTION_ID, teamID: 2),
  Team(fractionID: RR_FRACTION_ID, teamID: 3),
  Team(fractionID: RR_FRACTION_ID, teamID: 4),
  Team(fractionID: RR_FRACTION_ID, teamID: 5),
];
List<Team> prFraction = [
  Team(fractionID: PR_FRACTION_ID, teamID: 0),
  Team(fractionID: PR_FRACTION_ID, teamID: 1),
  Team(fractionID: PR_FRACTION_ID, teamID: 2),
];
List<Team> tkFraction = [
  Team(fractionID: TK_FRACTION_ID, teamID: 0),
  Team(fractionID: TK_FRACTION_ID, teamID: 1),
  Team(fractionID: TK_FRACTION_ID, teamID: 2),
  Team(fractionID: TK_FRACTION_ID, teamID: 3),
];

////////////////////////////////////////////////////////////////////////////////

void sortTeams(List currentFraction, {bool reversed: false}) {
  currentFraction.sort((a, b) {
    return a.compareTo(b);
  });
  if (reversed) {
    currentFraction = currentFraction.reversed.toList();
  }
}

void updateRatingBy(GameRating gameRating) {
  rrFraction.forEach((team) {
    gameRating.railways.forEach((teamInfo) {
      if (team.name == teamInfo.teamName) {
        team.rateChange[RR_RATING_STAT_1] = teamInfo.ratingChange1;
        team.rateChange[RR_RATING_STAT_2] = teamInfo.ratingChange2;
        team.rateChange[RR_RATING_STAT_3] = teamInfo.ratingChange3;
        team.ratingDynamic = teamInfo.ratingChange1 +
          teamInfo.ratingChange2 +
          teamInfo.ratingChange3;
        team.rating = teamInfo.rating;
      }
    });
  });
  sortTeams(rrFraction);
  prFraction.forEach((team) {
    gameRating.policies.forEach((teamInfo) {
      if (team.name == teamInfo.teamName) {
        team.rateChange[PR_RATING_STAT_1] = teamInfo.ratingChange1;
        team.rateChange[PR_RATING_STAT_2] = teamInfo.ratingChange2;
        team.rateChange[PR_RATING_STAT_3] = teamInfo.ratingChange3;
        team.ratingDynamic = teamInfo.ratingChange1 +
          teamInfo.ratingChange2 +
          teamInfo.ratingChange3;
        team.rating = teamInfo.rating;
      }
    });
  });
  sortTeams(prFraction);
  tkFraction.forEach((team) {
    gameRating.tradingCompanies.forEach((teamInfo) {
      if (team.name == teamInfo.teamName) {
        team.rateChange[TK_RATING_STAT_1] = teamInfo.ratingChange1;
        team.rateChange[TK_RATING_STAT_2] = teamInfo.ratingChange2;
        team.rateChange[TK_RATING_STAT_3] = teamInfo.ratingChange3;
        team.ratingDynamic = teamInfo.ratingChange1 +
          teamInfo.ratingChange2 +
          teamInfo.ratingChange3;
        team.rating = teamInfo.rating;
      }
    });
  });
  sortTeams(tkFraction);
}
