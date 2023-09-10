import 'package:get/get.dart';
import 'package:wild_sport/functions/playerFunction.dart';
import 'package:wild_sport/functions/teamsFunctions.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:wild_sport/models/teamsModel.dart';

class TeamController extends GetxController {
  //team variables-------------------------------->
  var _teams = <Team>[].obs;
  var _teamGoals = <Team>[].obs;
  var _teamLoss = <Team>[].obs;
  var _teamWins = <Team>[].obs;
  var _teamDraws = <Team>[].obs;

  //player variables-------------------------------->
  var _players = <Player>[].obs;

  //team get functions variables-------------------------------->
  List<Team> get getTeams => _teams.value;
  List<Team> get getTeamGoal => _teamGoals.value;
  List<Team> get getTeamLoss => _teamLoss.value;
  List<Team> get getTeamWin => _teamWins.value;
  List<Team> get getTeamDraw => _teamDraws.value;

  //player get functions variables-------------------------------->
  List<Player> get getPlayers => _players.value;

  void updateTeams(List<Team> team) {
    _teams.value = team;
  }

  void updatePlayers(List<Player> player) {
    _players.value = player;
  }

  void updateTeamGoals(List<Team> team) {
    _teamGoals.value = team;
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchTeam();
    await fetchPlayer();
    await fetchTeamGoals();
    await fetchTeamLoss();
    await fetchTeamWin();
    await fetchTeamDraw();
  }

  //player functions links variables-------------------------------->
  Future<void> fetchTeam () async {
    try{
      var response = await fetchTeams('http://172.20.10.8:3000/api/teams');
      List<Team> teams = teamFromJson(response);
      updateTeams(teams);
      print("teams ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchTeamGoals () async {
    try{
      var response = await fetchTeamsStats('http://172.20.10.8:3000/api/teams/stat', [0]);
      List<Team> teams = teamFromJson(response);
      updateTeamGoals(teams);
      print("team's goals are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchTeamLoss () async {
    try{
      var response = await fetchTeamsStats('http://172.20.10.8:3000/api/teams/stat', [1]);
      List<Team> teams = teamFromJson(response);
      _teamLoss.value = teams;
      print("team's losses are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchTeamWin () async {
    try{
      var response = await fetchTeamsStats('http://172.20.10.8:3000/api/teams/stat', [2]);
      List<Team> teams = teamFromJson(response);
      _teamWins.value = teams;
      print("team's wins are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchTeamDraw () async {
    try{
      var response = await fetchTeamsStats('http://172.20.10.8:3000/api/teams/stat', [3]);
      List<Team> teams = teamFromJson(response);
      _teamDraws.value = teams;
      print("team's draws are ready");
    }catch(error) {
      throw Exception(error);
    }
  }
  //player functions links variables-------------------------------->
  Future<void> fetchPlayer () async {
    try{
      var response = await fetchPlayers('http://172.20.10.8:3000/api/players');
      List<Player> players = playerFromJson(response);
      updatePlayers(players);
      print("players ready");
    }catch(error) {
      throw Exception(error);
    }
  }
}