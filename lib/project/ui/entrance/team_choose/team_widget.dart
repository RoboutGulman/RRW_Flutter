import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          buildIcon(),
          Text(team.name),
        ],
      ),
    );
  }

  Widget buildIcon() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      child: Container(
        alignment: Alignment.center,
        child: Icon(
          _FractionIcon().getTeamIcon(team.fractionId),
          color: _TeamColor().getColor(team.id),
        ),
      ),
    );
  }

  Widget buildName(BuildContext context) {
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
          ],
        ),
      ),
    );
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

  Color getColor(int teamId) {
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

  IconData getTeamIcon(int fractionId) {
    return fractionsTeamIcons[fractionId];
  }
}
