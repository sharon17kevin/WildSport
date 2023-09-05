import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/components/fantasyblocks.dart';
import 'package:wild_sport/components/playerCard.dart';
import 'package:wild_sport/helperPages/leagueTable.dart';
import 'package:wild_sport/helperPages/pickTeam.dart';
import 'package:wild_sport/helperPages/transfers.dart';
import 'package:wild_sport/helpers/drawerCard.dart';
import 'package:wild_sport/helpers/leagueBox.dart';

import '../helperPages/pickTeam1.dart';
class FantasyScreen1 extends StatefulWidget {
  @override
  _FantasyScreen1State createState() => _FantasyScreen1State();
}

class _FantasyScreen1State extends State<FantasyScreen1> {
  String white = 'assets/images/whiteBackground.jpg';
  String dark = 'assets/images/darkBackground.jpg';
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(isDark? dark : white),
                  fit: BoxFit.cover
              )
          ),
        ),
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              padding: EdgeInsets.all(2),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),
        Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "FANTASY",
                        style: GoogleFonts.bebasNeue(
                          letterSpacing: 2,
                          fontSize: 60,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffF9EBF3),
                        )
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gameweek 25",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Text(
                              "Wednesday, Jan 5",
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                letterSpacing: 1,
                                fontSize: 12,
                                fontWeight: FontWeight.w300
                              ),
                            )
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              color: Colors.black12,
                              padding: EdgeInsets.all(2),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.white54, width: 1
                                    )
                                  ),
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Points",
                                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        "40",
                                        style: Theme.of(context).textTheme.displayMedium,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.black26,
                              child: Icon(Icons.arrow_back_ios, color: Colors.white54, size: 15,),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.black26,
                              child: Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 15,),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Divider(
                    thickness: 1,
                    color: Colors.white30,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          FantasyBlock(
                            title: Text("Transfer", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Color(0xff08313A)
                            ),),
                            icon: Icon(Icons.compare_arrows, color: Color(0xff08313A),),
                            info: Text(
                                "Make changes to your squad list",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Color(0xff08313A),
                              )
                            ),
                            page: 0,
                          ),
                          FantasyBlock(
                            title: Text("Pick Team", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Color(0xff08313A)
                            ),),
                            icon: Icon(Icons.compare, color: Color(0xff08313A),),
                            info: Text(
                                "Pick that winning gameweek line-up",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Color(0xff08313A)
                              ),
                            ),
                            page: 1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          FantasyBlock(
                            title: Text("Table", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Color(0xff08313A)
                            ),),
                            icon: Icon(Icons.table_chart_outlined, color: Color(0xff08313A),),
                            info: Text(
                                "Check out the status of your favourite teams",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Color(0xff08313A),
                                )
                            ),
                            page: 0,
                          ),
                          FantasyBlock(
                            title: Text("Fixtures", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Color(0xff08313A)
                            ),),
                            icon: Icon(Icons.theater_comedy, color: Color(0xff08313A),),
                            info: Text(
                              "Check out hottest matches",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Color(0xff08313A)
                              ),
                            ),
                            page: 1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          FantasyBlock(
                            title: Text("Player Stats", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Color(0xff08313A)
                            ),),
                            icon: Icon(Icons.waterfall_chart, color: Color(0xff08313A),),
                            info: Text(
                                "Check out the status of your favourite players",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Color(0xff08313A),
                                )
                            ),
                            page: 0,
                          ),
                          FantasyBlock(
                            title: Text("Set Pieces", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Color(0xff08313A)
                            ),),
                            icon: Icon(Icons.local_fire_department_outlined, color: Color(0xff08313A),),
                            info: Text(
                              "Wondering who takes set pieces regularly?",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Color(0xff08313A)
                              ),
                            ),
                            page: 1,
                          ),
                        ],
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),

                      )
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Color(0xff08313A).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(5)
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Leagues",
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: Color(0xff08313A),
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: Color(0xff08313A)
                              )
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Rank",
                                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                    color: Color(0xff08313A),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "League",
                                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                    color: Color(0xff08313A),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        LeagueBox(),
                        LeagueBox(),
                        LeagueBox(),
                        LeagueBox(),
                        SizedBox(height: 20,)
                      ],
                    )
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}