import 'package:get/get.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:wild_sport/models/userModel.dart';

class Fantasy {
  Player? keeper1;
  Player? keeper2;
  Player? defender1;
  Player? defender2;
  Player? defender3;
  Player? defender4;
  Player? defender5;
  Player? midfielder1;
  Player? midfielder2;
  Player? midfielder3;
  Player? midfielder4;
  Player? midfielder5;
  Player? attacker1;
  Player? attacker2;
  Player? attacker3;

  Fantasy({
    this.keeper1,
    this.keeper2,
    this.defender1,
    this.defender2,
    this.defender3,
    this.defender4,
    this.defender5,
    this.midfielder1,
    this.midfielder2,
    this.midfielder3,
    this.midfielder4,
    this.midfielder5,
    this.attacker1,
    this.attacker2,
    this.attacker3,
  });

  void setVariable(String variableName, Player value) {
    final variableMap = {
      'keeper1': () => keeper1 = value,
      'keeper2': () => keeper2 = value,
      'defender1': () => defender1 = value,
      'defender2': () => defender2 = value,
      'defender3': () => defender3 = value,
      'defender4': () => defender4 = value,
      'defender5': () => defender5 = value,
      'midfielder1': () => midfielder1 = value,
      'midfielder2': () => midfielder2 = value,
      'midfielder3': () => midfielder3 = value,
      'midfielder4': () => midfielder4 = value,
      'midfielder5': () => midfielder5 = value,
      'attacker1': () => attacker1 = value,
      'attacker2': () => attacker2 = value,
      'attacker3': () => attacker3 = value,
    };
    
    final setterFunction = variableMap[variableName];
    if (setterFunction != null) {
      setterFunction();
    }

  }

  // void satFantasy() {
  //   List<Player> players = _teamController.getPlayers;
  //
  //   factory Fantasy.fromJson(List<Team> team) => Fantasy(
  //
  //     keeper1: team.firstWhere((element) => element.title == 'keeper1').id,
  //     title: json["title"],
  //   );
  // }
}