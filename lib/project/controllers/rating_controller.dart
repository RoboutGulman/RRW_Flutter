import 'package:mvc_pattern/mvc_pattern.dart';

import '../models/team.dart';
import '../data/server_repo.dart';
import '../models/post_rating.dart';

class RatingController extends ControllerMVC {

  static late RatingController _this;

  factory RatingController() {
    initFractions();
    _this = RatingController._();
    return _this;
  }

  static RatingController get controller => _this;

  RatingController._();

  List<String> get fractionNamesList => fractionNamesList;

  void Function() get initRating => initFractions;  

  final RateChangeRepository repo = RateChangeRepository();

  PostResult currentState = GameRatingResultLoading();

  void updateRating() async {
    try {
      final GameRating gameRating = await repo.getGameRatingInfo();
      updateRatingBy(gameRating); //пришлось достать функцию из неработающего setState
      setState(() { //причём он опознаёт setState как функцию из import,
      //значит она должна как-то взаимодейcтвовать с MVC
        //не получается зайти в setState :(
        currentState = GameRatingResultSuccess(gameRating);
        updateRatingBy(gameRating);
      });
    } catch (error) {
      setState(() {
        currentState = GameRatingResultFailure('$error');
      });
    }
  }

  int getTeamAmountOfFraction(Fraction fraction) {
    return fraction.teamNumber;
  }

  Fraction getFractionById(int fractionId) {
    return fraction[fractionId];
  }

}
