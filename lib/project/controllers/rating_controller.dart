import 'package:mvc_pattern/mvc_pattern.dart';

import '../models/team.dart';
import '../data/server_repo.dart';
import '../models/post_rating.dart';

class RatingController extends ControllerMVC {
  static late RatingController _this;
  static RatingController get controller => _this;

  factory RatingController() {
    _this = RatingController._();
    return _this;
  }

  RatingController._();

  final List<String> _fractionNamesList = [
    'ЖЕЛЕЗНЫЕ ДОРОГИ',
    'ПОЛИТИКИ',
    'ТОРГОВЫЕ КОМПАНИИ',
  ];

  List<String> get fractionNamesList => _fractionNamesList;

  //TODO:
  //можно реализовать отображение первой фракции, той к которой
  //принадлежит игрок

  List _setCurrentFraction(int currentFractionID) {
    late List currentFraction;

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

  get setCurrentFraction => _setCurrentFraction;

  final RateChangeRepository repo = RateChangeRepository();

  PostResult currentState = GameRatingResultLoading();

  Future _updateRating() async {
    try {
      final gameRating = await repo.getGameRatingInfo();
      setState(() {
        currentState = GameRatingResultSuccess(gameRating);
        updateRatingBy(gameRating);
      });
    } catch (error) {
      setState(() {
        currentState = GameRatingResultFailure('$error');
        print('error happend in updating rating $error');
      });
    }
  }

  get updateRating => _updateRating;
}
