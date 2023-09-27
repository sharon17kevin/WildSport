import 'dart:convert';

import 'package:get/get.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/functions/secureStorage.dart';
import 'package:wild_sport/functions/userFunctions.dart';
import 'package:wild_sport/models/fantasyModel.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:wild_sport/models/userModel.dart';

class UserController extends GetxController {
  var _user = User(id: "", name: "", email: "").obs;
  var _fantasy = new Fantasy().obs;
  String pather = '172.20.10.8:3000';
  var _pickedTeam = <String, dynamic>{}.obs;
  var viceCaptain = ''.obs;
  var captain = ''.obs;

  var toUpdate = ''.obs;

  String get myToUpdate => toUpdate.value;

  User get myUser => _user.value;

  Fantasy get myFantasyTeam => _fantasy.value;

  Map<String, dynamic> get myPickedTeam => _pickedTeam.value;
  String get myCaptain => captain.value;
  String get myViceCaptain => viceCaptain.value;

  void updateCaptain(String id) {
    if(id == '') return;
    captain.value = id;
  }

  void updateViceCaptain(String id) {
    if(id == '') return;
    viceCaptain.value = id;
  }

  Future<void> generateFantasy () async {
    TeamController _teamController = Get.find<TeamController>();
    List<Player> players = _teamController.getPlayers;
    FantasyTeam defaultFantasyTeam = FantasyTeam(player: '', title: '');
    Player defaultPlayer = Player(image: Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '');
    Fantasy fantasy = Fantasy(
      keeper1: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'keeper1', orElse: () => defaultFantasyTeam).player, orElse: ()=> defaultPlayer),
      keeper2: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'keeper2', orElse: () => defaultFantasyTeam).player, orElse: ()=> defaultPlayer),
      defender1: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'defender1', orElse: () => defaultFantasyTeam).player, orElse: ()=> defaultPlayer),
      defender2: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'defender2', orElse: () => defaultFantasyTeam).player, orElse: ()=> defaultPlayer),
      defender3: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'defender3', orElse: () => defaultFantasyTeam).player, orElse: ()=> defaultPlayer),
      defender4: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'defender4', orElse: () => defaultFantasyTeam).player, orElse: ()=> defaultPlayer),
      defender5: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'defender5', orElse: () => defaultFantasyTeam).player, orElse: ()=> defaultPlayer),
      midfielder1: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'midfielder1', orElse: () => defaultFantasyTeam).player, orElse: ()=> defaultPlayer),
      midfielder2: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'midfielder2', orElse: () => defaultFantasyTeam).player, orElse: ()=> defaultPlayer),
      midfielder3: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'midfielder3', orElse: () => defaultFantasyTeam).player, orElse: ()=> defaultPlayer),
      midfielder4: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'midfielder4', orElse: () => defaultFantasyTeam).player, orElse: ()=> defaultPlayer),
      midfielder5: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'midfielder5', orElse: () => defaultFantasyTeam).player, orElse: ()=> defaultPlayer),
      attacker1: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'attacker1', orElse: () => defaultFantasyTeam).player, orElse: ()=> defaultPlayer),
      attacker2: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'attacker2', orElse: () => defaultFantasyTeam).player, orElse: ()=> defaultPlayer),
      attacker3: players.firstWhere((element) => element.id == _user.value.fantasyTeam?.firstWhere((element) => element.title == 'attacker3', orElse: () => defaultFantasyTeam).player, orElse: ()=> defaultPlayer),
    );
    _fantasy.value = fantasy;
    Map<String, dynamic> pickedTeam = {
      'keeper': _user.value.keeper != null? _user.value.keeper : fantasy.keeper1?.id,
      'defender': _user.value.defender?.length == 0? [fantasy.defender1?.id, fantasy.defender2?.id, fantasy.defender3?.id, fantasy.defender4?.id] : _user.value.defender,
      'midfield': _user.value.midfielder?.length == 0? [fantasy.midfielder1?.id, fantasy.midfielder2?.id, fantasy.midfielder3?.id, fantasy.midfielder4?.id] :  _user.value.midfielder,
      'attacker': _user.value.attacker?.length == 0? [fantasy.attacker1?.id, fantasy.attacker2?.id] :  _user.value.attacker
    };
    _pickedTeam.value = pickedTeam;
    print('Here we go fantasy');
  }
  void updateUser(User newUser) {
    _user.value = newUser;
  }

  void updateFantasy(Player player, String position) {
    Fantasy fantasy = _fantasy.value;
    fantasy.setVariable(position, player);
    _fantasy.value = fantasy;
  }

  void updateToUpdate(String position) {
    toUpdate.value = position;
    print('youre good to go');
  }

  Future<void> signUp(User newUser) async {
    try{
      var response = await registerUser('http://$pather/api/users', newUser);
      User user = userFromJson(response);
      updateUser(user);
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
      print("user ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> updateFantasyTeam(User newUser, Player newPlayer, String title) async {
    try{
      await addFantasyPlayer('http://$pather/api/users/team', newUser, newPlayer, title);
      print("fantasy update ready");
    }catch(error) {
      throw Exception(error);
    }
  }
}