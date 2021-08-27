import 'package:mvc_pattern/mvc_pattern.dart';

import '../domain/const.dart';
import '../domain/rating/fraction.dart';
import '../domain/rating/post_rating.dart';
import '../data/server.dart';

import '/generated/l10n.dart';

class RatingController extends ControllerMVC {

  static late RatingController _this;

  final RateChangeRepository repo = RateChangeRepository();

  static RatingController get controller => _this;
  
  final List<Fraction> fractions = <Fraction>[
    Fraction(
      name: S.current.fractionName1,
      id: RR_FRACTION_ID,
      maxTeamAmount: RR_TEAM_AMOUNT,
    ),
    Fraction(
      name: S.current.fractionName2,
      id: PR_FRACTION_ID,
      maxTeamAmount: PR_TEAM_AMOUNT,
    ),
    Fraction(
      name: S.current.fractionName3,
      id: TK_FRACTION_ID,
      maxTeamAmount: TK_TEAM_AMOUNT,
    ),
  ];
  
  final List<String> fractionNamesList = [
    S.current.fractionName1,
    S.current.fractionName2,
    S.current.fractionName3,
  ];

  final List<String> second_fractionNamesList = [
    S.current.second_fractionName1,
    S.current.second_fractionName2,
    S.current.second_fractionName3,
  ];
  
  factory RatingController() {
    _this = RatingController._();
    return _this;
  }

  RatingController._() {
    _initFractions();
  }

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

  void _initFractions() {
    this.fractions.forEach((Fraction fraction) {
      fraction.initFraction();
    });
  }

  int getTeamAmountOfFraction(Fraction fraction) {
    return fraction.teamNumber;
  }

  Fraction getFractionById(int fractionId) {
    return this.fractions[fractionId];
  }

}
