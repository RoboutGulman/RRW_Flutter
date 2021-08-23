import 'package:mvc_pattern/mvc_pattern.dart';

import '../presentation/rating.dart';
import '../data/server.dart';
import '../presentation/post_rating.dart';

class RatingController extends ControllerMVC {

  final RateChangeRepository repo = RateChangeRepository();

  static late RatingController _this;

  factory RatingController() {
    initFractions();
    _this = RatingController._();
    return _this;
  }  

  RatingController._();

  List<String> get fractionNamesList => fractionNamesList;

  void updateRating() async {
    try {
      final GameRating gameRating = await repo.getGameRatingInfo();
      updateRatingBy(gameRating); //пришлось достать функцию из неработающего setState
      setState(() { //причём он опознаёт setState как функцию из import,
      //значит она должна как-то взаимодейcтвовать с MVC
        //не получается зайти в setState :(
        updateRatingBy(gameRating);
      });
    } catch (error) {
      setState(() {});
    }
  }

  static RatingController get controller => _this;

  int getTeamAmountOfFraction(Fraction fraction) {
    return fraction.teamNumber;
  }

  Fraction getFractionById(int fractionId) {
    return fraction[fractionId];
  }

}
