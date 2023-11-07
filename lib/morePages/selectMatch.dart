import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/controllers/managementController.dart';
import 'package:wild_sport/controllers/matchesController.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/models/matchesModel.dart';
import 'package:wild_sport/models/teamsModel.dart';
import 'package:flutter/src/widgets/icon.dart' as MainIcon;
import 'package:wild_sport/models/teamsModel.dart' as MinorIcon;

class SelectMatch extends StatefulWidget {
  @override
  State<SelectMatch> createState() => _SelectMatchState();
}

class _SelectMatchState extends State<SelectMatch> {
  MatchesController matchesController = Get.find<MatchesController>();
  TeamController teamController = Get.find<TeamController>();

  @override
  Widget build(BuildContext context) {
    List<Match> matches = matchesController.myMatches;
    List<Team> teams = teamController.getTeams;
    List<Team> display_team = List.from(teams);
    var display_match = List.from(matches).obs;
    var display_list = List.from(teams).obs;
    Team team = Team(icon: MinorIcon.Icon(contentType: '', name: ''), draw: 0, currentPosition: 0, id: '', name: '', played: 0, win: 0, loss: 0, goals: 0, points: 0, jersey: '', imageUrl: '', yellowCards: 0, redCards: 0, players: [], v: 0, cleanSheets: 0, goalsAgainst: 0);
    List<String> teamIds = [];
    // if (widget.match != null) {
    //   display_match.value = matches.where((Match element) => element.id == widget.match.id).toList();
    // }

    void updateList(String value) {
      setState(() {
        display_team = teams.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
        teamIds = display_team.map((e) => e.id).toList();
      });
      display_match.value = matches.where((element) => teamIds.contains(element.homeTeam) || teamIds.contains(element.awayTeam)).toList();
    }
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              child: Row(
                children: [
                  MainIcon.Icon(Icons.arrow_back_ios, size: 10,),
                  SizedBox(width: 5,),
                  Text('Back')
                ],
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text('Overview'),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 70,
              child: TextField(
                style: TextStyle(
                    color: Colors.black
                ),
                onChanged: (value) => updateList(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Get.isDarkMode? Colors.white30: Colors.black12,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Enter Team Name',
                  hintStyle: TextStyle(
                      color: Get.isDarkMode? Colors.white : Colors.black
                  ),
                  prefixIcon: MainIcon.Icon(Icons.search),
                  prefixIconColor: Get.isDarkMode? Colors.white : Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Obx(
                    ()=> ListView.builder(
                    itemCount: display_match.value.toSet().length,
                    itemBuilder: (context, index) {
                      return PlayerTile(
                        match: display_match.value.toSet().toList()[index],
                          // title: display_list.value[index].name,
                          // subtitle: display_list.value[index].position,
                          // player: display_list.value[index]
                      );
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerTile extends StatelessWidget {
  final Match match;

  PlayerTile({required this.match});
  @override
  Widget build(BuildContext context) {
    TeamController teamController = Get.find<TeamController>();
    ManagementController managementController = Get.find<ManagementController>();
    List<Team> teams = teamController.getTeams;
    return GestureDetector(
      onTap: (){
        Get.back();
        managementController.updatingMatch.value = match;
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 30,
              width: 200,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.yellow,
                      alignment: Alignment.center,
                      child: Text('Home'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.purple,
                      child: Text('Away'),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.red,
              height: 60,
              width: 200,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.yellow,
                      alignment: Alignment.center,
                      child: Text('${teams.firstWhere((element) => element.id == match.homeTeam).name}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.purple,
                      child: Text('${teams.firstWhere((element) => element.id == match.awayTeam).name}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

