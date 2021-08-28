import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:rrw_mvc_refac/generated/l10n.dart';

import '../data/server.dart';
import '../domain/const.dart';
import '../domain/rating/fraction.dart';
import '../domain/rating/team.dart';

class TeamChooseController extends ControllerMVC {
  static late TeamChooseController _this;
  List<int> _availableTeam = [];
  List<Fraction> _fractionStorage = [];
  List<String> _fractionNameStorage = [];

  static TeamChooseController get controller => _this;
  List<String> get fractionNameStorage => _fractionNameStorage;
  List<Fraction> get fractionStorage => _fractionStorage;

  factory TeamChooseController() {
    _this = TeamChooseController._();
    return _this;
  }

  TeamChooseController._() {
    this._fractionStorage = _setDefaultAvailableFraction();

    this._fractionNameStorage = _setDefaultAvailableFractionName();

  }

  void generateAvailableTeam(int steps) async {
    try {
      _availableTeam =
          await AvailableTeamRepository.generateAvailableTeam(steps);
      print('TeamGlobalId list available: ');
      _availableTeam.forEach((element) {print(element);});
      print('List end');
    } catch (error) {
      print(error);
    }
  }

  void setAvailableTeam() {
    this._fractionStorage = _setDefaultAvailableFraction();
    generateAvailableTeam(4);

    print('Before setting: ');
    for (var i = 0; i < _fractionStorage.length; i++) {
      print('fractionStorage teamList length: ${this._fractionStorage[i].teamList.length}, ${this._fractionStorage[i].teamNumber}');
    }

      this._fractionStorage.forEach((Fraction fraction) { 
        fraction.teamList.removeWhere((Team team) => !_availableTeam.contains(team.id_global));
        fraction.teamNumber = fraction.teamList.length;
      });

    print('After setting: ');
    for (var i = 0; i < _fractionStorage.length; i++) {
      print('fractionStorage teamList length: ${this._fractionStorage[i].teamList.length}, ${this._fractionStorage[i].teamNumber}');      
    }

    //this.fractions.forEach((Fraction fraction) {
    //  print('length: ${fraction.teamList.length}');
    //});
  }

  List<Fraction> _setDefaultAvailableFraction() {
    List<Fraction> _fraction = <Fraction>[
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

    _initFractions(_fraction);

    return _fraction;
  }

  List<String> _setDefaultAvailableFractionName() {
    return [
      S.current.second_fractionName1,
      S.current.second_fractionName2,
      S.current.second_fractionName3,
    ];
  }

  void _initFractions(List<Fraction> fraction) {
    fraction.forEach((Fraction frac) {
      frac.initFraction();
    });    
  }

}
