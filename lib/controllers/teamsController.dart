import 'package:get/get.dart';
import 'package:wild_sport/functions/playerFunction.dart';
import 'package:wild_sport/functions/teamsFunctions.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:wild_sport/models/teamsModel.dart';

class TeamController extends GetxController {
  final String ipaddress = "172.20.10.3";
  //team variables-------------------------------->
  var _teams = <Team>[].obs;
  var _teamPoints = <Team>[].obs;
  var _teamGoals = <Team>[].obs;
  var _teamLoss = <Team>[].obs;
  var _teamWins = <Team>[].obs;
  var _teamDraws = <Team>[].obs;
  var _teamRedCards = <Team>[].obs;
  var _teamYellowCards = <Team>[].obs;
  var _teamCleanSheets = <Team>[].obs;
  var _teamGoalsAgainst = <Team>[].obs;

  //player variables-------------------------------->
  var _players = <Player>[].obs;
  var _playerGoals = <Player>[].obs;
  var _playerOwnGoals = <Player>[].obs;
  var _playerAssists = <Player>[].obs;
  var _playerSubs = <Player>[].obs;
  var _playerRedCards = <Player>[].obs;
  var _playerYellowCards = <Player>[].obs;
  var _playerCleanSheets = <Player>[].obs;
  var _playerFantasyPoints = <Player>[].obs;
  var _playerAppearances = <Player>[].obs;
  var _playerCurrentFantasyPoints = <Player>[].obs;

  //team get functions variables-------------------------------->
  List<Team> get getTeams => _teams.value;
  List<Team> get getTeamPoint => _teamPoints.value;
  List<Team> get getTeamGoal => _teamGoals.value;
  List<Team> get getTeamLoss => _teamLoss.value;
  List<Team> get getTeamWin => _teamWins.value;
  List<Team> get getTeamDraw => _teamDraws.value;
  List<Team> get getTeamRedCard => _teamRedCards.value;
  List<Team> get getTeamYellowCard => _teamYellowCards.value;
  List<Team> get getTeamCleanSheet => _teamCleanSheets.value;
  List<Team> get getTeamGoalsAgainst => _teamGoalsAgainst.value;

