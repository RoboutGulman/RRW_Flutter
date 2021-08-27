import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '/generated/l10n.dart';

import '../../presentation/rating_controller.dart';

class TeamChoose extends StatefulWidget {
  const TeamChoose({Key? key}) : super(key: key);

  @override
  _TeamChooseState createState() => _TeamChooseState();
}

class _TeamChooseState extends StateMVC<TeamChoose> {
  final RatingController _con = RatingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'S.of(context).team_choose_page',
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext _, int fractionIndex) {
          List<bool> _isSelected = List.generate(
            _con.fractions[fractionIndex].teamList.length,
            (index) => false
          );

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12.0),
                color: Theme.of(context).unselectedWidgetColor,
                width: MediaQuery.of(context).size.width,
                height: 44,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(_con.fractionNamesList[fractionIndex],
                      style: Theme.of(context).primaryTextTheme.headline5),
                ),
              ),
              ToggleButtons(
                children: <Widget>[

                ],
                isSelected: _isSelected,
              ),
            ],
          );
        },
        itemCount: _con.fractionNamesList.length,
      ),
    );
  }
}
