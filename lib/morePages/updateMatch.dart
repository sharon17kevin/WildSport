import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wild_sport/controllers/matchesController.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/models/matchesModel.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:wild_sport/models/teamsModel.dart';
import 'package:flutter/src/widgets/icon.dart' as MainIcon;
import 'package:flutter/src/widgets/image.dart' as MainImage;
import 'package:wild_sport/stat_pages/selectPlayer.dart';

class UpdateMatch extends StatelessWidget {
  final Rx<Match> match;

  UpdateMatch({required this.match});
  void showError() {
    Get.snackbar(
        'Invalid',
        'Cannot make that update',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        isDismissible: true,
        backgroundColor: Colors.red,
        icon: MainIcon.Icon(Icons.info)
    );
  }

  void showConfirmation() {
    Get.snackbar(
        'Success',
        'Confirmation of update',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        isDismissible: true,
        icon: MainIcon.Icon(Icons.info)
    );
  }

  @override
  Widget build(BuildContext context) {
    RxList<String> homeGoalScorers = match.value.homeGoalScorers.map((e) => e.player).toList().obs;
    RxList<String> awayGoalScorers = match.value.awayGoalScorers.map((e) => e.player).toList().obs;
    TeamController teamController = Get.find<TeamController>();
    //UserController userController = Get.find<UserController>();
    MatchesController matchesController = Get.find<MatchesController>();
    List<Team> teams = teamController.getTeams;
    List<Player> players = teamController.getPlayers;
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
        title: Text('Update Match'),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15,),
              Container(
                width: double.maxFinite,
                height: 150,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(DateFormat('EEEE, MMM d, y').format(match.value.date)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              child: Text('Home: ${teams.firstWhere((element) => element.id == match.value.homeTeam).name}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              child: Text('Away: ${teams.firstWhere((element) => element.id == match.value.awayTeam).name}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MainImage.Image.network(
                            teams.firstWhere(
                                    (obj) => obj.id == match.value.homeTeam
                            ).imageUrl,
                            height: 70,
                            width: 70,
                            fit: BoxFit.contain,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                                return Center(
                                  child: MainImage.Image.asset(
                                    'assets/icons/badgePlaceholder.webp',
                                    fit: BoxFit.contain,
                                    height: 25,
                                    width: 25,
                                  ),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return Center(
                                child: MainImage.Image.asset(
                                  'assets/icons/badgePlaceholder.webp',
                                  fit: BoxFit.contain,
                                  height: 25,
                                  width: 25,
                                ),
                              );
                            },
                          ),
                          MainImage.Image.network(
                            teams.firstWhere(
                                    (obj) => obj.id == match.value.awayTeam
                            ).imageUrl,
                            height: 70,
                            width: 70,
                            fit: BoxFit.contain,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                                return Center(
                                  child: MainImage.Image.asset(
                                    'assets/icons/badgePlaceholder.webp',
                                    fit: BoxFit.contain,
                                    height: 25,
                                    width: 25,
                                  ),
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator()
                                );
                              }
                            },
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return Center(
                                child: MainImage.Image.asset(
                                  'assets/icons/badgePlaceholder.webp',
                                  fit: BoxFit.contain,
                                  height: 25,
                                  width: 25,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Obx(()=> Text("${match.value.homeGoalScorers.length} : ${match.value.awayGoalScorers.length}",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
              ),
              SizedBox(height: 15,),
              //<==================Line Ups======================================================>
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Line Up Updates'),
              ),
              Container(
                color: Colors.black38,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Home Line Up'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.homeTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    if (match.value.homeLineUp.contains(value.id) || match.value.homeSubs.contains(value.id)){
                                      showError();
                                    }else {
                                      match.value.homeLineUp.add(value.id);
                                      match.refresh();
                                      showConfirmation();
                                    }
                                  } else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:  match.value.homeLineUp.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerTile(
                                              category: 'homeLineUp',
                                              player: players.firstWhere((element) => element.id == match.value.homeLineUp[index]),
                                              masterList: match.value.homeLineUp,
                                              match: match,
                                            )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Away Line Up'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.awayTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    if (match.value.awayLineUp.contains(value.id) || match.value.awaySubs.contains(value.id)){
                                      showError();
                                    } else {
                                      match.value.awayLineUp.add(value.id);
                                      match.refresh();
                                      showConfirmation();
                                    }
                                  }else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: match.value.awayLineUp.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerTile(
                                              category: 'awayLineUp',
                                          player: players.firstWhere((element) => element.id == match.value.awayLineUp[index]),
                                              masterList: match.value.awayLineUp,
                                              match: match,
                                        )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5,),
              //<==================Substitutes======================================================>
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Substitutes Updates'),
              ),
              Container(
                color: Colors.black38,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Home Substitutes'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.homeTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    if (match.value.homeSubs.contains(value.id) || match.value.homeLineUp.contains(value.id)){
                                      showError();
                                    }else {
                                      match.value.homeSubs.add(value.id);
                                      match.refresh();
                                      showConfirmation();
                                    }
                                  }else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                    ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:  match.value.homeSubs.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerTile(
                                              category: 'homeSubs',
                                          player: players.firstWhere((element) => element.id == match.value.homeSubs[index]),
                                              masterList: match.value.homeSubs,
                                              match: match,
                                        )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Away Substitutes'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.awayTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    if (match.value.awaySubs.contains(value.id) || match.value.awayLineUp.contains(value.id)){
                                      showError();
                                    } else {
                                      match.value.awaySubs.add(value.id);
                                      match.refresh();
                                      showConfirmation();
                                    }
                                  } else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                    ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: match.value.awaySubs.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerTile(
                                              category: 'awaySubs',
                                          player: players.firstWhere((element) => element.id == match.value.awaySubs[index]),
                                              masterList: match.value.awaySubs!,
                                              match: match,
                                        )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //<==================Goal Scorers======================================================>
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Goal Scorers Updates'),
              ),
              Container(
                color: Colors.black38,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Home GoalScorers'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.homeTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    AwayGoalScorer agw = AwayGoalScorer(player: value.id, time: -1);
                                    match.value.homeGoalScorers.add(agw);
                                    match.refresh();
                                    showConfirmation();
                                  } else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                    ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:  match.value.homeGoalScorers.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerStatsTile(
                                                playerStatsModel: match.value.homeGoalScorers[index],
                                                match: match,
                                              masterList: match.value.homeGoalScorers,
                                            )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Away Goal Scorers'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.awayTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    AwayGoalScorer agw = AwayGoalScorer(player: value.id, time: -1);
                                    match.value.awayGoalScorers.add(agw);
                                    match.refresh();
                                    showConfirmation();
                                  } else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                    ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: match.value.awayGoalScorers.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerStatsTile(
                                                playerStatsModel: match.value.awayGoalScorers[index],
                                                match: match,
                                              masterList: match.value.awayGoalScorers,
                                            )
                                        //         PlayerTile(
                                        //   player: players.firstWhere((element) => element.id == match.value.awayLineUp[index]),
                                        // )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //<======================Penaly Scorers================================================>
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Penalty Scorers Updates'),
              ),
              Container(
                color: Colors.black38,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Home Penalty Scorers'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.homeTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    AwayGoalScorer agw = AwayGoalScorer(player: value.id, time: -1);
                                    match.value.homePenaltyScorers.add(agw);
                                    match.refresh();
                                    showConfirmation();
                                  }else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                    ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:  match.value.homePenaltyScorers.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerStatsTile(
                                            playerStatsModel: match.value.homePenaltyScorers[index],
                                            match: match,
                                              masterList: match.value.homePenaltyScorers,
                                        )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Away Penalty Scorers'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.awayTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    AwayGoalScorer agw = AwayGoalScorer(player: value.id, time: -1);
                                    match.value.awayPenaltyScorers.add(agw);
                                    match.refresh();
                                    showConfirmation();
                                  }else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                    ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: match.value.awayPenaltyScorers.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerStatsTile(
                                            playerStatsModel: match.value.awayPenaltyScorers[index],
                                            match: match,
                                              masterList: match.value.awayPenaltyScorers,
                                        )
                                      //         PlayerTile(
                                      //   player: players.firstWhere((element) => element.id == match.value.awayLineUp[index]),
                                      // )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //<==============Penalty Missers=================================>
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Penalty Missers Updates'),
              ),
              Container(
                color: Colors.black38,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Home Penalty Missers'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.homeTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    AwayGoalScorer agw = AwayGoalScorer(player: value.id, time: -1);
                                    match.value.homePenaltyMissers.add(agw);
                                    match.refresh();
                                    showConfirmation();
                                  }else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                    ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:  match.value.homePenaltyMissers.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerStatsTile(
                                            playerStatsModel: match.value.homePenaltyMissers[index],
                                            match: match,
                                              masterList: match.value.homePenaltyMissers,
                                        )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Away Penalty Missers'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.awayTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    AwayGoalScorer agw = AwayGoalScorer(player: value.id, time: -1);
                                    match.value.awayPenaltyMissers.add(agw);
                                    match.refresh();
                                    showConfirmation();
                                  }else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                    ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: match.value.awayPenaltyMissers.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerStatsTile(
                                            playerStatsModel: match.value.awayPenaltyMissers[index],
                                            match: match,
                                              masterList: match.value.awayPenaltyMissers,
                                        )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //<=======================Own Goals============================>
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Own Goals Updates'),
              ),
              Container(
                color: Colors.black38,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Home Own Goals'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.homeTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    AwayGoalScorer agw = AwayGoalScorer(player: value.id, time: -1);
                                    match.value.homeOwnGoals.add(agw);
                                    match.refresh();
                                    showConfirmation();
                                  }else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                    ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:  match.value.homeOwnGoals.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerStatsTile(
                                            playerStatsModel: match.value.homeOwnGoals[index],
                                            match: match,
                                              masterList: match.value.homeOwnGoals,
                                        )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Away Own Goals'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.awayTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    AwayGoalScorer agw = AwayGoalScorer(player: value.id, time: -1);
                                    match.value.awayOwnGoals.add(agw);
                                    match.refresh();
                                    showConfirmation();
                                  }else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                    ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: match.value.awayOwnGoals.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerStatsTile(
                                            playerStatsModel: match.value.awayOwnGoals[index],
                                            match: match,
                                              masterList: match.value.awayOwnGoals,
                                        )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //==================Red Cards==============================>
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Red Card Updates'),
              ),
              Container(
                color: Colors.black38,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Home Red Cards'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.homeTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    AwayGoalScorer agw = AwayGoalScorer(player: value.id, time: -1);
                                    match.value.homeRedCard.add(agw);
                                    match.refresh();
                                    showConfirmation();
                                  }else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                    ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:  match.value.homeRedCard.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerStatsTile(
                                            playerStatsModel: match.value.homeRedCard[index],
                                            match: match,
                                              masterList: match.value.homeRedCard,
                                        )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Away Red Cards'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.awayTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    AwayGoalScorer agw = AwayGoalScorer(player: value.id, time: -1);
                                    match.value.awayRedCard.add(agw);
                                    match.refresh();
                                    showConfirmation();
                                  }else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                    ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: match.value.awayRedCard.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerStatsTile(
                                            playerStatsModel: match.value.awayRedCard[index],
                                            match: match,
                                              masterList: match.value.awayRedCard,
                                        )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //=======================Yellow Card==========================>
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Yellow Card Updates'),
              ),
              Container(
                color: Colors.black38,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Home Yellow Cards'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.homeTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    AwayGoalScorer agw = AwayGoalScorer(player: value.id, time: -1);
                                    match.value.homeYellowCard.add(agw);
                                    match.refresh();
                                    showConfirmation();
                                  }else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                    ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:  match.value.homeYellowCard.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerStatsTile(
                                            playerStatsModel: match.value.homeYellowCard[index],
                                            match: match,
                                              masterList: match.value.homeYellowCard,
                                        )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Away Yellow Cards'),
                            GestureDetector(
                              onTap: (){
                                Get.to(() => SelectPlayer(
                                  team: teams.firstWhere((element) => element.id == match.value.awayTeam).id,
                                ))?.then((value){
                                  if(value != null) {
                                    AwayGoalScorer agw = AwayGoalScorer(player: value.id, time: -1);
                                    match.value.awayYellowCard.add(agw);
                                    match.refresh();
                                    showConfirmation();
                                  }else {
                                    showError();
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Get.isDarkMode? Colors.white : Colors.black,
                                child: MainIcon.Icon(Icons.add,
                                  color: Get.isDarkMode? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Obx(
                                    ()=> ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: match.value.awayYellowCard.length,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                            ()=> PlayerStatsTile(
                                            playerStatsModel: match.value.awayYellowCard[index],
                                            match: match,
                                              masterList: match.value.awayYellowCard,
                                        )
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 25,),
              Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap:  (){

                  },
                  child: Container(
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode? Colors.white : Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    padding: EdgeInsets.all(20),
                    child: Text("Save",
                      style: TextStyle(
                        color: Get.isDarkMode? Colors.black: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerTile extends StatelessWidget {
  Player player;
  String category;
  List<String> masterList;
  Rx<Match> match;

  PlayerTile({required this.player, required this.category, required this.masterList, required this.match});
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 60,
      width: double.maxFinite,
      color: Colors.blueGrey,
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                  onPressed: (){
                    masterList.remove(player.id);
                    match.refresh();
                  },
                  icon: MainIcon.Icon(Icons.delete, color: Colors.white,)
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                child: Text(player.name,
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerStatsTile extends StatelessWidget {
  AwayGoalScorer playerStatsModel;
  Rx<Match> match;
  List<AwayGoalScorer> masterList;

  PlayerStatsTile({required this.playerStatsModel, required this.match, required this.masterList});
  @override
  Widget build(BuildContext context) {
    TeamController teamController = Get.find<TeamController>();
    List<Player> players = teamController.getPlayers;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 60,
      width: double.maxFinite,
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.blueGrey,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                          onPressed: (){
                            masterList.remove(playerStatsModel);
                            match.refresh();
                          },
                          icon: MainIcon.Icon(Icons.delete, color: Colors.white,)
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text( players.firstWhere((element) => element.id == playerStatsModel.player).name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: CategoryBox(
                    category: "Time",
                  awayGoalScorer: playerStatsModel,
                  match: match,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class CategoryBox extends StatelessWidget {
  final String category;
  final AwayGoalScorer awayGoalScorer;
  final Rx<Match> match;

  CategoryBox({required this.category, required this.awayGoalScorer, required this.match});
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    controller.addListener(() {
      if(controller.text.length >0) {
        awayGoalScorer.time = int.parse(controller.text);
        print(awayGoalScorer.time);
      }
    });
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 50,
      height: 60,
      color: Colors.black54,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('${category}',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),
          ),
          Container(
            width: 40,
            height: 40,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 20, height: 1.5, color: Colors.black),
              cursorHeight: 25,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(1),
                hintText: awayGoalScorer.time == -1? '--' :'${awayGoalScorer.time}',
              ),
            ),
          )
        ],
      ),
    );
  }
}

