import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rrw_mvc_refac/generated/l10n.dart';
import 'package:rrw_mvc_refac/project/domain/const.dart';
import 'package:rrw_mvc_refac/project/domain/rating/team.dart';

class TeamWidget extends StatelessWidget {
  final Team team;

  const TeamWidget({required this.team});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildIcon(),
          _buildName(context),
          _buildRating(context),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      child: Container(
        alignment: Alignment.center,
        child: Icon(
          _FractionIcon()._getTeamIcon(team.fractionId),
          color: _TeamColor()._getColor(team.id),
        ),
      ),
    );
  }

  //TODO:
  //название виджета не соответствует тому, что он отстраивает
  Widget _buildName(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 8,
      child: Container(
        height: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              team.name,
              style: Theme.of(context).primaryTextTheme.subtitle2,
            ),
            _buildRateStatistics(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRateStatistics(BuildContext context) {
    final List<String> rateChangeElements = _getFormatedStatsOfTeam();

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
      ),
    );
  }

  Widget _buildRating(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            '${team.rating}',
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
          Container(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              '${_getFormatedRatingDynamic(team)}',
              style: Theme.of(context).primaryTextTheme.headline3,
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getFormatedStatsOfTeam() {
    String statsAnswerAll = '';

    List<String> statsAnswers = <String>['', '', ''];
    var statsDescrp = _StatisticDescription()._getStatsDescrp(team.fractionId);

    team.stats.forEach((value) {
      if (value >= 0) {
        statsAnswerAll += '+$value:';
      } else {
        statsAnswerAll += '$value:';
      }
    });

    statsAnswers = statsAnswerAll.split(':');
    statsAnswers.removeLast();

    for (var i = 0; i < statsAnswers.length; i++) {
      statsAnswers[i] += ' ${statsDescrp[i]}';
    }

    return statsAnswers;
  }

  String _getFormatedRatingDynamic(Team team) {
    int sumOfStats = 0;

    team.stats.forEach((stat) {
      sumOfStats += stat;
    });

    if (sumOfStats >= 0) {
      return '+$sumOfStats';
    } else {
      return '$sumOfStats';
    }
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

  List<String> _getStatsDescrp(int fractionId) {
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

  Color _getColor(int teamId) {
    return this.teamColor[teamId];
  }
}

class TeamIcons {
  TeamIcons._();

  static const String _fontFam = 'CustomIcons';

  static const IconData road = IconData(0xe804, fontFamily: _fontFam);
  static const IconData pin = IconData(0xe808, fontFamily: _fontFam);
  static const IconData star = IconData(0xe80c, fontFamily: _fontFam);
}

class _FractionIcon {
  List<IconData> fractionsTeamIcons = <IconData>[
    TeamIcons.road,
    TeamIcons.star,
    TeamIcons.pin,
  ];

  _FractionIcon();

  IconData _getTeamIcon(int fractionId) {
    return fractionsTeamIcons[fractionId];
  }
}
