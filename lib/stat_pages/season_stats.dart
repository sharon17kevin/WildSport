import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:wild_sport/models/teamsModel.dart';
import 'package:flutter/src/widgets/icon.dart' as Icon1;
import 'package:wild_sport/stat_pages/singleStatBox.dart';
import 'package:flutter/src/widgets/image.dart' as Image1;

class TeamSeasonStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
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
                  Icon1.Icon(Icons.arrow_back_ios, size: 10,),
                  SizedBox(width: 5,),
                  Text('Back')
                ],
              ),
            ),
          ),
        ),
        title: Text(
          'Team Stats',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Get.isDarkMode? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TeamStatBox()
        ],
      ),
    );
  }
}

class PlayerSeasonStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
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
                  Icon1.Icon(Icons.arrow_back_ios, size: 10,),
                  SizedBox(width: 5,),
                  Text('Back')
                ],
              ),
            ),
          ),
        ),
        title: Text(
          'Player Stats',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Get.isDarkMode? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          PlayerStatBox()
        ],
      ),
    );
  }
}

class TeamStatBox extends StatelessWidget {
  final TeamController _teamController = Get.find<TeamController>();
  @override
  Widget build(BuildContext context) {
    List<Team> goals = _teamController.getTeamGoal;
    Map<String, int> goalMap = Map.fromIterable(
      goals,
      key: (object) => object.name,
      value: (object) => object.goals,
    );
    List<Team> wins = _teamController.getTeamWin;
    Map<String, int> winMap = Map.fromIterable(
      wins,
      key: (object) => object.name,
      value: (object) => object.win,
    );
    List<Team> losses = _teamController.getTeamLoss;
    Map<String, int> lossMap = Map.fromIterable(
      losses,
      key: (object) => object.name,
      value: (object) => object.loss,
    );
    List<Team> draws = _teamController.getTeamDraw;
    Map<String, int> drawMap = Map.fromIterable(
      draws,
      key: (object) => object.name,
      value: (object) => object.draw,
    );
    List<Team> redCards = _teamController.getTeamRedCard;
    Map<String, int> redCardMap = Map.fromIterable(
      redCards,
      key: (object) => object.name,
      value: (object) => object.redCards,
    );
    List<Team> yellowCards = _teamController.getTeamYellowCard;
    Map<String, int> yellowCardMap = Map.fromIterable(
      yellowCards,
      key: (object) => object.name,
      value: (object) => object.yellowCards,
    );
    List<Team> cleanSheets = _teamController.getTeamCleanSheet;
    Map<String, int> cleanSheetMap = Map.fromIterable(
      cleanSheets,
      key: (object) => object.name,
      value: (object) => object.cleanSheets,
    );
    List<Team> goalsAgainst = _teamController.getTeamGoalsAgainst;
    Map<String, int> goalsAgainstMap = Map.fromIterable(
      goalsAgainst,
      key: (object) => object.name,
      value: (object) => object.goalsAgainst,
    );
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        //Goal stats--------------------->
        StatsBox(
          title: "Most Goals",
          infoMap: goalMap,
        ),
        //Wins stats------------------>
        StatsBox(
          title: "Most Wins",
          infoMap: winMap,
        ),
        //Loss stats-------------->
        StatsBox(
          title: "Most Losses",
          infoMap: lossMap,
        ),
        //Draws Stats ---------------->
        StatsBox(
          title: "Most Draws",
          infoMap: drawMap,
        ),
        //Red Card Stats-------------->
        StatsBox(
          title: "Most Red Cards",
          infoMap: redCardMap,
        ),
        //Yellow Card stats------------>
        StatsBox(
          title: "Most Yellow Cards",
          infoMap: yellowCardMap,
        ),
        //Clean Sheets stats----------->
        StatsBox(
          title: "Most Clean Sheets",
          infoMap: cleanSheetMap,
        ),
        //Goals Against stats---------->
        StatsBox(
          title: "Most Goals Conceded ",
          infoMap: goalsAgainstMap,
        ),
      ],
    );
  }
}

