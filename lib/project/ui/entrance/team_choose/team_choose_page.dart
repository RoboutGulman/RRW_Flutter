import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '/generated/l10n.dart';

import '../../../domain/rating/fraction.dart';
import '../../../domain/rating/team.dart';
import '../../../presentation/team_choose_controller.dart';
import 'team_widget.dart';

class TeamChoose extends StatefulWidget {
  const TeamChoose({Key? key}) : super(key: key);

  @override
  _TeamChooseState createState() => _TeamChooseState();
}

class _TeamChooseState extends StateMVC<TeamChoose> {
  final TeamChooseController _con = TeamChooseController();

  final double _teamButtonHeight = 45;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).team_choose_page,
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext _, int fractionIndex) {
          List<bool> _isSelected = List.generate(
              _con.fractionStorage[fractionIndex].teamNumber, (index) => false);

          return Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 12.0),
                height: _teamButtonHeight,
                color: Theme.of(context).primaryColorLight,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(_con.fractionNameStorage[fractionIndex],
                      style: Theme.of(context).primaryTextTheme.headline2),
                ),
              ),
              Container(
                height: _teamButtonHeight *
                    _con.fractionStorage[fractionIndex].teamNumber,
                child: LayoutBuilder(builder: (context, constraints) {
                  return ToggleButtons(
                    children: _clickableTeamList(fractionIndex),
                    isSelected: _isSelected,
                    onPressed: (int selectedIndex) { //здесь можно ловить выбор пользователя

                      for (var index = 0; index < _isSelected.length; index++) {
                        if (index == selectedIndex) {
                          _isSelected[selectedIndex] = true;
                        } else {
                          _isSelected[selectedIndex] = false;
                        }
                      }

                      setState(() {
                        //получаем список команд при нажатии
                        //и обновляем хранилища фракций
                        _con.generateAvailableTeam(5);
                        _con.setAvailableTeam();
                      });

                    },
                    constraints: BoxConstraints.expand(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight /
                          _con.fractionStorage[fractionIndex].teamNumber,
                    ),
                    renderBorder: true,
                    disabledBorderColor: Theme.of(context).primaryColorLight,
                    borderWidth: 0,
                    direction: Axis.vertical,
                  );
                }),
              ),
            ],
          );
        },
        itemCount: _con.fractionNameStorage.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_arrow_right_outlined),
        onPressed: () {
          print('next');
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  List<Widget> _clickableTeamList(int fractionId) {
    late List<Team> teams;

    _con.fractionStorage.forEach((Fraction fraction) {
      if (fraction.id == fractionId) {
        teams = fraction.teamList;        
      }
    });

    List<Widget> teamList = [];
    teams.forEach((team) {
      teamList.add(TeamWidget(team: team));
    });

    return teamList;
  }
}
