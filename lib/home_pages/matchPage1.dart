import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:wild_sport/home_pages/matchStatTile.dart';
import 'package:wild_sport/models/matchesModel.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:flutter/src/widgets/image.dart' as MainImage;
import 'package:wild_sport/models/playerModel.dart' as PlayerImage;

import '../controllers/teamsController.dart';

class MatchPage1 extends StatefulWidget {
  final Match matchx;
  MatchPage1({required this.matchx});
  @override
  _MatchPage1State createState() => _MatchPage1State();
}

class _MatchPage1State extends State<MatchPage1> {
  final TeamController _teamController = Get.find<TeamController>();
  CarouselController switchCarouselController = CarouselController();
  var body = [MatchStats(match: Get.arguments['match'],), MatchLineUp(match: Get.arguments['match'],)];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
    Rx<Match> match = widget.matchx.obs;
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios,
                color: isDark? Colors.white: Colors.black,
              ),
              onPressed: (){
                Get.back();
              },
            ),
            title: Text('Match',
              style: TextStyle(
                color: isDark? Colors.white: Colors.black,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              color: Get.theme.primaryColor,
              child: Column(
                children: [
                  Text('${Get.arguments['match'].hour} : ${Get.arguments['match'].minute}',
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MainImage.Image.network(
                                  _teamController.getTeams.firstWhere(
                                          (obj) => obj.id == Get.arguments['match'].homeTeam
                                  ).imageUrl,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.contain,
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                                      return Center(
                                        child: MainImage.Image.asset(
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
                                      child: MainImage.Image.asset(
                                        'assets/icons/badgePlaceholder.webp',
                                        fit: BoxFit.contain,
                                        height: 50,
                                        width: 50,
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 20,
                                    alignment: Alignment.center,
                                    child: Text(
                                      _teamController.getTeams.firstWhere(
                                              (obj) => obj.id == Get.arguments['match'].homeTeam
                                      ).name,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('${Get.arguments['match'].homeScore}  :  ${Get.arguments['match'].awayScore}',
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MainImage.Image.network(
                                  _teamController.getTeams.firstWhere(
                                          (obj) => obj.id == Get.arguments['match'].awayTeam
                                  ).imageUrl,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.contain,
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                                      return Center(
                                        child: MainImage.Image.asset(
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
                                      child: MainImage.Image.asset(
                                        'assets/icons/badgePlaceholder.webp',
                                        fit: BoxFit.contain,
                                        height: 50,
                                        width: 50,
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 20,
                                    alignment: Alignment.center,
                                    child: Text(
                                      _teamController.getTeams.firstWhere(
                                              (obj) => obj.id == Get.arguments['match'].awayTeam
                                      ).name,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600
                                      ),
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
                  //====================Events showcase=======================>
                  Container(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Obx(
                                  ()=> ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: match.value.homeGoalScorers.length,
                                    itemBuilder: (context, index) {
                                      return Tile(
                                        category: 'futbol',
                                        name: 'Default'
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Obx(
                                      ()=> ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: match.value.homePenaltyScorers.length,
                                    itemBuilder: (context, index) {
                                      return Tile(
                                          category: 'scoredPen',
                                          name: 'Default'
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Obx(
                                      ()=> ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: match.value.homePenaltyMissers.length,
                                    itemBuilder: (context, index) {
                                      return Tile(
                                          category: 'missedPen',
                                          name: 'Default'
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Obx(
                                      ()=> ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: match.value.homeRedCard.length,
                                    itemBuilder: (context, index) {
                                      return Tile(
                                          category: 'redCard',
                                          name: 'Default'
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Obx(
                                      ()=> ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: match.value.awayGoalScorers.length,
                                    itemBuilder: (context, index) {
                                      return Tile(
                                          category: 'futbol',
                                          name: 'Default'
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Obx(
                                      ()=> ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: match.value.awayPenaltyScorers.length,
                                    itemBuilder: (context, index) {
                                      return Tile(
                                          category: 'scoredPen',
                                          name: 'Default'
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Obx(
                                      ()=> ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: match.value.awayPenaltyMissers.length,
                                    itemBuilder: (context, index) {
                                      return Tile(
                                          category: 'missedPen',
                                          name: 'Default'
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Obx(
                                      ()=> ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: match.value.awayRedCard.length,
                                    itemBuilder: (context, index) {
                                      return Tile(
                                          category: 'redCard',
                                          name: 'Default'
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text('Stats Match-Up')
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child:                     Container(
                  padding: EdgeInsets.all(5),
                  child: SlidingSwitch(
                    value: false,
                    width: Get.width * 0.75,
                    onChanged: (bool value) {
                      switchCarouselController.nextPage(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.linear
                      );
                    },
                    height : 35,
                    animationDuration : const Duration(milliseconds: 250),
                    onTap:(){},
                    onDoubleTap:(){},
                    onSwipe:(){},
                    textOff : "Statistics",
                    textOn : "Line Up",
                    contentSize: 15,
                    colorOn : isDark? Colors.white: Colors.black,
                    colorOff : isDark? Colors.white : Colors.black,
                    background : isDark? Get.theme.scaffoldBackgroundColor : Color(0xffe4e5eb),
                    buttonColor : isDark? Color(0xff00493A) : Color(0xfff7f5f7),
                    inactiveColor : const Color(0xff636f7b),
                  )
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: CarouselSlider.builder(
                itemCount: 2,
                carouselController: switchCarouselController,
                itemBuilder: (context, index, realIndex) {
                  return body[index];
                },
                options: CarouselOptions(
                    viewportFraction: 1.0,
                    height: 600,
                    autoPlay: false,
                    enlargeCenterPage: false,
                    onPageChanged: (index, reason) => {
                      activeIndex = index,
                    }
                )
            ),
          ),
        ],
      ),
    );
  }
}

class MatchStats extends StatelessWidget {
  final Match match;

  MatchStats({required this.match});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20)
        ),
        child: Container(
          color: Colors.orange,
          height: 600,
          child: Stack(
            children: [
              Container(
                child: MainImage.Image.asset(
                  'assets/images/matchbox4.jpg',
                  height: double.maxFinite,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.black87,//Get.theme.primaryColor.withOpacity(0.3),
              ),
              Container(
                height: 500,
                child: Column(
                  children: [
                    MatchStatTile(
                        home: match.homeScore,
                        property: 'Goals',
                        away: match.awayScore
                    ),
                    MatchStatTile(
                        home: match.homePenaltyMissers.length + match.homePenaltyScorers.length,
                        property: 'Penalties',
                        away: match.awayPenaltyMissers.length + match.awayPenaltyScorers.length
                    ),
                    MatchStatTile(
                        home: match.homeYellowCard.length,
                        property: 'Yellow Card',
                        away: match.awayYellowCard.length
                    ),
                    MatchStatTile(
                        home: match.homeRedCard.length,
                        property: 'Red Cards',
                        away: match.awayRedCard.length
                    ),
                    MatchStatTile(
                        home: match.homeOffsides.length,
                        property: 'Offsides',
                        away: match.awayOffsides.length
                    ),
                    MatchStatTile(
                        home: match.homeCorners,
                        property: 'Corners',
                        away: match.awayCorners
                    ),
                    MatchStatTile(
                        home: match.homeOwnGoals.length,
                        property: 'Own Goals',
                        away: match.awayOwnGoals.length
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MatchLineUp extends StatelessWidget {
  final Match match;
  MatchLineUp({required this.match});
  @override
  Widget build(BuildContext context) {
    TeamController teamController = Get.find<TeamController>();
    List<Player> players = teamController.getPlayers;
    Player defaultPlayer = Player(image: PlayerImage.Image(name: '', contentType: ''), fantasyPrice: 0, id: '', name: 'Unavailable', team: '', age: 0, number: 0, appearances: 0, goals: 0, subs: 0, assists: 0, fantasyPoints: 0, position: '', yellowCards: 0, redCards: 0, v: 0, cleanSheets: 0, currentFantasyPoints: 0, ownGoals: 0, imageUrl: '');
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20)
          )
        ),
        height: 600,
        width: double.maxFinite,
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                        child: Text("Home Line Up")
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                        child: Text("Away Line Up")
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: match.homeLineUp.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Text(
                            players.firstWhere((element) => element.id == match.homeLineUp[index], orElse: ()=>defaultPlayer).name,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: match.awayLineUp.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Text(
                            players.firstWhere((element) => element.id == match.awayLineUp[index], orElse: ()=> defaultPlayer).name,
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: Text("Home Substitutes")
                    ),
                  ),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: Text("Away Substitutes")
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: match.homeSubs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Text(
                            players.firstWhere((element) => element.id == match.homeSubs[index], orElse: ()=>defaultPlayer).name,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: match.awaySubs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Text(
                            players.firstWhere((element) => element.id == match.awaySubs[index], orElse: ()=> defaultPlayer).name,
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final String category;
  final String name;

  Tile({required this.category, required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white12,
              child: MainImage.Image.asset(
                'assets/icons/${category}.webp',
                fit: BoxFit.contain,
                height: 15,
                width: 15,
              ),
            ),
          ),
          Text(name,
            style: TextStyle(
              color: Get.isDarkMode? Colors.white70 : Colors.black54
            ),
          )
        ],
      ),
    );
  }
}

