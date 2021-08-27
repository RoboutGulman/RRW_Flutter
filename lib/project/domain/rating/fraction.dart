import '../const.dart';
import 'team.dart';
import '../../presentation/rating_controller.dart';

import 'post_rating.dart';

class Fraction {
  final String name;
  final int id;
  final int maxTeamAmount;
  int teamNumber = 0;
  List<Team> teamList = <Team>[];

  Fraction({required this.name, required this.id, required this.maxTeamAmount});

  void initFraction() {
    for (var i = 0; i < this.maxTeamAmount; i++) {
      this.addTeam();
    }
  }

  void addTeam() {
    this.teamList.add(Team(
          fractionId: this.id,
          id: this.teamNumber,
        ));
    this.teamNumber = this.teamList.length;
  }

  void removeTeam(int teamId) {
    this.teamList.forEach((team) {
      if (team.id == teamId) {
        this.teamList.remove(team);
      }
    });
    this.teamNumber = this.teamList.length;
  }

  int getMaxTeamAmountOfThisFraction(int fractionId) {
    switch (fractionId) {
      case RR_FRACTION_ID:
        return RR_TEAM_AMOUNT;
      case PR_FRACTION_ID:
        return PR_TEAM_AMOUNT;
      case TK_FRACTION_ID:
        return TK_TEAM_AMOUNT;
      default:
        return -1;
    }
  }

  void sortTeams({bool reversed = false}) {
    this.teamList.sort((Team a, Team b) {
      return a.compareTo(b);
    });

    if (reversed) {
      this.teamList = this.teamList.reversed.toList();
    }
  }
}

void updateRatingBy(GameRating gameRating) {
  RatingController _con = RatingController.controller;
  //TODO:
  //в TeamInfo с сервера должны приходить id команды (опционально цвет команды)
  //сейчас приходит имя команды строкой - неудобно???
  //поэтому ввёл эту переменную
  int updatedTeamAmount = 0; //as teamId, both means same

  _con.fractions.forEach((Fraction fraction) {
    List<TeamInfo> fractionRating = gameRating.getFractionInfoBy(fraction.id);

    fraction.teamList.forEach((Team team) {
      fractionRating.forEach((TeamInfo teamInfo) {
        if (team.id == updatedTeamAmount) {
          List<int> statsInfo = teamInfo.getStatsInfo();

          for (var i = 0; i < team.stats.length; i++) {
            team.stats[i] = statsInfo[i];
          }

          team.ratingDynamic = teamInfo.ratingChange1 +
              teamInfo.ratingChange2 +
              teamInfo.ratingChange3;

          team.rating = teamInfo.rating;

          updatedTeamAmount++;
        }
      });
    });
    fraction.sortTeams();
    updatedTeamAmount = 0;
  });
}