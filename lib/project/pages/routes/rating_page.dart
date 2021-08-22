import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../generated/l10n.dart';

import '../../controllers/rating_controller.dart';
import '../../models/team.dart';

class RatingPage extends StatefulWidget {
  @override
  StateMVC<RatingPage> createState() => _RatingPage();
}

class _RatingPage extends StateMVC<RatingPage> {

  final RatingController _con = RatingController();

  @override
  void initState() {
    //хочется, чтобы рейтинг подгружался единожды при постройке виджета
    super.initState();
    //но в _con.updateRating(); не срабатывает метод setState, просто отказывается входить в него
    //может быть проблема в том, как я построил RatingPage:
    //RatingPage содержит State, и при обновлении setState он должен перестроится вместе с детьми,
    //его детей я расширял от Statless и моет быть в этом проблема
    _con.updateRating();
    //в общем, главный вопрос: почему не срабатывает setState в методе контроллера??
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('update rating'),
        onPressed: () { //обновление рейтинга произойдёт при нажатии на кнопку
          setState(() {_con.updateRating();});
                         
        },
      ),
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
                    fractionNamesList[fractionIndex],
                    style: Theme.of(context).primaryTextTheme.headline2
                  ),
                ),
              ),
              FractionWidget(fractionId: fractionIndex),
            ],
          );
        },
        itemCount: fractionNamesList.length
      ),
    );
  }
}

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
      itemBuilder: (BuildContext context, int teamIndex) => TeamWidget(team: currFraction.teamList[teamIndex],),
      separatorBuilder: (BuildContext _, int teamIndex) =>  Divider(
          height: 1.0,
          indent: Theme.of(context).dividerTheme.indent,
          endIndent: Theme.of(context).dividerTheme.endIndent,
          thickness: Theme.of(context).dividerTheme.thickness,
          color: Theme.of(context).dividerTheme.color,                 
        ),
      itemCount: currFraction.teamNumber
    );
  }
}

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
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Icon(
                team.image,
                color: team.color,
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
                    team.name,
                    style: Theme.of(context).primaryTextTheme.subtitle2,
                  ),
                  showRateStatistic(context, team),
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: showFinalRating(context, team),
          ),
        ],
      ),
    );
  }
}

Widget showRateStatistic(BuildContext context, Team team) {
  final List<String> rateChangeElements = team.getFormatedStatsOfTeam();

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

Widget showFinalRating(BuildContext context, Team team) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      Text(
        '${team.rating}',
        style: Theme.of(context).primaryTextTheme.headline4,
      ),
      Container(
        padding: const EdgeInsets.only(top: 3),
        child: Text(
          '${team.getFormatedRatingDynamic()}',
          style: Theme.of(context).primaryTextTheme.headline3,
        ),
      ),
    ],
  );
}