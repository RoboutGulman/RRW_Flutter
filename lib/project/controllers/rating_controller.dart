import 'package:mvc_pattern/mvc_pattern.dart';

import '../models/team.dart';
import '../data/server_repo.dart';
import '../models/post_rating.dart';

import '../../generated/l10n.dart';

class RatingController extends ControllerMVC {
  static late RatingController _this;
  static RatingController get controller => _this;

  factory RatingController() {
    _this = RatingController._();
    return _this;
  }

  RatingController._();

  final List<String> _fractionNamesList = [
    S.current.fractionName1,
    S.current.fractionName2,
    S.current.fractionName3,
  ];

  List<String> get fractionNamesList => _fractionNamesList;

  //TODO:
  //можно реализовать отображение первой фракции, той к которой
  //принадлежит игрок

  List<Team> _setCurrentFraction(int currentFractionID) {
    late List<Team> currentFraction;

    switch (currentFractionID) {
      case RR_FRACTION_ID:
        currentFraction = rrFraction;
        break;
      case PR_FRACTION_ID:
        currentFraction = prFraction;
        break;
      case TK_FRACTION_ID:
        currentFraction = tkFraction;
        break;
    }
    return currentFraction;
  }

  List<Team> Function(int currentFractionID) get setCurrentFraction => _setCurrentFraction;

  final RateChangeRepository repo = RateChangeRepository();

  PostResult currentState = GameRatingResultLoading();

  Future<void> _updateRating() async {
    try {
      final GameRating gameRating = await repo.getGameRatingInfo();
      setState(() {
        currentState = GameRatingResultSuccess(gameRating);
        updateRatingBy(gameRating);
      });
    } catch (error) {
      setState(() {
        currentState = GameRatingResultFailure('$error');
      });
    }
  }

  Future<void> Function() get updateRating => _updateRating;
}
