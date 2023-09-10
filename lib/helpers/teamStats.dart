import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/helpers/teamStatsBlocks.dart';
import 'package:wild_sport/models/teamsModel.dart';

class TeamStats extends StatefulWidget {
  @override
  State<TeamStats> createState() => _TeamStatsState();
}

class _TeamStatsState extends State<TeamStats> {
  TeamController _teamController = Get.find<TeamController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_teamController.fetchTeamGoals();
  }

  var activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Team> goal = _teamController.getTeamGoal;
    List<Team> loss = _teamController.getTeamLoss;
    List<Team> win = _teamController.getTeamWin;
    List<Team> draw = _teamController.getTeamDraw;
    var _slides = [["Most Goals For", goal[0].imageUrl, goal[0].goals, goal[0].name],
      ["Most Games Lost",  loss[0].imageUrl, loss[0].loss, loss[0].name],
      ["Most Wins",  win[0].imageUrl, win[0].win, win[0].name],
      ["Most Draws",  draw[0].imageUrl, 13 , draw[0].name],
    ];
    return Container(
      child:           Column(
        children: [
          CarouselSlider.builder(
              itemCount: _slides.length,
              itemBuilder: (context, index, realIndex) {
                final aSlide = _slides[index];
                return TeamStatsBlocks(
                  name: aSlide[3],
                  category: aSlide[0],
                  team: aSlide[1],
                  stat: aSlide[2],
                );
              },
              options: CarouselOptions(
                  height: 200,
                  enableInfiniteScroll: false,
                  disableCenter: true,
                  onPageChanged: (index, reason) => {
                    setState(() => activeIndex = index)
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
