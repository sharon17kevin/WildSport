import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wild_sport/components/intTextField.dart';
import 'package:wild_sport/components/textfield.dart';
import 'package:wild_sport/controllers/managementController.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:wild_sport/models/teamsModel.dart';
import 'package:wild_sport/models/teamsModel.dart' as Icon1;
import 'package:wild_sport/morePages/selectMatch.dart';
import 'package:wild_sport/stat_pages/selectPlayer.dart';

class MatchManagement extends StatefulWidget {
  @override
  _MatchManagementState createState() => _MatchManagementState();
}

class _MatchManagementState extends State<MatchManagement> {
  ManagementController managementController = Get.find<ManagementController>();
  @override
  Widget build(BuildContext context) {
    //var defaultTeam = Team(icon: Icon1.Icon(name: '',contentType: ''), draw: 0, currentPosition: 0, id: '', name: 'None', played: 0, win: 0, loss: 0, goals: 0, points: 0, jersey: '', imageUrl: '', yellowCards: 0, redCards: 0, players: [], v: 0, cleanSheets: 0, goalsAgainst: 0).obs;
    TeamController teamController = Get.find<TeamController>();
    List<Player> players = teamController.getPlayers;
    List<Team> teams = teamController.getTeams;
    var homeLineUp = <Player>[].obs;
    var awayLineUp = <Player>[].obs;
    var selectedTeam = teams[0].obs;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Get.to(()=>SelectMatch());
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Text('Update Match'),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Home Team: ${teams.firstWhere((element) => element.id == managementController.updatingMatch.value.homeTeam).name}'),
                  Text('Away Team: ${teams.firstWhere((element) => element.id == managementController.updatingMatch.value.awayTeam).name}')
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              color: Colors.black12,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Home Line Up'),
                  Flexible(
                    child: managementController.updatingMatch.value == null?
                        Container(
                          child: Text('No data just yet'),
                        )
                    :
                    Obx(
                      ()=> ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: managementController.updatingMatch.value.homeLineUp.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Text(players.firstWhere((element) => element.id == managementController.updatingMatch.value.homeLineUp[index]).name),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25,),
            Container(
              color: Colors.black12,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Away Line Up'),
                  Flexible(
                    child: managementController.updatingMatch.value == null?
                    Container(
                      child: Text('No data just yet'),
                    )
                        :
                    Obx(
                          ()=> ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: managementController.updatingMatch.value.awayLineUp.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Text(players.firstWhere((element) => element.id == managementController.updatingMatch.value.awayLineUp[index]).name),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
