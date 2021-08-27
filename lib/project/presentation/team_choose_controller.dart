import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:rrw_mvc_refac/generated/l10n.dart';

import '../data/server.dart';
import '../domain/const.dart';
import '../domain/rating/fraction.dart';
import '../domain/rating/team.dart';

class TeamChooseController extends ControllerMVC {
  static late TeamChooseController _this;
  late List<int> _availableTeam = [];

  static TeamChooseController get controller => _this;
  List<int> get availableTeamList => _availableTeam;

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
    S.current.second_fractionName1,
    S.current.second_fractionName2,
    S.current.second_fractionName3,
  ];

  factory TeamChooseController() {
    _this = TeamChooseController._();
    return _this;
  }

  TeamChooseController._() {
    _initFractions();
  }

  void _initFractions() {
    this.fractions.forEach((Fraction fraction) {
      fraction.initFraction();
    });
  }

  generateAvailableTeam(int steps) async {
    try {
      _availableTeam =
          await AvailableTeamRepository.generateAvailableTeam(steps);
    } catch (error) {
      print(error);
    }
  }

  removeUnavailableTeam() {
    fractions.forEach((Fraction fraction) {
      _availableTeam.forEach((int availableTeamId) {
        fraction.teamList.removeWhere(
            (Team team) => !_availableTeam.contains(team.id_global));
      });
    });
  }
}
