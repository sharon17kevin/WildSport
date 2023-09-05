import 'package:get/get.dart';
import 'package:wild_sport/functions/teamsFunctions.dart';
import 'package:wild_sport/models/teamsModel.dart';

class TeamController extends GetxController {
  var _teams = <Team>[].obs;

  List<Team> get getTeams => _teams.value;

  void updateTeams(List<Team> team) {
    _teams.value = team;
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchTeam();
  }

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
}