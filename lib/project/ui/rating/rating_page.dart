import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../generated/l10n.dart';

import '../../presentation/rating_controller.dart';
import 'fraction_widget.dart';

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
    //RatingPage содержит State (расширял от StateMVC), и при обновлении setState он должен перестроится вместе с детьми,
    //его детей я расширял от Statless и может быть в этом проблема
    _con.updateRating();
    //в общем, главный вопрос: почему не срабатывает setState в методе контроллера??
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('update rating'),
        onPressed: () {
          //обновление рейтинга произойдёт при нажатии на кнопку
          setState(() {
            _con.updateRating();
          });
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
                  child: Text(_con.fractionNamesList[fractionIndex],
                      style: Theme.of(context).primaryTextTheme.headline2),
                ),
              ),
              FractionWidget(fractionId: fractionIndex),
            ],
          );
        },
        itemCount: _con.fractionNamesList.length,
      ),
    );
  }
}
