import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/controllers/matchesController.dart';
import 'package:wild_sport/helpers/matchBox.dart';
import 'package:wild_sport/models/matchesModel.dart';

class Match1 extends StatefulWidget {
  @override
  _Match1State createState() => _Match1State();

}

class _Match1State extends State<Match1> with TickerProviderStateMixin{

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
            SliverToBoxAdapter(
              child: SizedBox(height: Get.size.height * 0.07,),
            ),
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
