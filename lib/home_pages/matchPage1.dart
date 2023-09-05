import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/home_pages/matchStatTile.dart';

import '../controllers/teamsController.dart';

class MatchPage1 extends StatefulWidget {
  @override
  _MatchPage1State createState() => _MatchPage1State();
}

class _MatchPage1State extends State<MatchPage1> {
  final TeamController _teamController = Get.find<TeamController>();
  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
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
                                Image.network(
                                  _teamController.getTeams.firstWhere(
                                          (obj) => obj.id == Get.arguments['match'].homeTeam
                                  ).imageUrl,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.contain,
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
                                Image.network(
                                  _teamController.getTeams.firstWhere(
                                          (obj) => obj.id == Get.arguments['match'].awayTeam
                                  ).imageUrl,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.contain,
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
                  Container(
                    width: double.maxFinite,
                    height: 70,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.red,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.yellow,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text('Statistic Match')
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
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
                        child: Image.asset(
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
                              home: 17,
                              property: 'Shots',
                              away: 17
                            ),
                            MatchStatTile(
                                home: 17,
                                property: 'Shots on Target',
                                away: 17
                            ),
                            MatchStatTile(
                                home: 17,
                                property: 'Fouls',
                                away: 17
                            ),
                            MatchStatTile(
                                home: 17,
                                property: 'Yellow Cards',
                                away: 17
                            ),
                            MatchStatTile(
                                home: 17,
                                property: 'Red Cards',
                                away: 17
                            ),
                            MatchStatTile(
                                home: 17,
                                property: 'Offsides',
                                away: 17
                            ),
                            MatchStatTile(
                                home: 17,
                                property: 'Corners',
                                away: 17
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
