import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wild_sport/controllers/matchesController.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/models/matchesModel.dart';
import 'package:wild_sport/morePages/selectMatch.dart';
import 'package:wild_sport/morePages/updateMatch.dart';

class MatchManagement1 extends StatefulWidget {
  @override
  _MatchManagement1State createState() => _MatchManagement1State();

}

class _MatchManagement1State extends State<MatchManagement1> with SingleTickerProviderStateMixin{

  final _gameWeek = ["Gameweek 1", "Gameweek 2", "Gameweek 3", "Gameweek 4", "Gameweek 5", "Gameweek 6", "Gameweek 7", "Gameweek 8", "Gameweek 9", "Gameweek 10", "Gameweek 11"];
  late MatchesController _matchesController;
  var _activeIndex = 0;
  late TabController _tabController;
  // ignore: prefer_typing_uninitialized_variables
  late Map<int, List<Match>> groupedMatches;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _matchesController = Get.find<MatchesController>();
    groupedMatches = groupBy(_matchesController.myMatches, (obj) => obj.gameWeek);
    _tabController = TabController(length: 11, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  void _handleTabChange() {
    setState(() {
      _activeIndex = _tabController.index;
    });
  }

  bool isDark = Get.isDarkMode;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: SizedBox(width: 0,),
              leadingWidth: 0,
              bottom: TabBar(
                isScrollable: true,
                labelColor: Get.theme.primaryColorDark,
                indicatorColor: Get.theme.primaryColorDark,
                controller: _tabController,
                tabs: _gameWeek.map((gameweek) {
                  int index = _gameWeek.indexOf(gameweek);
                  return Tab(
                    text: gameweek,
                  );
                }).toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: TabBarView(
                        controller: _tabController,
                        children: groupedMatches.values.map((gameweek){
                          return Container(
                            //height: 600,
                            alignment: Alignment.topCenter,
                            color: Colors.green,
                            child: MatchBox(
                              gameweek: gameweek,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MatchBox extends StatefulWidget {
  final List<Match> gameweek;

  MatchBox({required this.gameweek});

  @override
  State<MatchBox> createState() => _MatchBoxState();
}

class _MatchBoxState extends State<MatchBox> {
  late Map<DateTime?, List<Match>> matchdays;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matchdays = groupBy(widget.gameweek, (obj) => obj.date);
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border(
              top: BorderSide(
                color: isDark? Colors.white30 : Colors.black38,
                width: 1,
              ),
              bottom: BorderSide(
                color: isDark? Colors.white30 : Colors.black38,
                width: 1,
              )
          )
      ),
      padding: EdgeInsets.all(10),
      child: ListView(
        children: matchdays.entries.map((entry) {
          return GameweekTile(
              dateTime: entry.key,
              matches: entry.value);
        }).toList(),
      ),
    );
  }
}

class GameweekTile extends StatelessWidget {
  final DateTime? dateTime;
  final List<Match> matches;

  const GameweekTile({super.key, required this.dateTime, required this.matches});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(DateFormat('EEEE, MMM d, y').format(dateTime!)),
        ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: matches.map((match){
            return MatchTile(
              match: match,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class MatchTile extends StatelessWidget {
  final Match match;
  final TeamController _teamController = Get.find<TeamController>();

  MatchTile({super.key, required this.match});
  bool isDark = Get.isDarkMode;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onPanEnd: null,
      onPanUpdate: null,
      onPanStart: null,
      onTap: (){
        Get.to(()=>UpdateMatch(match: match.obs));
      },
      child: Container(
        margin: EdgeInsets.only(top: 4),
        height: 80,
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                  color: isDark? Colors.white10 : Colors.black12,
                  width: 1,
                )
            )
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      _teamController.getTeams.firstWhere(
                              (obj) => obj.id == match.homeTeam
                      ).name,
                      //match.homeTeam
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.network(
                      _teamController.getTeams.firstWhere(
                              (obj) => obj.id == match.homeTeam
                      ).imageUrl,
                      height: 35,
                      width: 35,
                      fit: BoxFit.contain,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                          return Center(
                            child: Image.asset(
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
                          child: Image.asset(
                            'assets/icons/badgePlaceholder.webp',
                            fit: BoxFit.contain,
                            height: 25,
                            width: 25,
                          ),
                        );
                      },
                    ),
                  ),
                  //Icon(Icons.add_location)
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text("Score"),
                  Text("Time"),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.network(
                      _teamController.getTeams.firstWhere(
                              (obj) => obj.id == match.awayTeam
                      ).imageUrl,
                      height: 35,
                      width: 35,
                      fit: BoxFit.contain,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                          return Center(
                            child: Image.asset(
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
                          child: Image.asset(
                            'assets/icons/badgePlaceholder.webp',
                            fit: BoxFit.contain,
                            height: 25,
                            width: 25,
                          ),
                        );
                      },
                    ),
                  ),
                  //Icon(Icons.add_location),
                  Container(
                    width: 100,
                    child: Text(
                      _teamController.getTeams.firstWhere(
                              (obj) => obj.id == match.awayTeam
                      ).name,
                      //match.awayTeam
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
