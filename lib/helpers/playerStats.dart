import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/helpers/playerStatsBlocks.dart';
import 'package:wild_sport/models/playerModel.dart';

class PlayerStats extends StatefulWidget {
  @override
  State<PlayerStats> createState() => _PlayerStatsState();
}

class _PlayerStatsState extends State<PlayerStats> {
  TeamController _teamController = Get.find<TeamController>();
  var activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Player> goal = _teamController.getPlayerGoal;
    List<Player> assist = _teamController.getPlayerAssist;
    List<Player> appearance = _teamController.getPlayerAppearances;
    List<Player> cleanSheet = _teamController.getPlayerCleanSheets;
    var _slides = [
      ["Most Goals", goal[0].imageUrl, goal[0].goals, goal[0].name,  goal[0].id],
      ["Most Assists", assist[0].imageUrl, assist[0].assists, assist[0].name, assist[0].id],
      ["Most Appearances", appearance[0].imageUrl, appearance[0].appearances, appearance[0].name, appearance[0].id],
      ["Most Clean Sheets",  cleanSheet[0].imageUrl, cleanSheet[0].cleanSheets, cleanSheet[0].name, cleanSheet[0].id],
    ];
    return Container(
      child: Column(
        children: [
          CarouselSlider.builder(
              itemCount: _slides.length,
              itemBuilder: (context, index, realIndex) {
                final aSlide = _slides[index];
                return PlayerStatsBlocks(
                  id: aSlide[4],
                  name: aSlide[3],
                  category: aSlide[0],
                  player: aSlide[1],
                  stat: aSlide[2],
                );
              },
              options: CarouselOptions(
                  height: 200,
                  enableInfiniteScroll: false,
                  disableCenter: true,
                  onPageChanged: (index, reason) => {
                    setState(()=> activeIndex = index,)
                  }
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: _slides.length,
              effect:  ScrollingDotsEffect(
                dotWidth: 8,
                dotHeight: 8,
                activeDotColor: Colors.black54,
                dotColor: Colors.black26,
              ),
            ),
          )
        ],
      ),
    );
  }
}
