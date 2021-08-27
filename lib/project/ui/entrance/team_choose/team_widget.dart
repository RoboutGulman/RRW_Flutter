import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rrw_mvc_refac/project/domain/rating/team.dart';

class TeamWidget extends StatelessWidget {
  final Team team;

  const TeamWidget({required this.team});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildIcon(),
          _buildName(context),
          _buildArrow(context),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Center(
        child: Icon(
          _FractionIcon()._getTeamIcon(team.fractionId),
          color: _TeamColor()._getColor(team.id),
        ),
      ),
    );
  }

  Widget _buildName(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 10,
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          team.name,
          style: Theme.of(context).primaryTextTheme.subtitle2,
        ),
      ),
    );
  }

  Widget _buildArrow(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Container(
        child: Center(
          child: Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: Theme.of(context).unselectedWidgetColor,
          ),
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
