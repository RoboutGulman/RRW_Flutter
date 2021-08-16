import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../controllers/rating_controller.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPage createState() => _RatingPage();
}

class _RatingPage extends StateMVC {
  static const String _title = 'Рейтинг';

  RatingController? _ratingController;

  _RatingPage() : super(RatingController()) {
    _ratingController = RatingController.controller;
  }

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
          _title,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (buildContext, fractionIndex) {
          
          List currentFraction =
              _ratingController!.setCurrentFraction(fractionIndex);

          return Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 12.0),
                color: Color.fromRGBO(60, 60, 67, 0.18),
                width: MediaQuery.of(context).size.width,
                height: 44,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${_ratingController!.fractionNamesList[fractionIndex]}',
                    style: TextStyle(
                      color: Color.fromRGBO(142, 142, 147, 1),
                      fontSize: 13,
                      letterSpacing: -0.08,
                    ),
                  ),
                ),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, teamIndex) => Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                  height: 70,
                  child: currentFraction[teamIndex].buildTeam(context),
                ),
                separatorBuilder: (context, teamIndex) => Divider(
                    height: 1.0,
                    indent: 16.0,
                    endIndent: 16.0,
                    thickness: 0.5,
                    color: Color.fromRGBO(198, 198, 200, 1),                 
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