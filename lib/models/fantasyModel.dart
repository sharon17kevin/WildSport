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

  Player? pickAttribute(String title){
    final variableMap = {
      'keeper1': keeper1,
      'keeper2': keeper2,
      'defender1': defender1,
      'defender2': defender2,
      'defender3': defender3,
      'defender4': defender4,
      'defender5': defender5,
      'midfielder1': midfielder1,
      'midfielder2': midfielder2,
      'midfielder3': midfielder3,
      'midfielder4': midfielder4,
      'midfielder5': midfielder5,
      'attacker1': attacker1,
      'attacker2': attacker2,
      'attacker3': attacker3,
    };
    Player? playerSelect = variableMap['${title}'];
    if(playerSelect != null){
      return playerSelect;
    } else {
      return Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '');
    }
  }

  Map<Player, bool> checkIfContains(List<Player?> strings){
    Map<Player, bool> attributeChecker = {
      keeper1! : playerContain(strings, keeper1!),
      keeper2! : playerContain(strings, keeper2!),
      defender1! : playerContain(strings, defender1!),
      defender2! : playerContain(strings, defender2!),
      defender3! : playerContain(strings, defender3!),
      defender4! : playerContain(strings, defender4!),
      defender5! : playerContain(strings, defender5!),
      midfielder1! : playerContain(strings, midfielder1!),
      midfielder2! : playerContain(strings, midfielder2!),
      midfielder3! : playerContain(strings, midfielder3!),
      midfielder4! : playerContain(strings, midfielder4!),
      midfielder5! : playerContain(strings, midfielder5!),
      attacker1! : playerContain(strings, attacker1!),
      attacker2! : playerContain(strings, attacker2!),
      attacker3! : playerContain(strings, attacker3!),
    };
    return attributeChecker;
  }

  bool playerContain(List<Player?> players, Player newPlayer) {
    bool flag = players.any((element) => element?.uniqueKey == newPlayer.uniqueKey);
    return flag;
  }

  String? checkAttributeName(Player player) {
    Map<String?, Player> attributeChecker = {
      "keeper1": keeper1!,
      "keeper2": keeper2!,
      "defender1": defender1!,
      "defender2": defender2!,
      "defender3": defender3!,
      "defender4": defender4!,
      "defender5": defender5!,
      "midfielder1": midfielder1!,
      "midfielder2": midfielder2!,
      "midfielder3": midfielder3!,
      "midfielder4": midfielder4!,
      "midfielder5": midfielder5!,
      "attacker1": attacker1!,
      "attacker2": attacker2!,
      "attacker3": attacker3!
    };
    String? holder;
    attributeChecker.forEach((key, value) {
      if (value.uniqueKey == player.uniqueKey){
        holder = key;
      }
    });
    return holder;
  }

  Map<Player, bool> checkKeeper(List<Player?> strings) {
    Map<Player, bool> attributeChecker = {
      keeper1! : playerContain(strings, keeper1!),
      keeper2! : playerContain(strings, keeper2!),
    };
    return attributeChecker;
  }
}