  //player get functions variables-------------------------------->
  List<Player> get getPlayers => _players.value;
  List<Player> get getPlayerGoal => _playerGoals.value;
  List<Player> get getPlayerAssist => _playerAssists.value;
  List<Player> get getPlayerAppearances => _playerAppearances.value;
  List<Player> get getPlayerSub => _playerSubs.value;
  List<Player> get getPlayerRedCard => _playerRedCards.value;
  List<Player> get getPlayerYellowCard => _playerYellowCards.value;
  List<Player> get getPlayerFantasyPoints => _playerFantasyPoints.value;
  List<Player> get getPlayerCurrentFantasyPoints => _playerCurrentFantasyPoints.value;
  List<Player> get getPlayerCleanSheets => _playerCleanSheets.value;
  List<Player> get getPlayerOwnGoal => _playerOwnGoals.value;

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
    await fetchTeamGoals();
    await fetchTeamLoss();
    await fetchTeamWin();
    await fetchTeamDraw();
    await fetchTeamRedCard();
    await fetchTeamYellowCard();
    await fetchTeamCleanSheet();
    await fetchTeamGoalsAgainst();
    await fetchTeamPoint();
    //Player Function Calls ================>
    await fetchPlayer();
    await fetchPlayerGoals();
    await fetchPlayerAssists();
    await fetchPlayerRedCards();
    await fetchPlayerYellowCards();
    await fetchPlayerSubs();
    await fetchPlayerCleanSheets();
    await fetchPlayerOwnGoals();
    await fetchPlayerCurrentFantasyPoints();
    await fetchPlayerFantasyPoints();
    await fetchPlayerAppearances();
  }

  //player functions links variables-------------------------------->
  Future<void> fetchTeam () async {
    try{
      var response = await fetchTeams('http://$ipaddress:3000/api/teams');
      List<Team> teams = teamFromJson(response);
      updateTeams(teams);
      print("teams ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchTeamGoals () async {
    try{
      var response = await fetchTeamsStats('http://$ipaddress:3000/api/teams/stat', [0]);
      List<Team> teams = teamFromJson(response);
      updateTeamGoals(teams);
      print("team's goals are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchTeamPoint () async {
    try{
      var response = await fetchTeamsStats('http://$ipaddress:3000/api/teams/stat', [8]);
      List<Team> teams = teamFromJson(response);
      _teamPoints.value = teams;
      print("team's points are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchTeamLoss () async {
    try{
      var response = await fetchTeamsStats('http://$ipaddress:3000/api/teams/stat', [1]);
      List<Team> teams = teamFromJson(response);
      _teamLoss.value = teams;
      print("team's losses are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchTeamWin () async {
    try{
      var response = await fetchTeamsStats('http://$ipaddress:3000/api/teams/stat', [2]);
      List<Team> teams = teamFromJson(response);
      _teamWins.value = teams;
      print("team's wins are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchTeamDraw () async {
    try{
      var response = await fetchTeamsStats('http://$ipaddress:3000/api/teams/stat', [3]);
      List<Team> teams = teamFromJson(response);
      _teamDraws.value = teams;
      print("team's draws are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchTeamRedCard () async {
    try{
      var response = await fetchTeamsStats('http://$ipaddress:3000/api/teams/stat', [4]);
      List<Team> teams = teamFromJson(response);
      _teamRedCards.value = teams;
      print("team's red card are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchTeamYellowCard () async {
    try{
      var response = await fetchTeamsStats('http://$ipaddress:3000/api/teams/stat', [5]);
      List<Team> teams = teamFromJson(response);
      _teamYellowCards.value = teams;
      print("team's yellow card are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchTeamCleanSheet () async {
    try{
      var response = await fetchTeamsStats('http://$ipaddress:3000/api/teams/stat', [6]);
      List<Team> teams = teamFromJson(response);
      _teamCleanSheets.value = teams;
      print("team's clean sheet are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchTeamGoalsAgainst () async {
    try{
      var response = await fetchTeamsStats('http://$ipaddress:3000/api/teams/stat', [7]);
      List<Team> teams = teamFromJson(response);
      _teamGoalsAgainst.value = teams;
      print("team's goals against are ready");
    }catch(error) {
      throw Exception(error);
    }
  }
  //player functions links variables-------------------------------->
  Future<void> fetchPlayer () async {
    try{
      var response = await fetchPlayers('http://$ipaddress:3000/api/players');
      List<Player> players = playerFromJson(response);
      updatePlayers(players);
      print("players ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchPlayerGoals () async {
    try{
      var response = await fetchPlayerStats('http://$ipaddress:3000/api/players/stat', [0]);
      List<Player> players = playerFromJson(response);
      _playerGoals.value = players;
      print("player's goals are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchPlayerAssists () async {
    try{
      var response = await fetchPlayerStats('http://$ipaddress:3000/api/players/stat', [1]);
      List<Player> players = playerFromJson(response);
      _playerAssists.value = players;
      print("player's assists are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchPlayerSubs () async {
    try{
      var response = await fetchPlayerStats('http://$ipaddress:3000/api/players/stat', [2]);
      List<Player> players = playerFromJson(response);
      _playerSubs.value = players;
      print("player's subs are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchPlayerYellowCards () async {
    try{
      var response = await fetchPlayerStats('http://$ipaddress:3000/api/players/stat', [3]);
      List<Player> players = playerFromJson(response);
      _playerYellowCards.value = players;
      print("player's yellow cards are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchPlayerRedCards () async {
    try{
      var response = await fetchPlayerStats('http://$ipaddress:3000/api/players/stat', [4]);
      List<Player> players = playerFromJson(response);
      _playerRedCards.value = players;
      print("player's red cards are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchPlayerCleanSheets () async {
    try{
      var response = await fetchPlayerStats('http://$ipaddress:3000/api/players/stat', [5]);
      List<Player> players = playerFromJson(response);
      _playerCleanSheets.value = players;
      print("player's clean Sheets are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchPlayerFantasyPoints () async {
    try{
      var response = await fetchPlayerStats('http://$ipaddress:3000/api/players/stat', [6]);
      List<Player> players = playerFromJson(response);
      _playerFantasyPoints.value = players;
      print("player's fantasy points are ready");
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> fetchPlayerCurrentFantasyPoints () async {
    try {
      var response = await fetchPlayerStats(
          'http://$ipaddress:3000/api/players/stat', [7]);
      List<Player> players = playerFromJson(response);
      _playerCurrentFantasyPoints.value = players;
      print("player's current fantasy points are ready");
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> fetchPlayerOwnGoals() async {
    try {
      var response = await fetchPlayerStats(
          'http://$ipaddress:3000/api/players/stat', [8]);
      List<Player> players = playerFromJson(response);
      _playerOwnGoals.value = players;
      print("player's own goals are ready");
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> fetchPlayerAppearances () async {
    try {
      var response = await fetchPlayerStats(
          'http://$ipaddress:3000/api/players/stat', [9]);
      List<Player> players = playerFromJson(response);
      _playerAppearances.value = players;
      print("player's appearances are ready");
    } catch (error) {
      throw Exception(error);
    }
  }
}