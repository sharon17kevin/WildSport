import 'dart:convert';

import 'package:get/get.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/functions/leagueFunctions.dart';
import 'package:wild_sport/functions/pointGameWeekFunctions.dart';
import 'package:wild_sport/functions/secureStorage.dart';
import 'package:wild_sport/functions/userFunctions.dart';
import 'package:wild_sport/models/fantasyModel.dart';
import 'package:wild_sport/models/leagueModel.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:wild_sport/models/pointGameWeekModel.dart';
import 'package:wild_sport/models/userModel.dart';

class UserController extends GetxController {
  var error = ''.obs;
  var _user = User(id: "", name: "", email: "").obs;
  var _fantasy = new Fantasy().obs;
  String pather = '172.20.10.3:3000';
  var _pickedTeam = <String, dynamic>{}.obs;
  var substitutes = <Player?>[].obs;
  Rx<Player?> keeperSub = Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '').obs;
  var viceCaptain = 'e'.obs;
  var captain = 'e'.obs;
  var toBeSubbed = <String, dynamic>{}.obs;
  var subbing = false.obs;
  var bankToAdd = 0.obs;
  var pickTeamUpdating = false.obs;

  var toUpdate = ''.obs;
  var leagues = [].obs;
  var pointGameweeks = <PointGameWeek>[].obs;

  //Transfer Page-------------------------------------------->
  var xOffset = 0.0.obs;
  var yOffset = 0.0.obs;
  var scaleFactor = 1.0.obs;
  var isDrawerOpen = false.obs;

  String get myToUpdate => toUpdate.value;

  User get myUser => _user.value;

  Fantasy get myFantasyTeam => _fantasy.value;

  Map<String, dynamic> get myPickedTeam => _pickedTeam.value;

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
    _fantasy.value = fantasy;
    Map<String, dynamic> pickedTeam = {
      'keeper': _user.value.keeper != null? _fantasy.value.pickAttribute(_user.value.keeper!) : _fantasy.value.pickAttribute('keeper1'),
      'defender': _user.value.defender?.length == 0? [_fantasy.value.pickAttribute('defender1'), _fantasy.value.pickAttribute('defender2'), _fantasy.value.pickAttribute('defender3'), _fantasy.value.pickAttribute('defender4')] : _user.value.defender?.map((e) => _fantasy.value.pickAttribute('$e')).toList(),
      'midfielder': _user.value.midfielder?.length == 0? [_fantasy.value.pickAttribute('midfielder1'), _fantasy.value.pickAttribute('midfielder2'), _fantasy.value.pickAttribute('midfielder3'), _fantasy.value.pickAttribute('midfielder4')] :  _user.value.midfielder?.map((e) => _fantasy.value.pickAttribute('$e')).toList(),
      'attacker': _user.value.attacker?.length == 0? [_fantasy.value.pickAttribute('attacker1'), _fantasy.value.pickAttribute('attacker2')] :  _user.value.attacker?.map((e) => _fantasy.value.pickAttribute('$e')).toList()
    };
    _pickedTeam.value = pickedTeam;
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
    Fantasy fantasy = _fantasy.value;
    fantasy.setVariable(position, player);
    _fantasy.value = fantasy;
  }

  void updateTransferValues() async{
    if (_user.value.freeTransfer! <= 0) {
      _user.value.freeTransfer = -1;
      _user.value.cost = _user.value.cost! + 4;
    } else if (_user.value.freeTransfer! > 0) {
      _user.value.freeTransfer = _user.value.freeTransfer! - 1;
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
    subbing.value = false;
  }

  Future<void> signUp(User newUser) async {
    try{
      var response = await registerUser('http://$pather/api/users', newUser);
      User user = userFromJson(response);
      updateUser(user);
      if (user.leagues?.length != 0) {
        await fetchLeagues(user);
      }
      captain.value = user.captain!;
      viceCaptain.value = user.viceCaptain!;
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
      print("user ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchLeagues(User user) async {
    try{
      var response = await fetchLeague('http://$pather/api/leagues/init', user);
      List<League> newLeagues = leagueFromJson(response);
      leagues.value = newLeagues;
      print('leagues ready');
     }catch (error){
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

  Future<void> updatePickTeam(User newUser) async {
    try{
      await pickTeam('http://$pather/api/users/pickTeam', newUser);
      var response = await getMe('http://$pather/api/users/me', newUser);
      User user = userFromJson(response);
      updateUser(user);
      print("fantasy pickTeam ready");
    }catch(error) {
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
      pointGameweeks.value = pointGameweek;
      pointGameweeks.refresh();
      pointsPageIndex.value = pointGameweeks.value.length - 1;
      print("gameweek ready");
    }catch(error) {
      throw Exception(error);
    }
  }
  void increasepgw() {
    if (pointsPageIndex.value >= pointGameweeks.value.length - 1) {
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
}