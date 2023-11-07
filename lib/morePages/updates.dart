import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:wild_sport/models/teamsModel.dart';
import 'package:wild_sport/stat_pages/selectPlayer.dart';

class Updates extends StatefulWidget {
  @override
  _UpdatesState createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  @override
  Widget build(BuildContext context) {
    //var defaultTeam = Team(icon: Icon1.Icon(name: '',contentType: ''), draw: 0, currentPosition: 0, id: '', name: 'None', played: 0, win: 0, loss: 0, goals: 0, points: 0, jersey: '', imageUrl: '', yellowCards: 0, redCards: 0, players: [], v: 0, cleanSheets: 0, goalsAgainst: 0).obs;
    TeamController teamController = Get.find<TeamController>();
    List<Team> teams = teamController.getTeams;
    var homeLineUp = <Player>[].obs;
    var awayLineUp = <Player>[].obs;
    var selectedTeam = teams[0].obs;
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  color: Colors.grey,
                ),
                child: Obx(
                      ()=> DropdownButton<Team>(
                      value: selectedTeam.value,
                      items: teams.map((Team e) {
                        return DropdownMenuItem<Team>(
                          value: e,
                          child: Text(e.name),
                        );
                      }).toList(),
                      style: TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (Team? value){
                        selectedTeam.value = value!;
                      }
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(height: 25,),
              GestureDetector(
                onTap: () async{
                  Get.to(()=> SelectPlayer(
                    team: selectedTeam.value.id,
                  ))?.then((value) {
                    if (value != null) {
                      homeLineUp.add(value);
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.red,
                  child: Text('Add Player'),
                ),
              ),
              SizedBox(height: 25,),
            ],
          ),
        ),
      ),
    );
  }
}
