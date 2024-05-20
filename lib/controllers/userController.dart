import 'dart:convert';

import 'package:get/get.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/functions/deadlineFunctions.dart';
import 'package:wild_sport/functions/leagueFunctions.dart';
import 'package:wild_sport/functions/pointGameWeekFunctions.dart';
import 'package:wild_sport/functions/secureStorage.dart';
import 'package:wild_sport/functions/userFunctions.dart';
import 'package:wild_sport/models/deadlineModel.dart';
import 'package:wild_sport/models/fantasyModel.dart';
import 'package:wild_sport/models/getHighestGameweekModel.dart';
import 'package:wild_sport/models/leagueModel.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:wild_sport/models/pointGameWeekModel.dart';
import 'package:wild_sport/models/userModel.dart';

class UserController extends GetxController {
  var error = ''.obs;
  var deleteError = ''.obs;
  var signUpError = ''.obs;
  var deadlines = <Deadline>[].obs;
  var viableGameweeks = <int>[].obs;
  var _user = User(id: "", name: "", email: "").obs;
  RxBool isadmin = false.obs;
  var _fantasy = new Fantasy().obs;
  var _freeHitFantasy = new Fantasy().obs;
  String pather = '172.20.10.4:3000';
  var _pickedTeam = <String, dynamic>{}.obs;
  var _freehitPickedTeam = <String, dynamic>{}.obs;
  var substitutes = <Player?>[].obs;
  Rx<Player?> keeperSub = Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '').obs;
  var viceCaptain = 'e'.obs;
  var captain = 'e'.obs;
  var isFirst = true.obs;
  var toBeSubbed = <String, dynamic>{}.obs;
  var subbing = false.obs;
  var bankToAdd = 0.obs;
  var pickTeamUpdating = false.obs;
  var isPreviousUser = false.obs;

  var toUpdate = ''.obs;
  var leagues = <League>[].obs;
  var pointGameweeks = <PointGameWeek>[].obs;

  //Management Section--------------------------------------->
  var leagueUsers = <User>[].obs;
  var getMaxGameweek = <GetHighestGameweek>[].obs;
  Rx<League> leagueUpdating = League(name: 'None', players: [], entryCode: '', id: '', v: 0).obs;
  var password1 = "".obs;
  var password2 = "".obs;

  //Transfer Page-------------------------------------------->
  var xOffset = 0.0.obs;
  var yOffset = 0.0.obs;
  var scaleFactor = 1.0.obs;
  var isDrawerOpen = false.obs;

  String get myToUpdate => toUpdate.value;

  User get myUser => _user.value;

  Fantasy get myFantasyTeam{
    int number = viableGameweeks.value.length;
    PointGameWeek pgw = pointGameweeks.firstWhere((element) => element.number == number + 1);
    return pgw.freeHit == false? _fantasy.value : _freeHitFantasy.value;
  }

  Map<String, dynamic> get myPickedTeam{
    int number = viableGameweeks.value.length;
    PointGameWeek pgw = pointGameweeks.firstWhere((element) => element.number == number + 1);
    return pgw.freeHit == false? _pickedTeam.value : _freehitPickedTeam.value;
  }

  void updateCaptain(String id) {
    if(id == '') return;
    captain.value = id;
  }

  void updateViceCaptain(String id) {
    if(id == '') return;
    viceCaptain.value = id;
  }

  var genFantasyFlag = false.obs;
  Future<void> generateFantasy () async {
    TeamController _teamController = Get.find<TeamController>();
    List<Player> players = _teamController.getPlayers;
    FantasyTeam defaultFantasyTeam = FantasyTeam(player: '', title: '');
    Player defaultPlayer = Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '');
    Fantasy fantasy = Fantasy(
      keeper1: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'keeper1', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
      keeper2: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'keeper2', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
      defender1: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'defender1', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
      defender2: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'defender2', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
      defender3: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'defender3', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
      defender4: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'defender4', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
      defender5: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'defender5', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
      midfielder1: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'midfielder1', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
      midfielder2: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'midfielder2', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
      midfielder3: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'midfielder3', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
      midfielder4: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'midfielder4', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
      midfielder5: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'midfielder5', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
      attacker1: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'attacker1', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
      attacker2: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'attacker2', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
      attacker3: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'attacker3', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
    );
    Fantasy freeHitFantasy;
    if (_user.value.freeHit == 0) {
      freeHitFantasy = Fantasy(
        keeper1: players.firstWhere((element) => element.id == _user.value.freeHitTeam?.firstWhere((element) => element.title == 'keeper1', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
        keeper2: players.firstWhere((element) => element.id == _user.value.freeHitTeam?.firstWhere((element) => element.title == 'keeper2', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
        defender1: players.firstWhere((element) => element.id == _user.value.freeHitTeam?.firstWhere((element) => element.title == 'defender1', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
        defender2: players.firstWhere((element) => element.id == _user.value.freeHitTeam?.firstWhere((element) => element.title == 'defender2', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
        defender3: players.firstWhere((element) => element.id == _user.value.freeHitTeam?.firstWhere((element) => element.title == 'defender3', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
        defender4: players.firstWhere((element) => element.id == _user.value.freeHitTeam?.firstWhere((element) => element.title == 'defender4', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
        defender5: players.firstWhere((element) => element.id == _user.value.freeHitTeam?.firstWhere((element) => element.title == 'defender5', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
        midfielder1: players.firstWhere((element) => element.id == _user.value.freeHitTeam?.firstWhere((element) => element.title == 'midfielder1', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
        midfielder2: players.firstWhere((element) => element.id == _user.value.freeHitTeam?.firstWhere((element) => element.title == 'midfielder2', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
        midfielder3: players.firstWhere((element) => element.id == _user.value.freeHitTeam?.firstWhere((element) => element.title == 'midfielder3', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
        midfielder4: players.firstWhere((element) => element.id == _user.value.freeHitTeam?.firstWhere((element) => element.title == 'midfielder4', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
        midfielder5: players.firstWhere((element) => element.id == _user.value.freeHitTeam?.firstWhere((element) => element.title == 'midfielder5', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
        attacker1: players.firstWhere((element) => element.id == _user.value.freeHitTeam?.firstWhere((element) => element.title == 'attacker1', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
        attacker2: players.firstWhere((element) => element.id == _user.value.freeHitTeam?.firstWhere((element) => element.title == 'attacker2', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
        attacker3: players.firstWhere((element) => element.id == _user.value.freeHitTeam?.firstWhere((element) => element.title == 'attacker3', orElse: () => defaultFantasyTeam).player, orElse: ()=> Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '')),
      );
      _freeHitFantasy.value = freeHitFantasy;
    }
    _fantasy.value = fantasy;
    Map<String, dynamic> pickedTeam = {
      'keeper': _user.value.keeper != null? _fantasy.value.pickAttribute(_user.value.keeper!) : _fantasy.value.pickAttribute('keeper1'),
      'defender': _user.value.defender?.length == 0? [_fantasy.value.pickAttribute('defender1'), _fantasy.value.pickAttribute('defender2'), _fantasy.value.pickAttribute('defender3'), _fantasy.value.pickAttribute('defender4')] : _user.value.defender?.map((e) => _fantasy.value.pickAttribute('$e')).toList(),
      'midfielder': _user.value.midfielder?.length == 0? [_fantasy.value.pickAttribute('midfielder1'), _fantasy.value.pickAttribute('midfielder2'), _fantasy.value.pickAttribute('midfielder3'), _fantasy.value.pickAttribute('midfielder4')] :  _user.value.midfielder?.map((e) => _fantasy.value.pickAttribute('$e')).toList(),
      'attacker': _user.value.attacker?.length == 0? [_fantasy.value.pickAttribute('attacker1'), _fantasy.value.pickAttribute('attacker2')] :  _user.value.attacker?.map((e) => _fantasy.value.pickAttribute('$e')).toList()
    };
    _pickedTeam.value = pickedTeam;
    Map<String, dynamic> freeHitPickedTeam = {
      'keeper': _user.value.freeHitKeeper != null? _freeHitFantasy.value.pickAttribute(_user.value.freeHitKeeper!) : _freeHitFantasy.value.pickAttribute('keeper1'),
      'defender': _user.value.freeHitDefender?.length == 0? [_freeHitFantasy.value.pickAttribute('defender1'), _freeHitFantasy.value.pickAttribute('defender2'), _freeHitFantasy.value.pickAttribute('defender3'), _freeHitFantasy.value.pickAttribute('defender4')] : _user.value.freeHitDefender?.map((e) => _freeHitFantasy.value.pickAttribute('$e')).toList(),
      'midfielder': _user.value.freeHitMidfielder?.length == 0? [_freeHitFantasy.value.pickAttribute('midfielder1'), _freeHitFantasy.value.pickAttribute('midfielder2'), _freeHitFantasy.value.pickAttribute('midfielder3'), _freeHitFantasy.value.pickAttribute('midfielder4')] :  _user.value.freeHitMidfielder?.map((e) => _freeHitFantasy.value.pickAttribute('$e')).toList(),
      'attacker': _user.value.freeHitAttacker?.length == 0? [_freeHitFantasy.value.pickAttribute('attacker1'), _freeHitFantasy.value.pickAttribute('attacker2')] :  _user.value.freeHitAttacker?.map((e) => _freeHitFantasy.value.pickAttribute('$e')).toList()
    };
    _freehitPickedTeam.value = freeHitPickedTeam;
    //============================================================regular subs ======================>
    List<Player?> stringList = pickedTeam.values.fold(
      [],
      (list, element){
        if (element is Player?) {
          list.add(element);
        } else if (element is List<Player?>) {
          list.addAll(element);
        }
        return list;
      }
    );
    Map<Player, bool> subs = _fantasy.value.checkIfContains(stringList);
    Map<Player, bool> keeperSubs = _fantasy.value.checkKeeper(stringList);
    List<Player> holder = [];
    Player? keeperHolder;
    subs.forEach((key, value) {
      if (value == false) {
        holder.add(key);
      }
    });
    keeperSubs.forEach((key, value) {
      if (value == false){
        keeperHolder = key;
      }
    });
    holder.remove(keeperHolder);
    substitutes.value = holder;
    keeperSub.value = keeperHolder;
    //======================================freeHit Subs==============================>
    List<Player?> stringHitList = freeHitPickedTeam.values.fold(
        [],
            (list, element){
          if (element is Player?) {
            list.add(element);
          } else if (element is List<Player?>) {
            list.addAll(element);
          }
          return list;
        }
    );
    Map<Player, bool> freehitSubs = _fantasy.value.checkIfContains(stringHitList);
    Map<Player, bool> freehitKeeperSubs = _fantasy.value.checkKeeper(stringHitList);
    List<Player> freehitHolder = [];
    Player? freehitKeeperHolder;
    freehitSubs.forEach((key, value) {
      if (value == false) {
        freehitHolder.add(key);
      }
    });
    freehitKeeperSubs.forEach((key, value) {
      if (value == false){
        freehitKeeperHolder = key;
      }
    });
    freehitHolder.remove(freehitKeeperHolder);
    substitutes.value = holder;
    keeperSub.value = keeperHolder;
    print('Here we go fantasy');
  }

  void updateUser(User newUser) {
    _user.value = newUser;
  }

  void switchKeeper() {
    // ignore: invalid_use_of_protected_member
    Player holder = _pickedTeam.value['keeper'];
    // ignore: invalid_use_of_protected_member
    _pickedTeam.value['keeper'] = keeperSub.value;
    keeperSub.value = holder;
    _pickedTeam.refresh();
  }

  Future<void> updateBank(User newUser) async {
    try{
      var response = await bankUpdate('http://$pather/api/users/bank', newUser);
      print("bank ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  void updateFantasy(Player player, String position) {
    int number = viableGameweeks.value.length;
    PointGameWeek pgw = pointGameweeks.firstWhere((element) => element.number == number + 1);
    if (pgw.freeHit == false) {
      Fantasy fantasy = _fantasy.value;
      fantasy.setVariable(position, player);
      _fantasy.value = fantasy;
    } else {
      Fantasy fantasy = _freeHitFantasy.value;
      fantasy.setVariable(position, player);
      _freeHitFantasy.value = fantasy;
    }
  }

  int calcCost() {
    if (_user.value.freeTransfer! == 0) {
      int cost = _user.value.cost! + 4;
      return cost;
    } else if (_user.value.freeTransfer! == -1){
      return 0;
    } else {
      return 0;
    }
  }

  void updateTransferValues() async{
    if (_user.value.freeTransfer! == 0) {
      _user.value.cost = _user.value.cost! + 4;
    } else if (_user.value.freeTransfer! > 0) {
      _user.value.freeTransfer = _user.value.freeTransfer! - 1;
      _user.value.cost = 0;
    } else {
      _user.value.cost = 0;
    }
    await updateFantasyData(_user.value);
  }

  Future<void> updateFantasyData(User newUser) async {
    try{
      await setFantasyData('http://$pather/api/users/fantasyAttributes', newUser);
      var response = await getMe('http://$pather/api/users/me', newUser);
      User user = userFromJson(response);
      updateUser(user);
      print("fantasy data ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  void updateToUpdate(String position) {
    toUpdate.value = position;
    print('youre good to go');
  }

  void subOff(Map<String, dynamic> map) {
    toBeSubbed.value = map;
    subbing.value = true;
  }

  void subOn(Map<String, dynamic> map) {
    int number = viableGameweeks.value.length;
    PointGameWeek pgw = pointGameweeks.firstWhere((element) => element.number == number + 1);
    if (pgw.freeHit == false) {
      _pickedTeam.value.forEach((key, value) {
        if (key == map['position']) {
          value.add(map['id']);
        }
        if (map['position'] == '') {
          if(key == toBeSubbed.value['position']) {
            value.add(map['id']);
          }
        }
        if (key == toBeSubbed.value['position']) {
          value.remove(toBeSubbed.value['id']);
        }
      });
      substitutes.value.remove(map['id']);
      substitutes.value.add(toBeSubbed.value['id']);
      substitutes.refresh();
      _pickedTeam.refresh();
    } else {
      _freehitPickedTeam.value.forEach((key, value) {
        if (key == map['position']) {
          value.add(map['id']);
        }
        if (map['position'] == '') {
          if(key == toBeSubbed.value['position']) {
            value.add(map['id']);
          }
        }
        if (key == toBeSubbed.value['position']) {
          value.remove(toBeSubbed.value['id']);
        }
      });
      substitutes.value.remove(map['id']);
      substitutes.value.add(toBeSubbed.value['id']);
      substitutes.refresh();
      _freehitPickedTeam.refresh();
    }
    subbing.value = false;
  }

  Future<void> signUp(User newUser) async {
    try{
      var response = await registerUser('http://$pather/api/users', newUser);
      User user = userFromJson(response['body']);

      await SecureStorage.writeSecureData('token', response['access-token']);
      updateUser(user);
      List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, -1];
      PointGameWeek pointGameWeek = PointGameWeek(
          number: 0,
          points: 0,
          keeper: "",
          defender: ["", "", "", ""],
          midfielder: ["", "", "", ""],
          attacker: ["", ""],
          subKeeper: "",
          substitution: ["", "", ""],
          id: "",
          v: 0);
      list.forEach((element) async {
        pointGameWeek.number = element;
        var response = await postGameWeek('http://$pather/api/gameWeeks', pointGameWeek);
        PointGameWeek newPointGameweek = pointGameWeekFromJson(response);
        await updatePointGameWeek('http://$pather/api/users/pointGameweek', newUser, newPointGameweek);
      });
      captain.value = user.captain!;
      viceCaptain.value = user.viceCaptain!;
      await getSingleLeague('default');
      joinLeague(leagueUpdating.value).then((value) async {
        await fetchLeagues(myUser);
      });
      await generateFantasy();
      await fetchGameweeks(_user.value);
      await fetchDeadlines();
      await fetchLeagues(_user.value);
      print("user ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> login(User newUser) async {
    try{
      var response = await loginUser('http://$pather/api/auth', newUser);
      User user = userFromJson(response['body']);
      await SecureStorage.writeSecureData('token', response['access-token']);
      updateUser(user);
      if (user.leagues?.length != 0) {
        await fetchLeagues(user);
      }
      captain.value = user.captain!;
      viceCaptain.value = user.viceCaptain!;
      await generateFantasy();
      await fetchGameweeks(_user.value);
      await fetchDeadlines();
      await fetchLeagues(_user.value);
      print("user ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchLeagues(User user) async {
    try{
      var response = await fetchLeague('http://$pather/api/leagues/init', user);
      List<League> newLeagues = leaguesFromJson(response);
      leagues.value = newLeagues;
      print('leagues ready');
     }catch (error){
      throw Exception(error);
    }
  }

  Future<void> fetchDeadlines() async {
    try{
      var response = await fetchDeadline('http://$pather/api/deadlines');
      List<Deadline> newDeadlines = deadlineFromJson(response);
      deadlines.value = newDeadlines;
      print('deadline ready');
      getViableGameweeks();
    }catch (error){
      throw Exception(error);
    }
  }

  void getViableGameweeks() {
    List<int> viable = [];
    List<int> isFirstViable = [];
    deadlines.value.forEach((element) {
      if (element.date.isBefore(DateTime.now())) {
        viable.add(element.gameweek);
      }
    });
    viable.sort();
    viableGameweeks.value = viable;
    pointsPageIndex.value = viableGameweeks.value.length - 1;
  }

  Future<void> getMeCont(User newUser) async {
    try{
      var response2 = await getMe('http://$pather/api/users/me', newUser);
      User user1 = userFromJson(response2);
      updateUser(user1);
      print("final user ready");
    }catch(error) {
      throw Exception(error);
    }
  }
  Future<void> getThisUserCont(String id) async {
    try{
      var response = await getThisUser('http://$pather/api/users/getThisUser', id);
      User user = userFromJson(response['body']);
      await SecureStorage.writeSecureData('token', response['access-token']);
      updateUser(user);
      if (user.leagues?.length != 0) {
        await fetchLeagues(user);
      }
      captain.value = user.captain!;
      viceCaptain.value = user.viceCaptain!;
      await fetchGameweeks(_user.value);
      await fetchDeadlines();
      await fetchLeagues(_user.value);
      print("final user ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> deleteMeCont(User newUser, String password) async {
    try{
      var response2 = await deleteMe('http://$pather/api/users/delMe', newUser, password);
      User user1 = userFromJson(response2);
      updateUser(user1);
      print("final user ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> updateFantasyTeam(User newUser, Player newPlayer, String title) async {
    try{
      await addFantasyPlayer('http://$pather/api/users/team', newUser, newPlayer, title);
      var response = await getMe('http://$pather/api/users/me', newUser);
      User user = userFromJson(response);
      updateUser(user);
      print("fantasy update ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> updateFreeHitTeam(User newUser, Player newPlayer, String title) async {
    try{
      await addFreeHitPlayer('http://$pather/api/users/freehitTeam', newUser, newPlayer, title);
      var response = await getMe('http://$pather/api/users/me', newUser);
      User user = userFromJson(response);
      updateUser(user);
      print("fantasy update ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> updatePickTeam(User newUser) async {
    try{
      await pickTeam('http://$pather/api/users/pickTeam', newUser);
      var response = await getMe('http://$pather/api/users/me', newUser);
      User user = userFromJson(response);
      updateUser(user);
      print("fantasy pickTeam ready");
      await setGameWeek(newUser);
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> updateFreeHitPickTeam(User newUser) async {
    try{
      await freehitPickTeam('http://$pather/api/users/freehitPickTeam', newUser);
      var response = await getMe('http://$pather/api/users/me', newUser);
      User user = userFromJson(response);
      updateUser(user);
      print("fantasy freehit pickTeam ready");
      await setGameWeek(newUser);
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> setGameWeek(User newUser) async {
    try{
      int number = viableGameweeks.value.length;
      PointGameWeek pgw = pointGameweeks.firstWhere((element) => element.number == number + 1);
      if (pgw.freeHit == false) {
        List<int> possibleInt = [1,2,3,4,5,6,7,8,9,10,11];
        possibleInt.removeWhere((element) => viableGameweeks.value.contains(element));
        List<PointGameWeek> holder = [];
        possibleInt.forEach((element) {
          PointGameWeek variable = pointGameweeks.value.firstWhere((e) => e.number == element);
          holder.add(variable);
        });
        Player? keeperHolder = _pickedTeam.value['keeper'];
        List<Player?> defender = _pickedTeam.value['defender'];
        List<Player?> midfielder = _pickedTeam.value['midfielder'];
        List<Player?> attacker = _pickedTeam.value['attacker'];
        PointGameWeek pointGameWeek = PointGameWeek(
            number: 0,
            points: 0,
            keeper: keeperHolder!.id,
            defender: defender!.map((e) => e!.id).toList(),
            midfielder: midfielder!.map((e) => e!.id).toList(),
            attacker: attacker!.map((e) => e!.id).toList(),
            subKeeper: keeperSub.value!.id,
            substitution: substitutes.value.map((e) => e!.id).toList(),
            id: "",
            v: 0);
        await setPointGameweeks('http://$pather/api/gameWeeks/change', pointGameWeek, holder);
        await fetchGameweeks(newUser);
      } else {
        List<int> possibleInt = [-1];
        possibleInt.removeWhere((element) => viableGameweeks.value.contains(element));
        List<PointGameWeek> holder = [];
        possibleInt.forEach((element) {
          PointGameWeek variable = pointGameweeks.value.firstWhere((e) => e.number == element);
          holder.add(variable);
        });
        Player? keeperHolder = _freehitPickedTeam.value['keeper'];
        List<Player?> defender = _freehitPickedTeam.value['defender'];
        List<Player?> midfielder = _freehitPickedTeam.value['midfielder'];
        List<Player?> attacker = _freehitPickedTeam.value['attacker'];
        PointGameWeek pointGameWeek = PointGameWeek(
            number: 0,
            points: 0,
            keeper: keeperHolder!.id,
            defender: defender!.map((e) => e!.id).toList(),
            midfielder: midfielder!.map((e) => e!.id).toList(),
            attacker: attacker!.map((e) => e!.id).toList(),
            subKeeper: keeperSub.value!.id,
            substitution: substitutes.value.map((e) => e!.id).toList(),
            id: "",
            v: 0);
        await setPointGameweeks('http://$pather/api/gameWeeks/change', pointGameWeek, holder);
        await fetchGameweeks(newUser);
      }
    }catch(err){
      throw Exception(error);
    }
  }

  Future<void> updateGameWeek(User newUser) async {
    try{
      Player? keeperHolder = _pickedTeam.value['keeper'];
      List<Player?> defender = _pickedTeam.value['defender'];
      List<Player?> midfielder = _pickedTeam.value['midfielder'];
      List<Player?> attacker = _pickedTeam.value['attacker'];
      PointGameWeek pointGameWeek = PointGameWeek(
          number: newUser.gameweek!.length + 1,
          points: 0,
          keeper: keeperHolder!.id,
          defender: defender!.map((e) => e!.id).toList(),
          midfielder: midfielder!.map((e) => e!.id).toList(),
          attacker: attacker!.map((e) => e!.id).toList(),
          subKeeper: keeperSub.value!.id,
          substitution: substitutes.value.map((e) => e!.id).toList(),
          id: "",
          v: 0);
      var response = await postGameWeek('http://$pather/api/gameWeeks', pointGameWeek);
      PointGameWeek newPointGameweek = pointGameWeekFromJson(response);
      await updatePointGameWeek('http://$pather/api/users/pointGameweek', newUser, newPointGameweek);
      var response2 = await getMe('http://$pather/api/users/me', newUser);
      User user = userFromJson(response2);
      updateUser(user);
      print("fantasy points Team ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  var pointsPageIndex = 0.obs;
  Future<void> fetchGameweeks(User newUser) async {
    try{
      if (_user.value.gameweek?.length == 0) {
        return;
      }
      var response = await fetchGameweek('http://$pather/api/gameWeeks', newUser);
      List<PointGameWeek> pointGameweek = pointsGameWeekFromJson(response);
      pointGameweek.sort((a,b)=> a.number.compareTo(b.number));
      pointGameweeks.value = pointGameweek;
      pointGameweeks.refresh();
      //pointsPageIndex.value = viableGameweeks.value.length - 1;
      print("gameweek ready");
      await getHighestGameweek();
    }catch(error) {
      throw Exception(error);
    }
  }
  void increasepgw() {
    if (pointsPageIndex.value >= viableGameweeks.value.length -1) {
      return;
    } else {
      pointsPageIndex.value = pointsPageIndex.value + 1;
    }
  }
  void decreasepgw() {
    if (pointsPageIndex.value <= 0) {
      return;
    } else {
      pointsPageIndex.value = pointsPageIndex.value - 1;
    }
  }

  Future<void> getLeagueUsersCont() async {
    try{
      List ids = [];
      leagues.value.forEach((element) {
        ids.addAll(element.players);
      });
      Set mySet = Set.from(ids);
      List id = List.from(mySet);
      var response2 = await getLeagueUsers('http://$pather/api/users/leagueUsers', id);
      List<User> user1 = usersFromJson(response2);
      leagueUsers.value = user1;
      print("league user ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> postNewLeague(String name, String code) async {
    try{
      var response = await postLeague('http://$pather/api/leagues/', _user.value, name, code);
      League league = leagueFromJson(response);
      await updateLeague('http://$pather/api/users/leagues', _user.value, league);
      var response1 = await getMe('http://$pather/api/users/me', _user.value);
      User user = userFromJson(response1);
      updateUser(user);
      print("league posted");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> updateUserFuture() async {
    try{
      var response1 = await updateMe('http://$pather/api/users/updateMe', _user.value);
      User user = userFromJson(response1);
      updateUser(user);
      print("user updated");
    }catch(error) {
      throw Exception(error);
    }
  }

  int gameWeekPoint (index) {
    TeamController teamController = Get.find<TeamController>();
    Player defaultPlayer = Player(image: Image(name: '', contentType: ''),
        points: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        fantasyPrice: 0,
        id: '',
        name: '',
        team: '',
        age: 0,
        number: 0,
        appearances: 0,
        goals: 0,
        subs: 0,
        assists: 0,
        fantasyPoints: 0,
        position: '',
        yellowCards: 0,
        redCards: 0,
        v: 0,
        cleanSheets: 0,
        currentFantasyPoints: 0,
        ownGoals: 0,
        imageUrl: '');
    List<Player> players = teamController.getPlayers;
    PointGameWeek pgw = pointGameweeks.value.firstWhere((element) =>
    element.number == index);
    if (pgw.freeHit == true) {
      pgw = pointGameweeks.value.firstWhere((element) =>
      element.number == -1);
    }
    int value = 0;
    List<Player> gameweekPlayers = [];
    List<String> gameweekPlayersId = [];
    gameweekPlayersId.add(pgw.keeper);
    gameweekPlayersId.addAll(pgw.defender);
    gameweekPlayersId.addAll(pgw.midfielder);
    gameweekPlayersId.addAll(pgw.attacker);
    if (pgw.benchBoost == true){
      gameweekPlayersId.add(pgw.subKeeper);
      gameweekPlayersId.addAll(pgw.substitution);
    }
    gameweekPlayersId.forEach((element) {
      gameweekPlayers.add(players.firstWhere((e) => e.id == element,
          orElse: () => defaultPlayer));
    });
    gameweekPlayers.forEach((element) {
      value = value + element.points![index];
    });
    return value;
  }

  Future<void> getHighestGameweek() async {
    try{
      var response = await fetchHighestGameweek('http://$pather/api/gameWeeks/highest');
      List<GetHighestGameweek> ghg = getHighestGameweekFromJson(response);
      getMaxGameweek.value = ghg;
      print("max gameweek data ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> getSingleLeague(String code) async {
    try{
      var response = await fetchSingleLeague('http://$pather/api/leagues/search', code);
      if (response != false) {
        League league = leagueFromJson(response);
        leagueUpdating.value = league;
      } else {
        leagueUpdating.value = League(name: 'None', players: [], entryCode: '', id: '', v: 0);
        print('wrong code');
      }
      print("search league data ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> joinLeague(League league) async {
    await join('http://$pather/api/leagues/join', _user.value, league.entryCode);
    await updateLeague('http://$pather/api/users/leagues', _user.value, league);
    var response1;
    response1 = await getMe('http://$pather/api/users/me', _user.value);    User user = userFromJson(response1);
    updateUser(user);
  }

  Future<void> updatePGW(PointGameWeek pgw, int number) async {
    var response = await updatePointGameWeekG('http://$pather/api/gameWeeks', pgw);
    PointGameWeek pointGameWeek = pointGameWeekFromJson(response);
    await fetchGameweeks(_user.value);
    //int index = pointGameweeks.value.indexWhere((element) => element.number == number);
    //pointGameweeks.value[index] = pointGameWeek;
    print('Chip updated');
  }

  Future<void> resetPasswordCont(User newUser, String password) async {
    try{
      var response2 = await resetPassword('http://$pather/api/users/resetPassword', newUser);
      print("reset done");
    }catch(error) {
      throw Exception(error);
    }
  }
}