import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:wild_sport/helperPages/statsTile.dart';
import 'package:wild_sport/helpers/playerStats.dart';
import 'package:wild_sport/helpers/teamStats.dart';
import 'package:wild_sport/stat_pages/alltime_stats.dart';
import 'package:wild_sport/stat_pages/player_comparison.dart';
import 'package:wild_sport/stat_pages/records.dart';
import 'package:wild_sport/stat_pages/season_stats.dart';
import 'package:wild_sport/themes/theme_manager.dart';

class StatsScreen1 extends StatefulWidget {
  @override
  _StatsScreen1State createState() => _StatsScreen1State();
}

class _StatsScreen1State extends State<StatsScreen1> {
  var activeIndex;
  var body = [TeamStats(), PlayerStats()];
  CarouselController switchCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    var themeController = Get.put(ThemeManager());
    bool isDark = Get.isDarkMode;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Get.theme.primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(35),
                bottomLeft: Radius.circular(35),
              )
            ),
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(18),
                child:  Column(
                  children: [
                    SizedBox(height: 25,),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Statistics",
                        style: Get.theme.textTheme.headlineMedium?.copyWith(
                          color: isDark? Colors.white : Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                    Container(
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
                        textOff : "Team",
                        textOn : "Player",
                        contentSize: 15,
                        colorOn : isDark? Colors.white: Colors.black,
                        colorOff : isDark? Colors.white : Colors.black,
                        background : isDark? Get.theme.scaffoldBackgroundColor : Color(0xffe4e5eb),
                        buttonColor : isDark? Color(0xff00493A) : Color(0xfff7f5f7),
                        inactiveColor : const Color(0xff636f7b),
                      )
                    ),
                  ],
                ),
              ),
            ),
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
                  height: 250,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) => {
                    activeIndex = index,
                  }
              )
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                StatsTile(
                  page: SeasonStats(),
                  title: "Season Stats",
                ),
                StatsTile(
                  page: AlltimeStats(),
                  title: "All-time Stats",
                ),
                StatsTile(
                  page: Records(),
                  title: "Records",
                ),
                StatsTile(
                  page: PlayerComparison(),
                  title: "Player Comparison",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
