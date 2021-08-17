import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../generated/l10n.dart';

import '../../controllers/rating_controller.dart';
import '../../models/team.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPage createState() => _RatingPage();
}

class _RatingPage extends StateMVC<RatingPage> {

  _RatingPage() : super(RatingController()) {
    _ratingController = RatingController.controller;
  }

  late RatingController? _ratingController;

  @override
  void initState() {
    super.initState();
    _ratingController!.updateRating();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).tabName1,
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext _, int fractionIndex) {
          
          final List<Team> currentFraction =
              _ratingController!.setCurrentFraction(fractionIndex);

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12.0),
                color: Theme.of(context).unselectedWidgetColor,
                width: MediaQuery.of(context).size.width,
                height: 44,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _ratingController!.fractionNamesList[fractionIndex],
                    style: Theme.of(context).primaryTextTheme.headline2
                  ),
                ),
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int teamIndex) => Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                  height: 70,
                  child: currentFraction[teamIndex].buildTeam(context),
                ),
                separatorBuilder: (BuildContext _, int teamIndex) =>  Divider(
                    height: 1.0,
                    indent: Theme.of(context).dividerTheme.indent,
                    endIndent: Theme.of(context).dividerTheme.endIndent,
                    thickness: Theme.of(context).dividerTheme.thickness,
                    color: Theme.of(context).dividerTheme.color,                 
                  ),
                itemCount: currentFraction.length,
              ),
            ],
          );
        },
        itemCount: _ratingController!.fractionNamesList.length,
      ),
    );
  }
}