class PlayerStatBox extends StatelessWidget {
  final TeamController _teamController = Get.find<TeamController>();
  @override
  Widget build(BuildContext context) {
    List<Player> goals = _teamController.getPlayerGoal;
    Map<String, int> goalMap = Map.fromIterable(
      goals,
      key: (object) => object.name,
      value: (object) => object.goals,
    );
    List<Player> assists = _teamController.getPlayerAssist;
    Map<String, int> assistMap = Map.fromIterable(
      assists,
      key: (object) => object.name,
      value: (object) => object.assists,
    );
    List<Player> subs = _teamController.getPlayerSub;
    Map<String, int> subMap = Map.fromIterable(
      subs,
      key: (object) => object.name,
      value: (object) => object.subs,
    );
    List<Player> yellowCards = _teamController.getPlayerYellowCard;
    Map<String, int> yellowCardMap = Map.fromIterable(
      yellowCards,
      key: (object) => object.name,
      value: (object) => object.yellowCards,
    );
    List<Player> redCards = _teamController.getPlayerRedCard;
    Map<String, int> redCardMap = Map.fromIterable(
      redCards,
      key: (object) => object.name,
      value: (object) => object.redCards,
    );
    List<Player> cleanSheets = _teamController.getPlayerCleanSheets;
    Map<String, int> cleanSheetMap = Map.fromIterable(
      cleanSheets,
      key: (object) => object.name,
      value: (object) => object.cleanSheets,
    );
    // List<Player> fantasyPoints = _teamController.getPlayerFantasyPoints;
    // Map<String, int> fantasyPointMap = Map.fromIterable(
    //   fantasyPoints,
    //   key: (object) => object.name,
    //   value: (object) => object.cleanSheets,
    // );
    // List<Player> currentFantasyPoints = _teamController.getPlayerCurrentFantasyPoints;
    // Map<String, int> goalsAgainstMap = Map.fromIterable(
    //   currentFantasyPoints,
    //   key: (object) => object.name,
    //   value: (object) => object.goalsAgainst,
    // );
    List<Player> ownGoals = _teamController.getPlayerOwnGoal;
    Map<String, int> ownGoalMap = Map.fromIterable(
      ownGoals,
      key: (object) => object.name,
      value: (object) => object.ownGoals,
    );
    List<Player> appearances = _teamController.getPlayerAppearances;
    Map<String, int> appearancesMap = Map.fromIterable(
      appearances,
      key: (object) => object.name,
      value: (object) => object.appearances,
    );
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        //Goal stats--------------------->
        PlayerStatsBox(
          title: "Most Goals",
          infoMap: goalMap,
        ),
        //Wins stats------------------>
        PlayerStatsBox(
          title: "Most Assists",
          infoMap: assistMap,
        ),
        //Loss stats-------------->
        PlayerStatsBox(
          title: "Most Appearances",
          infoMap: appearancesMap,
        ),
        //Draws Stats ---------------->
        PlayerStatsBox(
          title: "Most Subs",
          infoMap: subMap,
        ),
        //Red Card Stats-------------->
        PlayerStatsBox(
          title: "Most Red Cards",
          infoMap: redCardMap,
        ),
        //Yellow Card stats------------>
        PlayerStatsBox(
          title: "Most Yellow Cards",
          infoMap: yellowCardMap,
        ),
        //Clean Sheets stats----------->
        PlayerStatsBox(
          title: "Most Clean Sheets",
          infoMap: cleanSheetMap,
        ),
        //Goals Against stats---------->
        PlayerStatsBox(
          title: "Most ownGoals ",
          infoMap: ownGoalMap,
        ),
      ],
    );
  }
}

class StatsBox extends StatelessWidget {
  final Map infoMap;
  final String title;
  StatsBox({required this.infoMap, required this.title});
  TeamController _teamController = Get.find<TeamController>();

  @override
  Widget build(BuildContext context) {
    List<Team> team = _teamController.getTeams;
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color: Color(0xff27AAE1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
              )
            ),
            child: Text(title,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Get.isDarkMode? Colors.black : Colors.white
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                final key = infoMap.keys.elementAt(index);
                final value = infoMap[key];
                return ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    child: Image1.Image.network(
                      team.firstWhere((obj) => obj.name == key).imageUrl,
                      height: 50,
                      width: 50,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                          return Center(
                            child: Image1.Image.asset(
                              'assets/icons/badgePlaceholder.webp',
                              fit: BoxFit.contain,
                              height: 50,
                              width: 50,
                            ),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return Center(
                          child: Image1.Image.asset(
                            'assets/icons/badgePlaceholder.webp',
                            fit: BoxFit.contain,
                            height: 50,
                            width: 50,
                          ),
                        );
                      },
                    ),
                  ),
                  title: Text('${key}',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: Text('${value}',
                    style: GoogleFonts.sourceCodePro(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Get.isDarkMode? Colors.white : Colors.black
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            width: double.maxFinite,
            child: Container(
              width: 150,
              child: TextButton(
                onPressed: (){
                  Get.to(
                    SingleStatBox(),
                    arguments: {
                      'infoMap': infoMap,
                      'title': title,
                    }
                  );
                },
                child: Row(
                  children: [
                    Text("View More",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 7,),
                    Icon1.Icon(Icons.arrow_forward_ios, size: 15,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PlayerStatsBox extends StatelessWidget {
  final Map infoMap;
  final String title;
  PlayerStatsBox({required this.infoMap, required this.title});
  TeamController _teamController = Get.find<TeamController>();

  @override
  Widget build(BuildContext context) {
    List<Team> team = _teamController.getTeams;
    List<Player> player = _teamController.getPlayers;
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
                color: Color(0xff27AAE1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                )
            ),
            child: Text(title,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Get.isDarkMode? Colors.black : Colors.white
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                final key = infoMap.keys.elementAt(index);
                final value = infoMap[key];
                return ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    child: Image1.Image.network(
                      team.firstWhere((element) => element.players.contains(player.firstWhere((obj) => obj.name == key).id)).imageUrl,
                      height: 50,
                      width: 50,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                          return Center(
                            child: Image1.Image.asset(
                              'assets/icons/badgePlaceholder.webp',
                              fit: BoxFit.contain,
                              height: 50,
                              width: 50,
                            ),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return Center(
                          child: Image1.Image.asset(
                            'assets/icons/badgePlaceholder.webp',
                            fit: BoxFit.contain,
                            height: 50,
                            width: 50,
                          ),
                        );
                      },
                    ),
                  ),
                  title: Text('${key}',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: Text('${value}',
                    style: GoogleFonts.sourceCodePro(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode? Colors.white : Colors.black
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            width: double.maxFinite,
            child: Container(
              width: 150,
              child: TextButton(
                onPressed: (){
                  Get.to(
                      SingleStatBox(),
                      arguments: {
                        'infoMap': infoMap,
                        'title': title,
                      }
                  );
                },
                child: Row(
                  children: [
                    Text("View More",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 7,),
                    Icon1.Icon(Icons.arrow_forward_ios, size: 15,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}



