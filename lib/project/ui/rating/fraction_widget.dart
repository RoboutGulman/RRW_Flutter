import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rrw_mvc_refac/project/presentation/rating_controller.dart';
import 'package:rrw_mvc_refac/project/domain/fraction.dart';
import 'team_widget.dart';

class FractionWidget extends StatelessWidget {
  final int fractionId;

  FractionWidget({required this.fractionId});

  final RatingController _con = RatingController.controller;

  @override
  Widget build(BuildContext context) {
    final Fraction currFraction = _con.getFractionById(fractionId);

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext _, int teamIndex) => TeamWidget(
        team: currFraction.teamList[teamIndex],
      ),
      separatorBuilder: (BuildContext _, int teamIndex) => Divider(
        height: 1.0,
        indent: Theme.of(context).dividerTheme.indent,
        endIndent: Theme.of(context).dividerTheme.endIndent,
        thickness: Theme.of(context).dividerTheme.thickness,
        color: Theme.of(context).dividerTheme.color,
      ),
      itemCount: currFraction.teamNumber,
    );
  }
}
