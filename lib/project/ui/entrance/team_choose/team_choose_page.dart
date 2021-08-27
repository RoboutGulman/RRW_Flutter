import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '/generated/l10n.dart';

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
  bool _isRemoved = false;

  @override
  void initState() {
    super.initState();
    //получаем "список" доступных команд
    //будет доступно столько же, сколько передано в параметре
    setState(() {_con.generateAvailableTeam(8);});
    //странно, вроде страничка вышла проще по вложенности виджетов состояния,
    //но метод setState все равно не доступен при вызове из контроллера
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
              _con.fractions[fractionIndex].teamList.length, (index) => false);

          return Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 12.0),
                height: _teamButtonHeight,
                color: Theme.of(context).primaryColorLight,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(_con.fractionNamesList[fractionIndex],
                      style: Theme.of(context).primaryTextTheme.headline2),
                ),
              ),
              Container(
                height: _teamButtonHeight *
                    _con.fractions[fractionIndex].teamList.length,
                child: LayoutBuilder(builder: (context, constraints) {
                  return ToggleButtons(
                    children: _ClickableTeamList(fractionIndex),
                    isSelected: _isSelected,
                    onPressed: (int selectedIndex) { //здесь можно ловить выбор пользователя

                      if (!_isRemoved) { //пока что убираем единожды
                        setState(() {_con.removeUnavailableTeam();});
                        _isRemoved = !_isRemoved;
                      } //можно убирать сразу по нажатию на команду

                      for (var index = 0; index < _isSelected.length; index++) {
                        //логирую, какая команда была "выбрана"
                        //и ещё переключаю элементы важного списка
                        if (index == selectedIndex) {
                          _isSelected[selectedIndex] = true;
                          print('''Selected: 
                            ${_con.fractions[fractionIndex].teamList[selectedIndex].name},
                            id: ${_con.fractions[fractionIndex].teamList[selectedIndex].id_global}
                          ''');
                        } else {
                          _isSelected[selectedIndex] = false;
                        }
                      }
                    },
                    constraints: BoxConstraints.expand(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight /
                          _con.fractions[fractionIndex].teamList.length,
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
        itemCount: _con.fractionNamesList.length,
      ),
    );
  }

  List<Widget> _ClickableTeamList(int fractionId) {
    List<Team> teams = _con.fractions[fractionId].teamList;

    List<Widget> teamList = [];
    teams.forEach((team) {
      teamList.add(TeamWidget(team: team));
    });

    return teamList;
  }
}
