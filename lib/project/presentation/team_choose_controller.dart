import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:rrw_mvc_refac/generated/l10n.dart';

import '../data/server.dart';
import '../domain/const.dart';
import '../domain/rating/fraction.dart';
import '../domain/rating/team.dart';

class TeamChooseController extends ControllerMVC {
  static late TeamChooseController _this;
  late List<int> _availableTeam = [];
  late List<Team> _teamStorage = [];

  static TeamChooseController get controller => _this;
  List<int> get availableTeamList => _availableTeam;
  List<Fraction> get fractions => _fractions;
  List<String> get fractionNamesList => _fractionNamesList;

  final List<Fraction> _fractions = <Fraction>[
    Fraction(
      name: S.current.second_fractionName1,
      id: RR_FRACTION_ID,
      maxTeamAmount: RR_TEAM_AMOUNT,
    ),
    Fraction(
      name: S.current.second_fractionName2,
      id: PR_FRACTION_ID,
      maxTeamAmount: PR_TEAM_AMOUNT,
    ),
    Fraction(
      name: S.current.second_fractionName3,
      id: TK_FRACTION_ID,
      maxTeamAmount: TK_TEAM_AMOUNT,
    ),
  ];

  List<String> _fractionNamesList = [
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
    _fractions.forEach((Fraction fraction) {
      _availableTeam.forEach((int availableTeamId) {
        fraction.teamList.removeWhere(
            (Team team) => !_availableTeam.contains(team.id_global));
        fraction.teamNumber = fraction.teamList.length;
      });
    });    

    _fractions.removeWhere((Fraction fraction) => fraction.teamNumber == 0);

    _fractionNamesList = [];
    fractions.forEach((Fraction fraction) {
      _fractionNamesList.add(fraction.name);
    });
    
    if (_availableTeam.isEmpty) {
      _fractions.clear();
      _fractionNamesList.clear();
    }
  }
}
