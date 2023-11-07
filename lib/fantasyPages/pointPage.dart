import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/fantasyPages/playerInfoPage.dart';
import 'package:wild_sport/models/fantasyModel.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:flutter/src/widgets/image.dart' as Image1;
import 'package:wild_sport/models/playerModel.dart'as Image2;
import 'package:wild_sport/models/teamsModel.dart';
import 'package:wild_sport/models/teamsModel.dart' as Icon1;
import 'package:flutter/src/widgets/icon.dart' as Icon2;

class PointPage extends StatefulWidget {
  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    TeamController teamController = Get.find<TeamController>();
    List<Player> players = teamController.getPlayers;
    Fantasy fantasyTeam = userController.myFantasyTeam;
    Map<String, dynamic> lineUp = userController.myPickedTeam;
    Player defaultPlayer = Player(image: Image2.Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '');
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Icon2.Icon(Icons.arrow_back_ios, size: 10,),
                SizedBox(width: 5,),
                Text('Back',
                  style: GoogleFonts.inter(
                      color: Get.isDarkMode? Colors.white : Colors.black,
                      fontSize: 15
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: FutureBuilder(
                  future: userController.fetchGameweeks(userController.myUser),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('No Team Data Available'));
                    } else {
                      return Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Container(
                                      width: 25,
                                    )
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(userController.myUser.teamName!.toUpperCase(),
                                        style: GoogleFonts.inter(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Row(
                                      children: [
                                        Icon2.Icon(Icons.arrow_back_ios, size: 10, color: Colors.transparent,),
                                        SizedBox(width: 5,),
                                        Text('Back',
                                          style: GoogleFonts.inter(
                                              color: Colors.transparent,
                                              fontSize: 15
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      userController.decreasepgw();
                                    },
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Get.isDarkMode? Colors.white : Colors.black,
                                      child: Icon2.Icon(Icons.arrow_back_ios,
                                        color: Get.isDarkMode? Colors.black : Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                        ()=> Text('Game Week ${userController.pointGameweeks.value.firstWhere((element) => element.number == userController.viableGameweeks.value[userController.pointsPageIndex.value] ).number}',
                                      style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      userController.increasepgw();
                                    },
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Get.isDarkMode? Colors.white : Colors.black,
                                      child: Icon2.Icon(Icons.arrow_forward_ios,
                                        color: Get.isDarkMode? Colors.black : Colors.white,
                                        size: 16,
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
                              child: Center(
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Get.isDarkMode? Colors.white : Colors.black,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  alignment: Alignment.center,
                                  child: Obx(
                                        ()=> Text('${userController.gameWeekPoint(userController.viableGameweeks.value[userController.pointsPageIndex.value])}',
                                      style: GoogleFonts.orbitron(
                                          fontSize: 20,
                                          color: Get.isDarkMode? Colors.black : Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: FutureBuilder(
                future: userController.fetchGameweeks(userController.myUser),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('No Team Data Available'));
                  } else {
                    return Points();
                  }
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: FutureBuilder(
                future: userController.fetchGameweeks(userController.myUser),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('No Team Data Available'));
                  } else {
                    return Container(
                      padding: EdgeInsets.only(
                          top: 5
                      ),
                      decoration: BoxDecoration(
                          color: Get.isDarkMode? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).primaryColor,
                          border: Border(
                              top: BorderSide(
                                  width: 2,
                                  color: Get.isDarkMode? Colors.white : Color(0xffCCB28F)
                              )
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Obx(
                                  ()=> PointPlayerCard(
                                    player: players.firstWhere((element) => element.id == userController.pointGameweeks.value[userController.pointsPageIndex.value].subKeeper, orElse: ()=> defaultPlayer),//players.firstWhere((element) => element.id == userController.keeperSub.value, orElse: ()=> defaultPlayer),
                                    gameweek: userController.pointGameweeks.value.firstWhere((element) => element.number == userController.viableGameweeks.value[userController.pointsPageIndex.value] ).number,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 200,
                              child: GetBuilder<UserController>(
                                  builder: (controller) {
                                    return Center(
                                      child: Obx(
                                            ()=> ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: controller.pointGameweeks.value.firstWhere((element) => element.number == controller.viableGameweeks.value[controller.pointsPageIndex.value] ).substitution.length,
                                          itemBuilder: (context, index) {
                                            return Obx(
                                              ()=> PointPlayerCard(
                                                gameweek: userController.pointGameweeks.value.firstWhere((element) => element.number == userController.viableGameweeks.value[userController.pointsPageIndex.value] ).number,
                                                  player: players.firstWhere((element) => element.id == controller.pointGameweeks.value[controller.pointsPageIndex.value].substitution[index], orElse: ()=> defaultPlayer)
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PointPlayerCard extends StatelessWidget {
  final Player player;
  final int gameweek;

  PointPlayerCard({required this.player, required this.gameweek});
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    TeamController teamController = Get.find<TeamController>();
    List<Team> team = teamController.getTeams;
    List<Player> players = teamController.getPlayers;
    Team defaultTeam = Team(icon: Icon1.Icon(name: '', contentType: ''), draw: 0, currentPosition: 0, id: '', name: '', played: 0, win: 0, loss: 0, goals: 0, points: 0, jersey: '', imageUrl: '', yellowCards: 0, redCards: 0, players: [], v: 0, cleanSheets: 0, goalsAgainst: 0);
    Player defaultPlayer = Player(image: Image2.Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '');
    return GestureDetector(
      onTap: (){
        Get.to(()=>PlayerInfoPage(player: player));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 7,
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(3),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor:Get.isDarkMode? Colors.black38 : Colors.black26,
                    child: player.imageUrl != ''?
                    Image1.Image.network(
                      team.firstWhere((element) => element.id == player.team, orElse: () => defaultTeam).imageUrl,
                      fit: BoxFit.fitWidth,
                      height: 100,
                      width: 200,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                          return Center(
                            child: Image1.Image.asset(
                              'assets/icons/badgePlaceholderDark.webp',
                              fit: BoxFit.contain,
                              height: 50,
                              width: 50,
                            ),
                          );
                        } else {
                          return
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Center(
                                child: Image1.Image.asset(
                                  'assets/icons/badgePlaceholderDark.webp',
                                  fit: BoxFit.contain,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            );
                        }
                      },
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Center(
                            child: Image1.Image.asset(
                              'assets/icons/badgePlaceholderDark.webp',
                              fit: BoxFit.contain,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        );
                      },
                    )
                        :
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image1.Image.asset(
                        'assets/icons/badgePlaceholderDark.webp',
                        fit: BoxFit.contain,
                        height: double.maxFinite,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 2,
                    right: -5,
                    child: Obx(
                          ()=> Visibility(
                        visible: (userController.captain.value == player.id) && (!userController.substitutes.contains(player)),
                        child: CircleAvatar(
                          backgroundColor: Get.isDarkMode? Colors.white : Color(0xff4A4138),
                          radius: 10,
                          child:  Text('C',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Get.isDarkMode? Colors.black : Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 2,
                    right: -5,
                    child: Obx(
                          ()=> Visibility(
                        visible: (userController.viceCaptain.value == player.id) && (!userController.substitutes.contains(player)),
                        child: CircleAvatar(
                          backgroundColor: Get.isDarkMode? Colors.white : Color(0xff4A4138),
                          radius: 10,
                          child:  Text('V',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Get.isDarkMode? Colors.black : Colors.white,
                                fontSize: 10
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                width: double.maxFinite,
                color: Color(0xff2F5233),
                child: Text(player.id != ""?
                players.firstWhere((element) => element.id == player.id).name
                    :
                'Default',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: GoogleFonts.montserrat(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff94C973),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)
                    )
                ),
                padding: EdgeInsets.symmetric(vertical: 2),
                width: double.maxFinite,
                child: (player.points?[gameweek] == null)?
                  Text('--',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: GoogleFonts.montserrat(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w500
                    ),
                  )
                :
                  Text('${player.points?[gameweek]}',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: GoogleFonts.montserrat(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w500
                    ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Points extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    TeamController teamController = Get.find<TeamController>();
    List<Player> players = teamController.getPlayers;
    Player defaultPlayer = Player(image: Image2.Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: '', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '');
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(
              Get.isDarkMode? 'assets/images/darkField.webp' : 'assets/images/lightField.webp',
            ),
            fit: BoxFit.fill,
          )
      ),
      child: RefreshIndicator(
        onRefresh: (){
          return Future.delayed(Duration(seconds: 0));
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 7,
              child: GetBuilder<UserController>(
                  builder: (controller) {
                    return Center(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Obx(
                                ()=> PointPlayerCard(
                                  gameweek: userController.pointGameweeks.value.firstWhere((element) => element.number == userController.viableGameweeks.value[userController.pointsPageIndex.value] ).number,
                              player: players.firstWhere((element) => element.id == controller.pointGameweeks.value[controller.pointsPageIndex.value].keeper, orElse: ()=> defaultPlayer),
                            ),
                          );
                        },
                      ),
                    );
                  }
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 7,
              //color: Colors.yellow,
              child: GetBuilder<UserController>(
                  builder: (controller) {
                    return Center(
                      child: Obx(
                            ()=> ListView.builder(
                              padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.pointGameweeks.value.firstWhere((element) => element.number == controller.viableGameweeks.value[controller.pointsPageIndex.value] ).defender.length,
                          itemBuilder: (context, index) {
                            return Obx(
                              ()=> PointPlayerCard(
                                gameweek: userController.pointGameweeks.value.firstWhere((element) => element.number == userController.viableGameweeks.value[userController.pointsPageIndex.value] ).number,
                                player: players.firstWhere((element) => element.id == controller.pointGameweeks.value[controller.pointsPageIndex.value].defender[index], orElse: ()=> defaultPlayer),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 7,
              //color: Colors.red,
              child: GetBuilder<UserController>(
                  builder: (controller) {
                    return Center(
                      child: Obx(
                            ()=> ListView.builder(
                              padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.pointGameweeks.value.firstWhere((element) => element.number == controller.viableGameweeks.value[controller.pointsPageIndex.value] ).midfielder.length,
                          itemBuilder: (context, index) {
                            return Obx(
                              ()=> PointPlayerCard(
                                gameweek: userController.pointGameweeks.value.firstWhere((element) => element.number == userController.viableGameweeks.value[userController.pointsPageIndex.value] ).number,
                                player: players.firstWhere((element) => element.id == controller.pointGameweeks.value[controller.pointsPageIndex.value].midfielder[index], orElse: ()=> defaultPlayer),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 7,
              //color: Colors.blue,
              child: GetBuilder<UserController>(
                  builder: (controller) {
                    return Center(
                      child: Obx(
                            ()=> ListView.builder(
                              padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.pointGameweeks.value.firstWhere((element) => element.number == controller.viableGameweeks.value[controller.pointsPageIndex.value] ).attacker.length,
                          itemBuilder: (context, index) {
                            return Obx(
                              ()=> PointPlayerCard(
                                gameweek: userController.pointGameweeks.value.firstWhere((element) => element.number == userController.viableGameweeks.value[userController.pointsPageIndex.value] ).number,
                                  player: players.firstWhere((element) => element.id == controller.pointGameweeks.value[controller.pointsPageIndex.value].attacker[index], orElse: ()=> defaultPlayer)
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height / 15,
            // )
          ],
        ),
      ),
    );
  }
}

